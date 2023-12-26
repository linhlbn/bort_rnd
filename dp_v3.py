import os
import asyncio
import asyncpg
from google.cloud import storage
from langchain.document_loaders import PyPDFLoader
from langchain.embeddings.openai import OpenAIEmbeddings
from langchain.text_splitter import RecursiveCharacterTextSplitter
from dotenv import load_dotenv, find_dotenv
from sql_queries import embedding_related_created_queries, insert_query

load_dotenv(find_dotenv())

class StorageManager:
    def __init__(self, service_account_json, bucket_name):
        self.client = storage.Client.from_service_account_json(service_account_json)
        self.bucket = self.client.bucket(bucket_name)

    def fetch_pdf_filenames(self):
        return [(blob.name, os.path.basename(blob.name)) for blob in self.bucket.list_blobs() if blob.name.lower().endswith('.pdf')]

class DatabaseManager:
    def __init__(self, db_credentials):
        self.db_credentials = db_credentials
        self.pool = None

    async def create_pool(self):
        if not self.pool:
            self.pool = await asyncpg.create_pool(**self.db_credentials)

    async def close_pool(self):
        if self.pool:
            await self.pool.close()
            self.pool = None

    async def create_tables(self):
        await self.create_pool()
        async with self.pool.acquire() as conn:
            for query in embedding_related_created_queries:
                await conn.execute(query)

    async def document_exists(self, filename):
        async with self.pool.acquire() as conn:
            return await conn.fetchval(
                "SELECT EXISTS(SELECT 1 FROM document_storage WHERE document_storage_filename = $1)",
                filename
            )

    async def insert_document_storage(self, dir_name, filename, is_embedded):
        async with self.pool.acquire() as conn:
            if not await self.document_exists(filename):
                await conn.execute(
                    "INSERT INTO document_storage (document_storage_dir, document_storage_filename, is_document_embedded) "
                    "VALUES ($1, $2, $3)",
                    dir_name, filename, is_embedded
                )

    async def fetch_documents_to_embed(self):
        async with self.pool.acquire() as conn:
            return await conn.fetch(
                "SELECT document_storage_filename FROM document_storage WHERE is_document_embedded = false"
            )

    async def insert_document_embedding(self, chunk_file, privilege_id, tag, page_content, embedding):
        async with self.pool.acquire() as conn:
            await conn.execute(
                "INSERT INTO document_embedding (chunk_file, privilege_id, tag, page_content, embedding) "
                "VALUES ($1, $2, $3, $4, $5)",
                chunk_file, privilege_id, tag, page_content, embedding
            )

    async def set_document_embedded(self, filename):
        async with self.pool.acquire() as conn:
            await conn.execute(
                "UPDATE document_storage SET is_document_embedded = true WHERE document_storage_filename = $1",
                filename
            )

class DocumentManager:
    def __init__(self, storage_manager, database_manager, openai_api_key):
        self.storage_manager = storage_manager
        self.database_manager = database_manager
        self.openai_api_key = openai_api_key

    async def process_and_embed_documents(self):
        pdf_files = self.storage_manager.fetch_pdf_filenames()
        await self.database_manager.create_pool()  # Ensure the connection pool is created
        files_to_embed = [filename for _, filename in pdf_files]
        files_to_embed_records = await self.database_manager.fetch_documents_to_embed()

        # Filter the files based on whether they need to be embedded.
        files_to_embed = {record['document_storage_filename'] for record in files_to_embed_records}.intersection(files_to_embed)

        embeddings = OpenAIEmbeddings(api_key=self.openai_api_key)
        text_splitter = RecursiveCharacterTextSplitter(separators=[".", "\n"], chunk_size=1536, chunk_overlap=0)

        # Process the documents
        for file_path, file_name in pdf_files:
            if file_name in files_to_embed:
                # print(f'{file_name} file needs to be embedd')
                blob = self.storage_manager.bucket.blob(file_path)
                print(file_path)
                # local_file_path = f"{}"
                print(local_file_path)
                blob.download_to_filename(local_file_path)

                # Load the document content
                loader = PyPDFLoader(local_file_path)
                document = loader.load()

                # Split and embed the text
                splits = text_splitter.split_documents(document)
                doc_vectors = embeddings.embed_documents([t.page_content for t in texts]) 

                i = -1
                
                for split in splits:
                    # Insert embedding into the database
                    print(doc_vectors)
                    i += 1
                    await self.database_manager.insert_document_embedding(i, 4, 'CV', split.page_content, doc_vectors[i])  # Adjust the i+1 based on your chunk_file id strategy
                    
                # Update the document_storage as embedded
                await self.database_manager.set_document_embedded(file_name)

        # After processing, close the pool
        await self.database_manager.close_pool()
        print('Done')

async def main():
    db_manager = DatabaseManager({
        'host': os.getenv('DB_HOST'),
        'database': os.getenv('DB_NAME'),
        'user': os.getenv('DB_USER'),
        'password': os.getenv('DB_PASS'),
        'port': os.getenv('DB_PORT')
    })
    # # Initialize the pool and create tables
    storage_manager = StorageManager(os.getenv('STORAGE_SERVICE_JSON'), os.getenv('STORAGE_NAME'))
    document_manager = DocumentManager(storage_manager, db_manager, os.getenv('OPENAI_API_KEY'))
    # # Process documents
    await document_manager.process_and_embed_documents()

if __name__ == "__main__":
    asyncio.run(main())