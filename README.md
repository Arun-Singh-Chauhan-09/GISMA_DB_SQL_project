
# E-Commerce Database SQL Project

## Project Overview
This project is an **E-Commerce Database SQL implementation** developed as part of the **M605 – Database Systems / SQL** academic module.  
The project demonstrates the design, creation, and querying of a relational database using **MySQL** to support a basic e-commerce system.

The database design is based on core e-commerce entities such as users, products, orders, and order items.  
SQL scripts are provided to create the schema, insert sample data, and execute advanced SQL queries.

---

## Objectives
- Design a relational database using SQL
- Implement primary keys and foreign key relationships
- Populate tables with sample data
- Write meaningful SQL queries for data retrieval and analysis
- Visualise the database design using an ER diagram

---

## Technologies Used
- **Database:** MySQL
- **Query Language:** SQL
- **Design Tool:** ER Diagram (PNG)
- **Version Control:** Git & GitHub

---

## Project Structure

```
GISMA_DB_SQL_project/
│
├── 01_sql_schema_and_data.sql
├── 02_sql_queries.sql
│
├── diagrams/
│   └── ER.png
│
└── README.md
```

---

## Database Schema

The database consists of the following main tables:

- **users** – Stores customer information  
- **products** – Stores product details and pricing  
- **orders** – Stores order information  
- **order_items** – Stores products associated with each order  

### Relationships
- One user can place multiple orders  
- One order can contain multiple order items  
- Each order item references a product  

The complete schema definition and sample data are available in:

```
01_sql_schema_and_data.sql
```

---

## ER Diagram

The Entity Relationship (ER) diagram illustrates the structure of the database and relationships between entities.

![ER Diagram](diagrams/ER.png)

---

## SQL Queries

The file below contains SQL queries that demonstrate data retrieval and analysis:

```
02_sql_queries.sql
```

### Example Query Types
- Retrieve all users and their orders
- List products with available stock
- Calculate total order values
- Join multiple tables using INNER JOIN
- Filter and sort data using WHERE, GROUP BY, and ORDER BY

---

## How to Run the SQL Project

1. Open **MySQL Workbench** or MySQL CLI
2. Create a database (if not already created):
```sql
CREATE DATABASE ecommerce_db;
USE ecommerce_db;
```
3. Run the schema and data script:
```sql
SOURCE 01_sql_schema_and_data.sql;
```
4. Execute queries from:
```sql
SOURCE 02_sql_queries.sql;
```

---

## Key Learning Outcomes
- Understanding relational database design
- Writing structured SQL scripts
- Using joins and constraints effectively
- Applying SQL queries to solve real-world problems
- Visualising database relationships using ER diagrams

---

## Author
**Arun Singh Chauhan**  
MEng Computer Science  
Student Number: GH1052389  

---

## Academic Declaration
This project is submitted as part of an academic assessment.  
All work presented is original and created solely for educational purposes.
