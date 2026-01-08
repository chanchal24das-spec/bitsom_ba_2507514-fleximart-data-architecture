# Bitsom_ba_2507514-fleximart-data-architecture

Module 2: Assignment: AI Data Architecture Design and Implementation

# FlexiMart Data Architecture Project

**Student Name:** Chanchal Das

**Student ID:** BITSOM_BA_2507514

**Email:** chanchal24das@gmail.com

**Date:** 06-01-2026

## Project Overview

I designed and implemented an end-to-end ETL pipeline to ingest raw CSV data and load it into a relational database after performing necessary data cleaning and transformations.
I created detailed database documentation, clearly defining the schema, tables, keys, and relationships to ensure data integrity and easy understanding for future use.
Using SQL, I answered specific business queries by writing optimized queries to extract meaningful insights and support decision-making.
I analyzed product data requirements and implemented NoSQL solutions using MongoDB, designing collections and writing queries suited for flexible and scalable data storage.
Finally, I built a data warehouse using a star schema, defining fact and dimension tables, and generated analytical reports to support high-level business analysis and reporting.

## Repository Structure

The project is organized into three main parts, each corresponding to a specific phase of the assignment. 
The structure below clearly separates ETL, NoSQL, and Data Warehouse components for better readability and maintainability.


Data
- customers_raw.csv  
- products_raw.csv  
- sales_raw.csv  

part1-database-etl/
- etl_pipeline.py
- business_queries.sql
- schema_documentation.md
- data_quality_report.txt
- requirements.txt
- README.md

part2-nosql/
- mongodb_operations.js
- nosql_analysis.md
- products_catalog.json
- README.md

part3-datawarehouse/
- star_schema_design.md
- warehouse_schema.sql
- warehouse_data.sql
- analytics_queries.sql
- README.md  

## Technologies Used

- Python 3.9, pandas, mysql-connector-python
- MySQL 8.0
- MongoDB 6.0
- pandas,
- mysql-connector-python
- VS Code
- MySQL Workbench
- MongoDB Compass

# Setup Instructions

## Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

## Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py

## Run Part 1 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

## Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql


## MongoDB Setup

mongosh < part2-nosql/mongodb_operations.js

## Key Learnings

-- Designing robust ETL pipelines for imperfect real-world data
-- Choosing between relational and NoSQL databases based on use cases
-- Applying dimensional modeling concepts for analytics
-- Writing efficient SQL for both OLTP and OLAP systems

# Challenges Faced & Solutions

## Technical Challenges and Solutions

- **Inconsistent and Ambiguous Date Formats**
  - Raw CSV files contained mixed date formats (`YYYY-MM-DD`, `DD/MM/YYYY`, `MM-DD-YYYY`) within the same columns.
  - This caused parsing warnings and risked incorrect date interpretation during ETL.
  - **Solution:** Implemented a custom date-parsing function that explicitly attempted known formats in sequence.
  - Invalid or unparseable dates were converted to `NULL` to ensure consistent `DATE` values in MySQL.

- **Duplicate Records and Missing Foreign Keys in Sales Data**
  - The sales dataset included duplicate transactions and records with missing `customer_id` or `product_id`.
  - Direct loading would have caused foreign key constraint violations and inaccurate analytics.
  - **Solution:** Removed duplicate transactions during transformation.
  - Excluded records with missing foreign keys before loading to maintain referential integrity.

- **Referential Integrity Enforcement During Load**
  - Ensured that `customers` and `products` data was loaded before `orders` and `order_items`.
  - Prevented load-time failures by validating foreign key references during transformation.

- **MongoDB’s aggregation pipeline can be difficult to understand initially.
  - Analytical queries seems complex compared to SQL.
  - MongoDB provides powerful aggregation stages such as '$match', $group, $avg, and $sort.
  - Structured pipelines allow efficient analytical operations.

- **Data Quality Assurance and Validation**
  - Tracked record counts before and after transformation.
  - Generated a `data_quality_report.txt` summarizing duplicates removed, missing values handled, and records loaded successfully.

- **Project Outcome**
  - Successfully completed an end-to-end ETL pipeline with clean, validated, and analysis-ready data.
  - Improved understanding of data cleaning, ETL robustness, SQL execution environments, and database integrity constraints.





