import os
import openai
import sys
from datetime import datetime, timedelta

from sql_queries import embedding_related_created_queries

from google.cloud.sql.connector import Connector
from google.cloud import storage
import asyncio
import asyncpg
import nest_asyncio
import pickle

from pgvector.asyncpg import register_vector
from langchain.document_loaders import PyPDFLoader
from langchain.document_loaders import WebBaseLoader
from langchain.embeddings.openai import OpenAIEmbeddings

from langchain.text_splitter import RecursiveCharacterTextSplitter

import pandas as pd
import emoji
from edt import CI, CO, CR, CP
import json

async def embedding_process(files_dict, CI, CR, CP, CO, chosen_categories, timer):
    
    count_filename = 'count.json'
    count = await load_count(count_filename)

    conn = await asyncpg.connect(
        host=os.getenv('DB_HOST'),
        database=os.getenv('DB_NAME'),
        user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASS'),
        port=os.getenv('DB_PORT')
    )


    existing_doc_codes = {record['doc_code'] for record in await conn.fetch('SELECT DISTINCT(doc_code) FROM document_embedding')}
    
    # Assuming the 'vector' extension and a function to register it is handled here
    await conn.execute("CREATE EXTENSION IF NOT EXISTS vector")
    await register_vector(conn)

    await asyncio.sleep(3)

    try: 
        is_stop = False
        
        for category_key, filenames in files_dict.items():
            
            if category_key in chosen_categories:

                if is_stop:
                    break
                
                checker = False
                for idx, file in enumerate(filenames, start=1):

                    if is_stop:
                        break
                    if checker:
                        await asyncio.sleep(timer*3)
                        checker = False
                        
                    
                    local_file_path = os.path.join(download_directory, file)
                    
                    doc_code = f"{category_key}{idx}"
                    
                    doc_type_map = {'CR': 3, 'CI': 1, 'CP': 2, 'CO': 4}
                    
                    doc_type = doc_type_map[category_key]
                    
                    embedd_doc_type = None
                    if category_key == 'CR':
                        embedd_doc_type = CR
                    if category_key == 'CI':
                        embedd_doc_type = CI
                    if category_key == 'CP':
                        embedd_doc_type = CP
                    if category_key == 'CO':
                        embedd_doc_type = CO
    
                    if doc_code not in existing_doc_codes:
                        print(f"Processing file {file} with doc_code {doc_code}")
                        
                        try:
                            
                            loaders = []
                            print(file)
                            loaders.append(PyPDFLoader(local_file_path))
                            docs = []
            
                            for loader in loaders:
                                docs.extend(loader.load())
            
                            # Split documents into chunks of text
                            text_splitter = RecursiveCharacterTextSplitter(
                                separators=[".", "\n"],
                                chunk_size=1536,
                                chunk_overlap=0
                            )
                            texts = text_splitter.split_documents(docs)
            
                            embeddings = OpenAIEmbeddings()
                            doc_vector = embeddings.embed_documents([t.page_content for t in texts])
    
                            
                            for i, split in enumerate(texts):
                                await conn.execute(
                                    '''INSERT INTO document_embedding (doc_code, doc_type, embedd_doc_type, page_content, embedding) 
                                    VALUES ($1, $2, $3, $4, $5)''',
                                    doc_code, doc_type, embedd_doc_type, split.page_content, doc_vector[i]
                                )
            
                            # Wait for timer seconds before processing the next file
                            await asyncio.sleep(timer/3)
    
                            print(f"||||  Congratulation!!! File {file} has been embedded successfully with doc_code {doc_code}!")
                            print("\n______________________ CONTINUE EMBEDDING ______________________")
                            checker = True
                            
                        except Exception as e:
                            if "rate_limit_exceeded" in str(e):
                                print(f"Process terminated due to rate limit: {e}")
                                count += 1
                                await save_count(count_filename, count)
                                print(f"\n the program RUN {count} TIME!")
                                is_stop = True
                            else:
                                print(f"Failed to process {file}: {e}")
                    else:
                        print(emoji.emojize(f":heavy_check_mark: File {file} was embedded with doc_code {doc_code}"))
    finally:
        
        await conn.close()

        if is_stop:
            print(f"\n\nProcess terminated due to rate limit")
            print("\n________________________ EMBEDDING FAIL ________________________")
        else:
            print("\____________________________ Congratulation! FINISH EMBEDDING PROCESS ____________________________")


async def periodic_run(interval, async_func, *args):
    while True:
        await async_func(*args)
        await asyncio.sleep(interval)

async def load_count(filename):
    try:
        with open(filename, 'r') as file:
            return json.load(file).get('count', 0)
    except (FileNotFoundError, json.JSONDecodeError):
        return 0

async def save_count(filename, count):
    with open(filename, 'w') as file:
        json.dump({'count': count}, file)



if __name__ == "__main__":
    try:

        sys.path.append('../..')

        from dotenv import load_dotenv, find_dotenv
        _ = load_dotenv(find_dotenv()) 

        openai.api_key  = os.environ['OPENAI_API_KEY']


        


        storage_client = storage.Client.from_service_account_json(str(os.getenv('STORAGE_SERVICE_JSON')))

        bucket_name = os.getenv('STORAGE_NAME')
        bucket = storage_client.get_bucket(bucket_name)

        blobs = bucket.list_blobs()

        download_directory = 'downloaded_files'

        # if not os.path.exists(download_directory):
        #     os.makedirs(download_directory)

        # for blob in blobs:
        #     # Get the filename from the blob
        #     dir_file_name = blob.name
        #     downloaded_file_name = dir_file_name.split('/')[-1]  
            
        #     # Check if the blob is a PDF and not a directory
        #     if downloaded_file_name.endswith('.pdf') and not dir_file_name.endswith('/'):
        #         # Pathwhere the file will be saved locally
        #         local_file_path = os.path.join(download_directory, downloaded_file_name)

        #         # Check if the file already exists
        #         if os.path.exists(local_file_path):
        #             print(f"The file {downloaded_file_name} already exists locally.")
        #         else:
        #             # Download the blob to the specified local path
        #             blob.download_to_filename(local_file_path)
        #             print(f"The file {downloaded_file_name} has been downloaded to {download_directory}.")

        # for blob in blobs:
        #     if blob.name.lower().endswith('.pdf') and not blob.name.endswith('/'): 
        #         if 'CVs/' in blob.name:
        #             doc_counts['CR'] += 1
        #             doc_code = f"CR{doc_counts['CR']}"
        #             doc_type = 3  # Candidate Resume
        #             embedd_doc_type = CR
        #             print('get CR', doc_counts)
        #         elif 'Company Information/' in blob.name:
        #             doc_counts['CI'] += 1
        #             doc_code = f"CI{doc_counts['CI']}"
        #             doc_type = 1  # Company Information
        #             embedd_doc_type = CI
        #             print('get CI', doc_counts)
        #         elif 'Company Project/' in blob.name:
        #             doc_counts['CP'] += 1
        #             doc_code = f"CP{doc_counts['CP']}"
        #             doc_type = 2  # Company Project
        #             embedd_doc_type = CP
        #             print('get CP', doc_counts)

        files_dict = {"CR": [], "CP": [], "CI": [], "CO": []}

        for b in blobs:
            if b.name.lower().endswith('.pdf'):
                if 'cvs/' in b.name.lower():
                    files_dict["CR"].append(b.name.split('/')[-1])
                elif 'company project/' in b.name.lower():
                    files_dict["CP"].append(b.name.split('/')[-1])
                elif 'company information/' in b.name.lower():
                    files_dict["CI"].append(b.name.split('/')[-1])
                elif 'company onboarding/' in b.name.lower():
                    files_dict["CO"].append(b.name.split('/')[-1])

        # Output the result
        # print(files_dict)


        # categories = ['CI', 'CR', 'CP', 'CO']

        # chosen_categories = ['CI', 'CO'] # done

        # chosen_categories = ['CP'] # done



        chosen_categories = ['CR'] # 

        timer = 15

        # loop = asyncio.get_event_loop()

        # task = loop.create_task(embedding_process(files_dict, CI, CR, CP, CO, chosen_categories, timer))
    
        # asyncio.run(embedding_process(files_dict, CI, CR, CP, CO, chosen_categories, timer))

        interval = 50  # How often to rerun the embedding process

        asyncio.run(periodic_run(interval, embedding_process, files_dict, CI, CR, CP, CO, chosen_categories, timer))
        
        

    except Exception as e:
        print(f"An error occurred: {e}")

