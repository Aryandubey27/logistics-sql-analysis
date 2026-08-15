                                  -- Task-5: Delivery Agent Performance

-- Rank agents per route by on-time delivery percentage
SELECT
agent_id,
route_id,
on_time_percentage,
RANK() OVER (
PARTITION BY route_id
ORDER BY on_time_percentage DESC
) AS agent_rank
FROM delivery_agents;

-- Find Agents with On-Time % < 80%
SELECT
agent_id,
route_id,
on_time_percentage
FROM delivery_agents
WHERE on_time_percentage < 80;

-- Compare Average Speed of Top 5 vs Bottom 5 Agents
SELECT
AVG(avg_speed_km_hr) AS top5_avg_speed
FROM (
SELECT avg_speed_km_hr
FROM delivery_agents
ORDER BY on_time_percentage DESC
LIMIT 5
) AS top_agents;

-- Bottom 5 Agents
SELECT
AVG(avg_speed_km_hr) AS bottom5_avg_speed
FROM (
SELECT avg_speed_km_hr
FROM delivery_agents
ORDER BY on_time_percentage ASC
LIMIT 5
) AS bottom_agents;

"Delivery Agent Performance Insights

Agents were ranked based on on-time delivery percentage within each route.

Agents with on-time delivery below 80% were identified as underperforming.

Comparison of delivery speeds showed that top-performing agents generally have higher average speeds.

Improving training and route allocation for underperforming agents can enhance overall delivery efficiency."

