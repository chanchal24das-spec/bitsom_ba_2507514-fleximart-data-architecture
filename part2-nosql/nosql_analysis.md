# FlexiMart NoSQL Analysis

## Section A: Limitations of RDBMS 

LIMITATION OF RDBMS are as follows - 

- Relational databases like MySQL are structured around fixed schemas with tables, columns, and strict data types. 
- For FlexiMart, this creates challenges when handling a diverse product catalog. Each product type may have unique attributes.
  Eg, laptops require fields like RAM and processor, while shoes need size and color. 
- Storing all these in a single table would lead to many nullable columns, complex joins, and sparse data, making queries inefficient. 
- Additionally, frequent schema changes, such as adding new product types, require altering table structures, risking downtime or data inconsistency. 
- Storing nested data, like customer reviews (with ratings, comments, and timestamps), is also cumbersome; relational databases often require multiple tables and joins, which increases query complexity and slows performance. 
- Overall, the rigid structure of RDBMS limits agility and scalability for highly heterogeneous and nested product information.

## Section B: NoSQL Benefits 

ADVANTAGES of NoSQL are -

- MongoDB, a document-oriented NoSQL database, provides a flexible schema that adapts naturally to diverse products. 
- Each product can be stored as a separate document with only relevant fields—laptops can have RAM and processor, shoes can have size and color—without empty columns. 
- Embedded documents allow customer reviews to be stored directly within the product document, simplifying retrieval and reducing the need for complex joins. 
- MongoDB also supports horizontal scalability through sharding, allowing FlexiMart to handle large volumes of products and high traffic without performance degradation.
- Its query language can efficiently access nested data, making analytics on reviews or product attributes easier. 


## Section C: Trade-offs 
 
While MongoDB offers flexibility, there are trade-offs compared to MySQL. 

- First, it provides weaker transactional guarantees; multi-document ACID transactions are supported but are less mature, which could impact consistency for complex operations involving multiple collections. 
- Second, the flexible schema can lead to inconsistent data if not carefully validated, increasing the risk of missing or incorrectly formatted fields. 
- Additionally, joining data across collections is more complex than SQL joins, potentially complicating analytics or reporting. 
- Organizations must balance these trade-offs with the benefits of agility and scalability when choosing MongoDB for a diverse product catalog.
