# Note sprint 6 - 2nd Jan 2024

Below is a comparative table describing secure data storage mechanisms for Google Cloud SQL and Google Cloud Storage in Google Cloud Platform (GCP), along with risks:

| Feature / Risk Factor          | GCP Cloud SQL                                                  | GCP Cloud Storage                                           |
|--------------------------------|----------------------------------------------------------------|-------------------------------------------------------------|
| **Type of Service**            | Relational database service for PostgreSQL. | Object storage service for data archiving, backup, and recovery. |
| **Encryption at Rest**         | Encrypted by default using Google-managed keys; also supports customer-managed encryption keys (CMEK). | Encrypted by default using Google-managed keys; supports CMEK too. |
| **Encryption in Transit**      | Supports encryption in transit using SSL (Secure Sockets Layer). | Uses HTTPS for secure data transfer.                      |
| **Access Control**             | Integrates with Cloud IAM for fine-grained access control; uses database ACLs (Access Control Lists). | Integrates with Cloud IAM for access management; supports ACLs for individual objects and buckets. |
| **Identity and Access Management (IAM)** | Relies on Cloud IAM for user and service account permissions. | Same, with cloud IAM for managing permissions.           |
| **Backup and Data Recovery**   | Offers automated backups and point-in-time recovery.             | Versioning can be enabled to recover overwritten or deleted objects. |
| **Data Import/Export**         | Data import/export via SQL dump files; supports integration with other Google services. | Bulk data upload/download using gsutil command-line tool, GCP console, or using APIs. |
| **Scalability**                | Vertical scaling (read replicas); horizontal scaling is more complex. | Highly scalable storage, with no limit on storage capacity. |
| **Compliance and Certifications** | Compliant with common standards like ISO, SOC, HIPAA depending on configuration. | Complies with similar standards, and also designed for high durability (99.999999999% annual durability). |
| **Risk: Unauthorized Access**  | If improperly configured, could allow unauthorized database access. | If permissions are not set correctly, data could become publicly accessible. |
| **Risk: Data Leakage**         | Potential risk through SQL injection if applications are not secure. | Incorrect lifecycle policies could accidentally delete necessary data. |
| **Risk: Service Limitations**  | Limited by instance size for scaling; might need to manage sharding manually for significant scale. | Service outages could affect accessibility, though GCP storage is designed for high availability. |
| **Risk: Compliance Violations**| If not configured with compliance in mind (e.g., for CMEK), could result in violations. | Same as Cloud SQL; needs proper configuration to adhere to compliance requirements. |
