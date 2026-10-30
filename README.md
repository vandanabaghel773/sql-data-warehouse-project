# SQL Data Warehouse Project

## 📌 Overview
Building a modern **SQL Server Data Warehouse** by integrating CRM and ERP data using the Medallion Architecture.

## 📁 Project Structure
```text
sql-data-warehouse-project/
├── 00_setup/       # Setup guide
├── 01_datasets/    # CRM and ERP CSV files
├── 02_docs/        # Documentation and diagrams
├── 03_scripts/     # SQL scripts
│   ├── bronze/     # Raw data ingestion
│   ├── silver/     # Data cleaning
│   └── gold/       # Analytics-ready data
└── 04_tests/       # Data quality tests
```

## 🏗️ Data Architecture
The project follows the **Medallion Architecture**:

- **Bronze:** Stores raw data from source systems.
- **Silver:** Cleans, standardizes, and transforms data.
- **Gold:** Stores business-ready data for reporting and analytics.

## 🎯 Objectives
- Integrate CRM and ERP data.
- Build ETL pipelines using SQL Server.
- Perform data cleaning and transformation.
- Design fact and dimension tables.
- Analyze customer behavior, product performance, and sales trends.

## 🛠️ Tech Stack
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL (DDL, DML, Stored Procedures, ETL)
- Git & GitHub
- Draw.io

## 🚀 Setup
1. Follow the setup guide in `00_setup/`.
2. Configure SQL Server and create the database.
3. Update CSV file paths in the Bronze loading procedure.
4. Execute scripts in order: Bronze → Silver → Gold.
5. Run data quality tests.

**Note:** Update dataset paths according to your local system.
