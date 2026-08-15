                                                  -- Ceating & Importing all the tables

CREATE TABLE orders (
    order_id VARCHAR PRIMARY KEY,
    customer_id VARCHAR,
    warehouse_id VARCHAR,
    route_id VARCHAR,
    order_date DATE,
    expected_delivery_date DATE,
    actual_delivery_date DATE,
    delivery_status VARCHAR
);

CREATE TABLE routes (
    route_id VARCHAR PRIMARY KEY,
    start_location VARCHAR,
    end_location VARCHAR,
    distance_km INT,
    average_travel_time_min INT,
    traffic_delay_min INT
);

-- alter table routes
ALTER TABLE routes
ALTER COLUMN distance_km TYPE NUMERIC;

CREATE TABLE warehouses (
    warehouse_id VARCHAR PRIMARY KEY,
    location VARCHAR,
    processing_time_min INT,
    dispatch_time TIME
);

CREATE TABLE delivery_agents (
    agent_id VARCHAR PRIMARY KEY,
    route_id VARCHAR,
    shift_hours INT,
    avg_speed_km_hr INT,
    on_time_percentage NUMERIC
);

CREATE TABLE shipment_tracking (
    shipment_id VARCHAR PRIMARY KEY,
    order_id VARCHAR,
    checkpoint VARCHAR,
    checkpoint_time TIMESTAMP,
    delay_reason VARCHAR
);

select * from warehouses
limit 10;

