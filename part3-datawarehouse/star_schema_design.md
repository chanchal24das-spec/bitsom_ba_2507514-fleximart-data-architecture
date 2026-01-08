# FlexiMart Data Warehouse – Star Schema Design

## Overview ( Section 1 )

### FACT TABLE: fact_sales

**Grain:** One row per product per order line item
**Business Process:** Sales transactions

**Measures (Numeric Facts):**

* **quantity_sold:** Number of units sold
* **unit_price:** Price per unit at the time of sale
* **discount_amount:** Discount applied on the line item
* **total_amount:** Final payable amount (quantity_sold × unit_price − discount_amount)

**Foreign Keys:**

* **date_key** → dim_date
* **product_key** → dim_product
* **customer_key** → dim_customer

---

### DIMENSION TABLE: dim_date

**Purpose:** Enables time-based analysis such as daily, monthly, quarterly, and yearly trends
**Type:** Conformed dimension

**Attributes:**

* **date_key (PK):** Surrogate key in YYYYMMDD format
* **full_date:** Actual calendar date
* **day_of_week:** Monday, Tuesday, etc.
* **month:** Numeric month (1–12)
* **month_name:** January, February, etc.
* **quarter:** Q1, Q2, Q3, Q4
* **year:** Calendar year (e.g., 2023, 2024)
* **is_weekend:** Boolean flag indicating weekend

---

### DIMENSION TABLE: dim_product

**Purpose:** Provides descriptive information about products for category and product-level analysis

**Attributes:**

* **product_key (PK):** Surrogate key
* **product_id:** Business/natural product identifier
* **product_name:** Name of the product
* **category:** High-level category (e.g., Electronics, Apparel)
* **subcategory:** Detailed category (e.g., Laptops, Mobiles)
* **brand:** Product brand
* **standard_price:** Listed price of the product

---

### DIMENSION TABLE: dim_customer

**Purpose:** Enables customer-based analysis such as location, demographics, and purchasing behavior

**Attributes:**

* **customer_key (PK):** Surrogate key
* **customer_id:** Business/natural customer identifier
* **customer_name:** Full name of the customer
* **email:** Customer email address
* **city:** Customer city
* **state:** Customer state
* **country:** Customer country
* **customer_segment:** Retail, Wholesale, Premium, etc.

---

## Design Decisions ( Section 2 )

The fact table is designed at the transaction line-item level to capture the most granular form of sales data. This granularity allows FlexiMart to perform detailed analysis such as product-level performance, customer purchase behavior, and discount impact analysis while still supporting aggregated reporting at higher levels.

Surrogate keys are used instead of natural keys to ensure stability and consistency in the data warehouse. Natural keys from source systems may change, be reused, or vary across systems, whereas surrogate keys provide better performance, simplify joins, and support slowly changing dimensions.

This star schema design supports drill-down and roll-up operations efficiently. Analysts can roll up data from daily to monthly or yearly sales using the date dimension, and drill down from category-level sales to individual products using the product dimension. The simple structure also improves query performance and usability for BI tools.

---

## Example of Data Flow ( Section 3)

### Source Transaction

* **Order Number:** 101
* **Customer:** John Doe
* **Product:** Laptop
* **Quantity:** 2
* **Unit Price:** 50,000

---
This is a sample flow that demonstrates how transactional data is transformed into a dimensional model optimized for analytical reporting and historical trend analysis.


### Data Warehouse Representation

**fact_sales:**

```
{
  date_key: 20240115,
  product_key: 5,
  customer_key: 12,
  quantity_sold: 2,
  unit_price: 50000,
  discount_amount: 0,
  total_amount: 100000
}
```

**dim_date:**

```
{ date_key: 20240115, full_date: '2024-01-15', month: 1, month_name: 'January', quarter: 'Q1', year: 2024 }
```

**dim_product:**

```
{ product_key: 5, product_name: 'Laptop', category: 'Electronics', subcategory: 'Computers' }
```

**dim_customer:**

```
{ customer_key: 12, customer_name: 'John Doe', city: 'Mumbai', country: 'India' }
```


