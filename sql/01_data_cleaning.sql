                                         -- Task 1: Data Cleaning & Preparation
-- check duplicates
SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT *
FROM orders
WHERE order_id IN (
SELECT order_id
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1
);

SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- "Duplicate records were checked using GROUP BY and HAVING clause. No duplicate Order_ID records were found."

-- checking null values
SELECT *
FROM routes
WHERE traffic_delay_min IS NULL;

-- No null values found in traffic_delay_min

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'orders';

-- Already in date format

SELECT *
FROM orders
WHERE actual_delivery_date < order_date;

-- No records found where Actual Delivery Date is before Order Date.



















