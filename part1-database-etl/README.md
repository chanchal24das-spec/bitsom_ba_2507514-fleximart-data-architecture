# Assignment Overview – FlexiMart Data Management Project

This assignment focuses on building a complete data management solution for **FlexiMart**, starting from raw data ingestion to meaningful business insights. The objective is to demonstrate my understanding of **ETL processes, relational database design, data quality handling, and SQL-based business analysis** using real-world scenarios.

The assignment is divided into **three major tasks**, each addressing a critical stage of the data lifecycle.

---

## Task 1.1: ETL Pipeline Implementation

In this task, I implement an **end-to-end ETL (Extract, Transform, Load) pipeline** using Python. The goal is to clean and prepare raw customer, product, and sales data provided in CSV format and load it into a structured relational database.

I extract data from multiple CSV files containing intentional data quality issues such as missing values, duplicates, inconsistent formats, and invalid references. During the transformation phase, I handle these issues by removing duplicates, standardizing formats (such as phone numbers, dates, and categories), managing missing values appropriately, and ensuring data integrity. Finally, I load the cleaned data into a MySQL/PostgreSQL database using the given schema, with proper error handling and logging.

This task demonstrates my ability to work with messy real-world data and convert it into reliable, analysis-ready datasets.

---

## Task 1.2: Database Schema Documentation

In this task, I document the **FlexiMart relational database schema** in a clear and structured manner. I describe each entity (customers, products, orders, and order_items), their attributes, and the relationships between them.

Additionally, I explain how the database design follows **Third Normal Form (3NF)** by identifying functional dependencies and showing how the schema avoids update, insert, and delete anomalies. I also include sample data representations to help visualize how records are stored across different tables.

This task highlights my understanding of **database normalization, relational design principles, and technical documentation**.

---

## Task 1.3: Business Query Implementation

In the final task, I write **SQL queries** to answer key business questions using the cleaned and structured data. These queries focus on customer purchasing behavior, product category performance, and monthly sales trends.

I use joins across multiple tables, aggregate functions, `GROUP BY` and `HAVING` clauses, and window functions to generate meaningful insights. Each query is designed to meet specific business requirements and produce accurate, well-formatted results.

This task demonstrates my ability to translate business questions into **efficient SQL queries** and perform **data-driven analysis** using a relational database.

---

## Conclusion

Overall, this assignment showcases my practical skills in **ETL development, data cleaning, database design, normalization, and SQL analytics**. It reflects a complete workflow—from raw data ingestion to structured storage and insightful reporting—similar to what is expected in real-world data engineering and analytics roles.

