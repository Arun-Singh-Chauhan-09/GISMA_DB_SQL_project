-- ================================
-- FILE: 02_sql_queries.sql
-- PURPOSE: CRUD, JOIN, AGGREGATION, ADVANCED QUERIES
-- ================================

-- BASIC SELECT
SELECT * FROM users;

-- INSERT NEW PRODUCT
INSERT INTO products (name, price, stock)
VALUES ('VR Headset', 399.99, 25);

-- UPDATE STOCK
UPDATE products
SET stock = stock - 1
WHERE id = 1;

-- DELETE ORDER (CHILD FIRST)
DELETE FROM order_items WHERE order_id = 5;
DELETE FROM orders WHERE id = 5;

-- USER ORDER HISTORY
SELECT u.name, o.id AS order_id, o.status, o.total_amount
FROM users u
JOIN orders o ON u.id = o.user_id
ORDER BY o.order_date DESC;

-- ORDER DETAILS
SELECT o.id AS order_id, p.name, oi.quantity, oi.price
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;

-- TOTAL REVENUE
SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status IN ('SHIPPED', 'DELIVERED');

-- REVENUE PER USER
SELECT u.name, SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.name
ORDER BY total_spent DESC;

-- TOP SELLING PRODUCTS
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 5;

-- ORDER STATUS COUNT
SELECT status, COUNT(*) AS count
FROM orders
GROUP BY status;

-- USERS WITH NO ORDERS
SELECT u.name
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE o.id IS NULL;

-- AVERAGE ORDER VALUE
SELECT AVG(total_amount) AS avg_order_value
FROM orders;

-- MONTHLY SALES REPORT
SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, SUM(total_amount) AS sales
FROM orders
GROUP BY year, month
ORDER BY year, month;

-- STORED PROCEDURE
DELIMITER $$
CREATE PROCEDURE place_order (
    IN p_user_id INT,
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE product_price DECIMAL(10,2);

    SELECT price INTO product_price FROM products WHERE id = p_product_id;

    INSERT INTO orders (user_id, total_amount, status)
    VALUES (p_user_id, product_price * p_quantity, 'PLACED');

    INSERT INTO order_items (order_id, product_id, quantity, price)
    VALUES (LAST_INSERT_ID(), p_product_id, p_quantity, product_price);
END$$
DELIMITER ;

-- TRIGGER FOR STOCK UPDATE
DELIMITER $$
CREATE TRIGGER reduce_stock_after_order
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE id = NEW.product_id;
END$$
DELIMITER ;

-- CALL PROCEDURE
CALL place_order(1, 1, 1);