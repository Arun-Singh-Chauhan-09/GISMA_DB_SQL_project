-- ================================
-- FILE: 01_sql_schema_and_data.sql
-- PURPOSE: Database schema and sample data creation
-- ================================

CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- USERS TABLE
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PRODUCTS TABLE
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

-- ORDERS TABLE
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    status VARCHAR(20) NOT NULL DEFAULT 'PLACED',
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- ORDER ITEMS TABLE
CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- INDEX FOR PERFORMANCE
CREATE INDEX idx_orders_user ON orders(user_id);

-- SAMPLE USERS DATA
INSERT INTO users (name, email) VALUES
('Arun Chauhan', 'arun@gmail.com'),
('John Smith', 'john@gmail.com'),
('Emma Brown', 'emma@gmail.com'),
('Sophia Miller', 'sophia@gmail.com'),
('Liam Johnson', 'liam@gmail.com'),
('Olivia Wilson', 'olivia@gmail.com'),
('Noah Taylor', 'noah@gmail.com'),
('Ava Anderson', 'ava@gmail.com'),
('William Thomas', 'william@gmail.com'),
('Isabella Moore', 'isabella@gmail.com');

-- SAMPLE PRODUCTS DATA
INSERT INTO products (name, price, stock) VALUES
('Laptop', 799.99, 25),
('Mobile Phone', 499.99, 40),
('Headphones', 99.99, 100),
('Wireless Mouse', 29.99, 150),
('Keyboard', 49.99, 120),
('Smart Watch', 199.99, 60),
('Tablet', 299.99, 35),
('Monitor', 179.99, 50),
('USB Cable', 9.99, 300),
('Power Bank', 39.99, 80);

-- SAMPLE ORDERS DATA
INSERT INTO orders (user_id, total_amount, status) VALUES
(1, 899.98, 'PLACED'),
(2, 499.99, 'SHIPPED'),
(3, 129.98, 'DELIVERED'),
(4, 299.99, 'PLACED'),
(5, 199.99, 'SHIPPED');

-- SAMPLE ORDER ITEMS DATA
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 799.99),
(1, 3, 1, 99.99),
(2, 2, 1, 499.99),
(3, 4, 2, 29.99),
(4, 7, 1, 299.99);