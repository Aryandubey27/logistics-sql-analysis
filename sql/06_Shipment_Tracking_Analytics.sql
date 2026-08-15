                               -- Task-6: Shipment Tracking Analytics

-- Find the Last Checkpoint for Each Order
SELECT
order_id,
MAX(checkpoint_time) AS last_checkpoint_time
FROM shipment_tracking
GROUP BY order_id;

-- (Shows Checkpoint Location)
SELECT
s.order_id,
s.checkpoint,
s.checkpoint_time
FROM shipment_tracking s
JOIN (
SELECT
order_id,
MAX(checkpoint_time) AS last_checkpoint_time
FROM shipment_tracking
GROUP BY order_id
) latest
ON s.order_id = latest.order_id
AND s.checkpoint_time = latest.last_checkpoint_time;

-- Most Common Delay Reasons
SELECT
delay_reason,
COUNT(*) AS frequency
FROM shipment_tracking
WHERE delay_reason IS NOT NULL
AND delay_reason <> 'None'
GROUP BY delay_reason
ORDER BY frequency DESC;

-- Orders with More Than 2 Delayed Checkpoints
SELECT
order_id,
COUNT(*) AS delayed_checkpoints
FROM shipment_tracking
WHERE delay_reason IS NOT NULL
AND delay_reason <> 'None'
GROUP BY order_id
HAVING COUNT(*) > 2;



