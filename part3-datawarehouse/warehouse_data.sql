-- ================================
-- FILE 2: warehouse_data.sql
-- ================================

-- dim_date (30 dates: Jan–Feb 2024)

INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,0),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,0),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,0),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,0),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,0),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,1),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,1),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,0),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,0),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,0),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,0),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,0),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,1),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,1),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,0),
(20240120,'2024-01-20','Saturday',20,1,'January','Q1',2024,1),
(20240121,'2024-01-21','Sunday',21,1,'January','Q1',2024,1),
(20240125,'2024-01-25','Thursday',25,1,'January','Q1',2024,0),
(20240128,'2024-01-28','Sunday',28,1,'January','Q1',2024,1),
(20240131,'2024-01-31','Wednesday',31,1,'January','Q1',2024,0),
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,0),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,0),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,1),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,1),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,0),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,1),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,1),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,0),
(20240220,'2024-02-20','Tuesday',20,2,'February','Q1',2024,0),
(20240225,'2024-02-25','Sunday',25,2,'February','Q1',2024,1);

-- dim_product (15 products, 3 categories)
INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','Laptop Pro','Electronics','Computers',75000),
('P002','Smartphone X','Electronics','Mobiles',60000),
('P003','Bluetooth Speaker','Electronics','Audio',4500),
('P004','LED TV 55"','Electronics','Television',82000),
('P005','Wireless Mouse','Electronics','Accessories',1200),
('P006','Office Chair','Furniture','Seating',9000),
('P007','Dining Table','Furniture','Tables',35000),
('P008','Sofa Set','Furniture','Living Room',65000),
('P009','Bookshelf','Furniture','Storage',7000),
('P010','Bed Frame','Furniture','Bedroom',28000),
('P011','T-Shirt','Clothing','Men',800),
('P012','Jeans','Clothing','Men',2200),
('P013','Dress','Clothing','Women',3500),
('P014','Jacket','Clothing','Winter',5500),
('P015','Shoes','Clothing','Footwear',4200);

-- dim_customer (12 customers, 4 cities)

INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','John Doe','Mumbai','Maharashtra','Retail'),
('C002','Anita Sharma','Delhi','Delhi','Retail'),
('C003','Rahul Mehta','Ahmedabad','Gujarat','Retail'),
('C004','Priya Nair','Kochi','Kerala','Premium'),
('C005','Amit Patel','Surat','Gujarat','Wholesale'),
('C006','Sneha Iyer','Chennai','Tamil Nadu','Retail'),
('C007','Rohit Verma','Delhi','Delhi','Premium'),
('C008','Neha Singh','Mumbai','Maharashtra','Retail'),
('C009','Vikram Rao','Bengaluru','Karnataka','Wholesale'),
('C010','Pooja Kulkarni','Pune','Maharashtra','Retail'),
('C011','Arjun Malhotra','Chandigarh','Punjab','Premium'),
('C012','Kavya Menon','Kozhikode','Kerala','Retail');

-- fact_sales (40 transactions)

INSERT INTO fact_sales (date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount) VALUES
(20240106,1,1,2,75000,5000,145000),
(20240107,2,2,1,60000,0,60000),
(20240113,3,3,4,4500,500,17500),
(20240114,5,4,3,1200,0,3600),
(20240120,6,5,2,9000,1000,17000),
(20240121,7,6,1,35000,0,35000),
(20240128,8,7,1,65000,5000,60000),
(20240131,9,8,2,7000,0,14000),
(20240203,10,9,1,28000,0,28000),
(20240204,11,10,5,800,0,4000),
(20240210,12,11,3,2200,200,6400),
(20240211,13,12,2,3500,0,7000),
(20240215,14,1,1,5500,0,5500),
(20240220,15,2,2,4200,400,8000),
(20240225,4,3,1,82000,7000,75000),
(20240106,2,4,1,60000,3000,57000),
(20240107,3,5,6,4500,500,26500),
(20240113,6,6,1,9000,0,9000),
(20240114,7,7,1,35000,0,35000),
(20240120,8,8,1,65000,0,65000),
(20240121,9,9,2,7000,0,14000),
(20240128,10,10,1,28000,0,28000),
(20240131,11,11,4,800,0,3200),
(20240203,12,12,2,2200,0,4400),
(20240204,13,1,1,3500,0,3500),
(20240210,14,2,2,5500,500,10500),
(20240211,15,3,1,4200,0,4200),
(20240215,1,4,1,75000,5000,70000),
(20240220,2,5,1,60000,0,60000),
(20240225,3,6,5,4500,500,22000),
(20240106,4,7,1,82000,0,82000),
(20240107,5,8,3,1200,0,3600),
(20240113,6,9,2,9000,1000,17000),
(20240114,7,10,1,35000,0,35000),
(20240120,8,11,1,65000,5000,60000),
(20240121,9,12,2,7000,0,14000),
(20240128,10,1,1,28000,0,28000),
(20240131,11,2,6,800,0,4800),
(20240203,12,3,3,2200,200,6400);
