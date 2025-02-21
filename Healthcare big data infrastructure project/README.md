# Healthcare Big Data Infrastructure & KPI Reporting 🚀  

## Overview  
This project builds an **end-to-end data pipeline** for **Healthcare Revenue Cycle Management (RCM)** using **Azure Data Engineering tools**. The pipeline processes **Electronic Medical Records (EMR), Insurance Claims, and ICD/NPI API data**, leveraging **Medallion Architecture (Bronze → Silver → Gold)** for data transformation and reporting.  

## 🔹 Architecture Diagram  
Architecture diagram.jpg

## 🏗️ Tech Stack  
- **Cloud Platform**: Microsoft Azure  
- **Data Ingestion**: Azure Data Factory  
- **Storage & Compute**: ADLS Gen2, Databricks, Delta Lake  
- **Data Processing**: Apache Spark, PySpark, SQL  
- **Orchestration**: Azure Synapse Analytics  
- **Visualization**: Power BI  
- **Security & Governance**: Azure Key Vault, Entra ID  

## 📊 Business Use Case: Revenue Cycle Management (RCM)  
RCM is the financial process used by hospitals from **patient visits to payments**. This project enables:  
✅ **Tracking & minimizing Accounts Receivable (AR) aging**  
✅ **Analyzing claim approvals, rejections & follow-ups**  
✅ **Developing KPIs for revenue forecasting & payment cycles**  

## 🏗️ Medallion Architecture  
This project follows **Medallion Architecture (Bronze → Silver → Gold)**:  
- **Bronze Layer**: Raw ingestion from **EMR DB, Claims (Flat Files), ICD/NPI APIs**  
- **Silver Layer**: Cleaned, transformed data (SCD Type 2 applied)  
- **Gold Layer**: Aggregated Fact & Dimension tables for KPI reporting  

## 📌 Key Features  
✅ **Automated Data Ingestion Pipeline** with ADF  
✅ **Incremental & Full Data Load Support**  
✅ **SCD Type 2 for historical tracking**  
✅ **Delta Tables for optimized performance**  
✅ **Power BI dashboards for business insights**  

## 📊 KPI Metrics Implemented  
🔹 **AR Aging (Accounts Receivable > 90 Days)**  
🔹 **Days in AR (Average Collection Period)**  
🔹 **Claim Approval Rate & Denial Patterns**  
🔹 **Insurance vs. Patient Payment Distribution**  

## 📂 Project Structure  
```
/Healthcare-Big-Data-Infrastructure
│── /data_ingestion                 # Azure Data Factory (ADF) Pipelines  
│── /data_transformation            # Databricks Notebooks (PySpark)  
│── /delta_lake                      # Delta Tables (Bronze, Silver, Gold)  
│── /kpi_reporting                   # Power BI Reports & Dashboards  
│── /architecture_diagram.jpg          # Project Architecture  
│── README.md                        # Documentation  
```

## 🚀 Setup Instructions  
1️⃣ Clone the repo:  
```sh
git clone https://github.com/MoinS11/Data-Engineering-and-Reporting.git
cd Healthcare-Big-Data-Infrastructure
```  
2️⃣ Configure **Azure Services** (ADF, ADLS Gen2, Databricks, Key Vault).  
3️⃣ Deploy **Delta Lake Storage** and create Medallion tables.  
4️⃣ Run **Databricks Notebooks** for data transformation.  
5️⃣ Load the **Power BI Dashboard** for KPI visualization.  

## 📩 Contact  
For questions or collaboration, reach out via:  
📧 Email: soorya.m@northeastern.edu  
🔗 [LinkedIn](https://www.linkedin.com/in/moinsoorya)  
