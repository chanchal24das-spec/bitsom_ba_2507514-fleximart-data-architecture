import pandas as pd
import mysql.connector
import logging
import re
from datetime import datetime
import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DATA_DIR = os.path.join(BASE_DIR, "data")

# ---------------- LOGGING CONFIG ----------------
logging.basicConfig(
    filename="etl_log.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

# ---------------- DATABASE CONNECTION ----------------
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="password",
        database="fleximart"
    )

# ---------------- UTILITY FUNCTIONS ----------------
def standardize_phone(phone):
    """
    Convert phone numbers to format: +91-XXXXXXXXXX
    """
    if pd.isna(phone):
        return None
    digits = re.sub(r"\D", "", str(phone))
    if len(digits) == 10:
        return f"+91-{digits}"
    return None


def standardize_category(category):
    """
    Normalize category names
    """
    if pd.isna(category):
        return "Unknown"
    return category.strip().title()


def standardize_date(date_val):
    """
    Convert any date format to YYYY-MM-DD
    """
    try:
        return pd.to_datetime(date_val).date()
    except Exception:
        return None


# ---------------- DATA QUALITY METRICS ----------------
data_quality = {
    "customers": {"processed": 0, "duplicates": 0, "missing": 0, "loaded": 0},
    "products": {"processed": 0, "duplicates": 0, "missing": 0, "loaded": 0},
    "sales": {"processed": 0, "duplicates": 0, "missing": 0, "loaded": 0}
}

# ---------------- EXTRACT ----------------
def extract_data():
    customers = pd.read_csv(os.path.join(DATA_DIR, "customers_raw.csv"))
    products = pd.read_csv(os.path.join(DATA_DIR, "products_raw.csv"))
    sales = pd.read_csv(os.path.join(DATA_DIR, "sales_raw.csv"))


    data_quality["customers"]["processed"] = len(customers)
    data_quality["products"]["processed"] = len(products)
    data_quality["sales"]["processed"] = len(sales)

    logging.info("Data extraction completed")
    return customers, products, sales


# ---------------- TRANSFORM: CUSTOMERS ----------------
def transform_customers(df):
    before = len(df)

    df = df.drop_duplicates(subset=["email"])
    data_quality["customers"]["duplicates"] = before - len(df)

    missing_before = df.isnull().sum().sum()

    df = df.dropna(subset=["email", "first_name", "last_name"])
    df["phone"] = df["phone"].apply(standardize_phone)
    df["registration_date"] = df["registration_date"].apply(standardize_date)

    missing_after = df.isnull().sum().sum()
    data_quality["customers"]["missing"] = missing_before - missing_after

    return df


# ---------------- TRANSFORM: PRODUCTS ----------------
def transform_products(df):
    before = len(df)

    df = df.drop_duplicates(subset=["product_name"])
    data_quality["products"]["duplicates"] = before - len(df)

    missing_before = df.isnull().sum().sum()

    df["category"] = df["category"].apply(standardize_category)
    df["stock_quantity"] = df["stock_quantity"].fillna(0)
    df = df.dropna(subset=["price", "product_name"])

    missing_after = df.isnull().sum().sum()
    data_quality["products"]["missing"] = missing_before - missing_after

    return df


# ---------------- TRANSFORM: SALES ----------------
def transform_sales(df):
    before = len(df)

    df = df.drop_duplicates()
    data_quality["sales"]["duplicates"] = before - len(df)

    missing_before = df.isnull().sum().sum()

    df["order_date"] = df["order_date"].apply(standardize_date)
    df = df.dropna(subset=["customer_id", "product_id", "quantity", "unit_price"])

    df["subtotal"] = df["quantity"] * df["unit_price"]

    missing_after = df.isnull().sum().sum()
    data_quality["sales"]["missing"] = missing_before - missing_after

    return df


# ---------------- LOAD: CUSTOMERS ----------------
def load_customers(df, cursor, conn):
    for _, row in df.iterrows():
        try:
            cursor.execute("""
                INSERT INTO customers (first_name, last_name, email, phone, city, registration_date)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, tuple(row))
            data_quality["customers"]["loaded"] += 1
        except Exception as e:
            logging.error(f"Customer insert failed: {e}")
    conn.commit()


# ---------------- LOAD: PRODUCTS ----------------
def load_products(df, cursor, conn):
    for _, row in df.iterrows():
        try:
            cursor.execute("""
                INSERT INTO products (product_name, category, price, stock_quantity)
                VALUES (%s, %s, %s, %s)
            """, tuple(row))
            data_quality["products"]["loaded"] += 1
        except Exception as e:
            logging.error(f"Product insert failed: {e}")
    conn.commit()


# ---------------- LOAD: ORDERS & ORDER ITEMS ----------------
def load_sales(df, cursor, conn):
    for _, row in df.iterrows():
        try:
            # Insert order
            cursor.execute("""
                INSERT INTO orders (customer_id, order_date, total_amount)
                VALUES (%s, %s, %s)
            """, (row["customer_id"], row["order_date"], row["subtotal"]))
            order_id = cursor.lastrowid

            # Insert order item
            cursor.execute("""
                INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal)
                VALUES (%s, %s, %s, %s, %s)
            """, (
                order_id,
                row["product_id"],
                row["quantity"],
                row["unit_price"],
                row["subtotal"]
            ))

            data_quality["sales"]["loaded"] += 1
        except Exception as e:
            logging.error(f"Sales insert failed: {e}")
    conn.commit()


# ---------------- DATA QUALITY REPORT ----------------
def generate_report():
    report_path = os.path.join(BASE_DIR, "data_quality_report.txt")
    with open(report_path, "w") as f:
        for table, metrics in data_quality.items():
            f.write(f"Table: {table}\n")
            for key, value in metrics.items():
                f.write(f"  {key}: {value}\n")
            f.write("\n")



# ---------------- MAIN ETL FLOW ----------------
def main():
    try:
        customers, products, sales = extract_data()

        customers = transform_customers(customers)
        products = transform_products(products)
        sales = transform_sales(sales)

        conn = get_db_connection()
        cursor = conn.cursor()

        load_customers(customers, cursor, conn)
        load_products(products, cursor, conn)
        load_sales(sales, cursor, conn)

        generate_report()

        cursor.close()
        conn.close()

        logging.info("ETL Pipeline completed successfully")

    except Exception as e:
        logging.critical(f"ETL Pipeline failed: {e}")


if __name__ == "__main__":
    main()
