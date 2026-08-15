                                       -- Task 3: Route Optimization Insights

-- Calculate Route Performance Metrics
SELECT
r.route_id,
r.start_location,
r.end_location,

AVG(o.actual_delivery_date - o.order_date) AS avg_delivery_days,

AVG(r.traffic_delay_min) AS avg_traffic_delay,

(r.distance_km / r.average_travel_time_min) AS efficiency_ratio

FROM routes r
JOIN orders o
ON r.route_id = o.route_id

GROUP BY
r.route_id,
r.start_location,
r.end_location,
r.distance_km,
r.average_travel_time_min;

-- Find 3 Worst Routes
SELECT
route_id,
distance_km,
average_travel_time_min,
(distance_km / average_travel_time_min) AS efficiency_ratio
FROM routes
ORDER BY efficiency_ratio ASC
LIMIT 3;

-- Routes with >20% Delayed Shipments
SELECT
route_id,

COUNT(*) AS total_orders,

COUNT(*) FILTER (WHERE delivery_status = 'Delayed') AS delayed_orders,

(COUNT(*) FILTER (WHERE delivery_status = 'Delayed') * 100.0 / COUNT(*)) AS delay_percentage

FROM orders
GROUP BY route_id
HAVING (COUNT(*) FILTER (WHERE delivery_status = 'Delayed') * 100.0 / COUNT(*)) > 20;

-- Recommend Routes for Optimization

'Insight 1

Routes R2 and R5 have high delay percentage.

Possible reasons:

heavy traffic

longer travel time

poor route planning'

-- "Insight 2

-- Routes with low efficiency ratio require optimization.

-- Possible improvements:

-- • change delivery path
-- • use alternate highways
-- • schedule off-peak delivery times"

"Insight 3

Routes with high traffic delay should be monitored.

Solutions:

• traffic prediction models
• dynamic routin"













