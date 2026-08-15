                                           -- Task 2: Delivery Delay Analysis
								   
-- Actual Delivery Date - Expected Delivery Date
SELECT
order_id,
warehouse_id,
route_id,
order_date,
expected_delivery_date,
actual_delivery_date,
(actual_delivery_date - expected_delivery_date) AS delay_days
FROM orders;

-- Create a view so we can reuse delay calculation.
CREATE VIEW order_delivery_delay AS
SELECT
order_id,
warehouse_id,
route_id,
(actual_delivery_date - expected_delivery_date) AS delay_days
FROM orders;

SELECT * FROM order_delivery_delay;

-- Find Top 10 Delayed Routes
SELECT
route_id,
AVG(actual_delivery_date - expected_delivery_date) AS avg_delay_days
FROM orders
GROUP BY route_id
ORDER BY avg_delay_days DESC
LIMIT 10;

-- Join with routes table to show locations.
SELECT
r.route_id,
r.start_location,
r.end_location,
AVG(o.actual_delivery_date - o.expected_delivery_date) AS avg_delay_days
FROM orders o
JOIN routes r
ON o.route_id = r.route_id
GROUP BY r.route_id, r.start_location, r.end_location
ORDER BY avg_delay_days DESC
LIMIT 10;

-- Rank Orders by Delay Within Each Warehouse

SELECT
order_id,
warehouse_id,
route_id,
(actual_delivery_date - expected_delivery_date) AS delay_days,
RANK() OVER (
PARTITION BY warehouse_id
ORDER BY (actual_delivery_date - expected_delivery_date) DESC
) AS delay_rank
FROM orders;








