                                                   -- Task-4: Warehouse Performance

-- Find Top 3 warehouses with highest average processing time
SELECT
warehouse_id,
location,
processing_time_min
FROM warehouses
ORDER BY processing_time_min DESC
LIMIT 3;

-- Total vs Delayed Shipments per Warehouse
SELECT
warehouse_id,
COUNT(*) AS total_orders,
COUNT(*) FILTER (WHERE delivery_status = 'Delayed') AS delayed_orders
FROM orders
GROUP BY warehouse_id;

-- Find Bottleneck Warehouses Using CTE
WITH avg_processing_time AS (
SELECT
AVG(processing_time_min) AS global_avg_time
FROM warehouses
)
SELECT
w.warehouse_id,
w.location,
w.processing_time_min,
a.global_avg_time
FROM warehouses w, avg_processing_time a
WHERE w.processing_time_min > a.global_avg_time;

-- Rank Warehouses by On-Time Delivery %
SELECT
warehouse_id,
COUNT(*) FILTER (WHERE delivery_status = 'On Time') * 100.0 / COUNT(*) 
AS ontime_percentage,
RANK() OVER (
ORDER BY
COUNT(*) FILTER (WHERE delivery_status = 'On Time') * 100.0 / COUNT(*) DESC
) AS warehouse_rank
FROM orders
GROUP BY warehouse_id;


-- Overall Insight

-- The analysis reveals a significant variation in warehouse performance.

-- Best warehouse performance: 76%

-- Worst warehouse performance: 33%

-- This gap indicates operational inconsistencies across warehouses.

-- Improving the performance of low-ranking warehouses could significantly reduce overall delivery delays.



