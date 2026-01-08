# Assignment Overview

## FlexiMart Data Warehouse, Star Schema & OLAP Analytics

This assignment focuses on designing, implementing, and analyzing a data warehouse solution for FlexiMart to support historical sales analysis and business decision-making. The work is divided into three structured tasks that collectively demonstrate my understanding of dimensional modeling, data warehousing concepts, and OLAP-based analytical querying.

---

## Task 3.1: Star Schema Design Documentation

In this task, I designed a **star schema** to model FlexiMart’s sales data in a way that supports efficient analytical reporting. The schema is centered around a **fact_sales** table at the transaction line-item level, capturing measurable sales metrics such as quantity sold, unit price, discounts, and total sales amount.

Supporting this fact table are three well-defined dimension tables: **dim_date**, **dim_product**, and **dim_customer**. Each dimension provides descriptive attributes that enable time-based analysis, product performance analysis, and customer behavior analysis. The design decisions explain the choice of granularity, the use of surrogate keys, and how the schema enables drill-down and roll-up operations. This task establishes a strong conceptual foundation for analytical processing.

---

## Task 3.2: Star Schema Implementation

In this task, I implemented the designed star schema in a relational database environment using SQL. The exact schema provided was used to create all fact and dimension tables without modification, ensuring referential integrity through primary and foreign key constraints.

I populated the data warehouse with realistic and sufficient sample data, including dates across January and February 2024, multiple products across different categories, customers from various cities and states, and sales transactions that reflect real-world purchasing patterns such as higher weekend sales and varied quantities and prices. This task demonstrates my ability to translate a conceptual data warehouse design into a working physical implementation.

---

## Task 3.3: OLAP Analytics Queries

In the final task, I developed OLAP-style analytical SQL queries to extract meaningful business insights from the data warehouse. These queries address key business scenarios, including time-based sales drill-down analysis, top product performance evaluation, and customer value segmentation.

The queries utilize joins between fact and dimension tables, aggregations, window-style calculations, and CASE-based segmentation logic. Together, they demonstrate practical application of OLAP concepts such as drill-down analysis, ranking, and customer segmentation, enabling management and business teams to make data-driven decisions.

---

## Overall Learning Outcome

Through these three tasks, I gained hands-on experience in end-to-end data warehousing—from schema design and implementation to advanced analytical querying. This assignment showcases my ability to design scalable analytical models, ensure data integrity, and generate actionable insights using SQL in a business-oriented context.
