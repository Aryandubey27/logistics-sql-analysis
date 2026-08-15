                                        -- Task-7: Advanced KPI Reporting

-- Average Delivery Delay per Region
SELECT
r.start_location AS region,
AVG(o.actual_delivery_date - o.expected_delivery_date) AS avg_delay_days
FROM orders o
JOIN routes r
ON o.route_id = r.route_id
GROUP BY r.start_location
ORDER BY avg_delay_days DESC;

-- On-Time Delivery Percentage
SELECT
COUNT(*) FILTER (WHERE delivery_status = 'On Time') * 100.0 / COUNT(*) 
AS ontime_delivery_percentage
FROM orders;

-- Average Traffic Delay per Route
SELECT
route_id,
AVG(traffic_delay_min) AS avg_traffic_delay
FROM routes
GROUP BY route_id
ORDER BY avg_traffic_delay DESC;
