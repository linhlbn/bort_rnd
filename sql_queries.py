# CREATED embedding_related_created_queries

document_embedding_created = """
CREATE TABLE if not exists document_embedding (
    Document_Embedding_id SERIAL PRIMARY KEY,
    chunk_file INT,
    privilege_id INT,
    tag varchar(100),
    page_content TEXT,
    embedding VECTOR(1536),
    FOREIGN KEY (privilege_id) REFERENCES privilege(privilege_id),
    FOREIGN KEY (document_storage_id) REFERENCES document_storage(document_storage_id)
);
"""

document_storage_created = """
create table if not exists document_storage(
    document_storage_id SERIAL PRIMARY KEY,
    document_storage_dir varchar(5000),
    document_storage_filename varchar(1000),
    document_info_type varchar(100),
    is_document_embedded BOOLEAN
)"""

document_created = """
CREATE TABLE if not exists Document (
    document_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    created_date TIMESTAMP,
    storage_url VARCHAR(300),
    doc_type_id INT,
    privilege_id INT,
    page_content TEXT,
    embedding VECTOR(1536),
    FOREIGN KEY (doc_type_id) REFERENCES DocumentType(doc_type_id),
    FOREIGN KEY (privilege_id) REFERENCES Privilege(privilege_id)
);
"""

embedding_related_created_queries = [document_created, document_embedding_created, document_storage_created]


insert_query = """
    INSERT INTO document_embedding (chunk_file, privilege_id, tag, page_content, embedding) VALUES ($1, $2, $3, $4, $5);
"""


embedding_insert = [insert_query]