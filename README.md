# bitsom_ba_2507514-fleximart-data-architecture
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
├── part1-database-etl/
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   └── data_quality_report.txt
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js
│   └── products_catalog.json
├── part3-datawarehouse/
│   ├── star_schema_design.md
│   ├── warehouse_schema.sql
│   ├── warehouse_data.sql
│   └── analytics_queries.sql
└── README.md

## Technologies Used

- Python 3.9, pandas, mysql-connector-python
- MySQL 8.0
- MongoDB 6.0

## Setup Instructions

# Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py

# Run Part 1 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql


### MongoDB Setup

mongosh < part2-nosql/mongodb_operations.js

## Key Learnings

-- Designing robust ETL pipelines for imperfect real-world data
-- Choosing between relational and NoSQL databases based on use cases
-- Applying dimensional modeling concepts for analytics
-- Writing efficient SQL for both OLTP and OLAP systems

## Challenges Faced & Solutions

- Handling inconsistent source data
  -- Solved by implementing validation, standardization, and default handling in the ETL layer.

- Designing a scalable analytics model
  -- Solved by using a star schema with surrogate keys and proper granularity.



