# 🚚 Logistics Optimization & Delivery Route Analysis

A PostgreSQL case study analyzing delivery performance across a full logistics network — orders, routes, warehouses, delivery agents, and shipment-tracking checkpoints — to identify where delays originate and what's driving them.

The project follows an end-to-end analytical workflow: building the database schema, validating data quality, then progressively analyzing performance at the order, route, warehouse, agent, and shipment level before rolling everything into network-wide KPIs.

> **Case Study:** Logistics Optimization for Delivery Routes
> **Database:** PostgreSQL
> **Tools:** SQL · PostgreSQL · Excel

---

## 🎯 Purpose

This repository is structured to do two things:

1. **Demonstrate applied SQL analysis** — every query answers a specific operational question, not just a syntax exercise, and is grouped by the business area it investigates.
2. **Document the reasoning behind the workflow** — each stage builds on the validated output of the previous one, so the analysis can be followed and reasoned through, not just run.

---

## 📌 Business Questions Answered

- Where are delivery delays concentrated, and how severe are they?
- Which routes are inefficient or have a high proportion of delayed shipments?
- Which warehouses are creating processing bottlenecks?
- Which delivery agents are underperforming relative to their route peers?
- What are the most common causes of shipment delay?
- Which orders experienced repeated delays across multiple checkpoints?
- What does the network's overall on-time delivery rate look like, and how does it vary by region?

---

## 🗂️ Dataset Structure

The analysis connects five relational tables:

| Table | Key Fields | Role in the Analysis |
|---|---|---|
| `orders` | order_id, customer_id, warehouse_id, route_id, expected/actual delivery dates, delivery_status | Core delivery lifecycle — the basis for all delay calculations |
| `routes` | route_id, start_location, end_location, distance_km, avg_travel_time_min, traffic_delay_min | Route efficiency and traffic-impact evaluation |
| `warehouses` | warehouse_id, location, processing_time_min, dispatch_time | Warehouse bottleneck identification |
| `delivery_agents` | agent_id, route_id, shift_hours, avg_speed_km_hr, on_time_percentage | Agent-level performance comparison within routes |
| `shipment_tracking` | shipment_id, order_id, checkpoint, checkpoint_time, delay_reason | Checkpoint-level delay investigation beyond the final delivery status |

📁 Source data: [`data/`](data)

---

## 📁 Repository Structure

```
logistics-sql-analysis/
├── README.md
├── sql/
│   ├── 00_Creating_tables.sql
│   ├── 01_data_cleaning.sql
│   ├── 02_delivery_delay_analysis.sql
│   ├── 03_Route_Optimization_Insights.sql
│   ├── 04_Warehouse_Performance.sql
│   ├── 05_Delivery_Agent_Performance.sql
│   ├── 06_Shipment_Tracking_Analytics.sql
│   └── 07_Advanced_KPI_Reporting.sql
├── data/
│   ├── Orders.xlsx
│   ├── Routes.xlsx
│   ├── Warehouses.xlsx
│   ├── DeliveryAgents.xlsx
│   └── Shipment Tracking Table.xlsx
└── presentation/
    └── Logistics Optimization for Delivery Routes.pptx
```

---

## 🧩 Analytical Workflow

```
Raw Logistics Data
        │
        ▼
Create PostgreSQL Tables  →  00_Creating_tables.sql
        │
        ▼
Data Quality Validation   →  01_data_cleaning.sql
        │
        ▼
Delivery Delay Analysis   →  02_delivery_delay_analysis.sql
        │
        ├── Route Optimization       →  03_Route_Optimization_Insights.sql
        ├── Warehouse Performance    →  04_Warehouse_Performance.sql
        ├── Delivery Agent Performance → 05_Delivery_Agent_Performance.sql
        └── Shipment Tracking        →  06_Shipment_Tracking_Analytics.sql
                │
                ▼
        Advanced KPI Reporting   →  07_Advanced_KPI_Reporting.sql
                │
                ▼
         Business Insights
```

Each file is meant to be run in this order — later stages depend on the validated dataset and derived views produced earlier in the sequence.

---

## 📁 SQL Files Explained

| File | What It Does |
|---|---|
| `00_Creating_tables.sql` | Builds the five relational tables and defines the schema, including a type correction on `routes.distance_km` |
| `01_data_cleaning.sql` | Validates data quality — checks for duplicate order IDs, missing traffic-delay values, incorrect date types, and impossible delivery dates (actual date before order date) |
| `02_delivery_delay_analysis.sql` | Calculates per-order delay, creates a reusable `order_delivery_delay` view, finds the 10 most-delayed routes, and ranks delayed orders within each warehouse |
| `03_Route_Optimization_Insights.sql` | Computes route efficiency (distance-to-time ratio), identifies the 3 least-efficient routes, and flags routes where over 20% of shipments were delayed |
| `04_Warehouse_Performance.sql` | Finds the slowest warehouses by processing time, compares each warehouse against the network-wide average using a CTE, and ranks warehouses by on-time delivery percentage |
| `05_Delivery_Agent_Performance.sql` | Ranks agents within their assigned route, flags agents below 80% on-time performance, and compares average speed between top-5 and bottom-5 performers |
| `06_Shipment_Tracking_Analytics.sql` | Finds each order's most recent checkpoint, identifies the most frequent delay reasons, and surfaces orders with more than two delayed checkpoints |
| `07_Advanced_KPI_Reporting.sql` | Rolls the analysis into network-level KPIs — average delay by region, overall on-time delivery percentage, and average traffic delay by route |

---

## 🛠️ SQL Concepts Applied

- **Aggregation** — average delay, totals, on-time percentage
- **`GROUP BY` / `HAVING`** — per-route, per-warehouse, per-agent breakdowns and filtering on aggregated results
- **Window Functions** — `PARTITION BY` for ranking orders within each warehouse and agents within each route
- **CTEs** — benchmarking individual warehouses against the network-wide average processing time
- **Subqueries** — isolating top-5 and bottom-5 performing agents for comparison
- **PostgreSQL `FILTER`** — counting on-time vs. delayed orders within a single aggregation
- **SQL Views** — a reusable `order_delivery_delay` view to avoid recalculating the same date-difference logic repeatedly

---

## ▶️ How to Run

1. Set up a PostgreSQL database.
2. Run `sql/00_Creating_tables.sql` to build the schema.
3. Load the five datasets from `data/` into their corresponding tables.
4. Run the remaining SQL files **in numeric order** (01 → 07) — each stage depends on the validation and derived views from the ones before it.

---

## 📈 From Raw Data to Business Decision

```
Raw Logistics Data → Data Quality Validation → Delivery Delay Calculation
   → Route & Warehouse Investigation → Agent Evaluation → Shipment-Level Tracing
   → Network KPIs → Operational Recommendations
```

The analysis moves from individual orders to route-level, warehouse-level, agent-level, and finally network-wide performance — turning raw delivery records into a clear picture of where delays happen, what's contributing to them, and where operational attention should be prioritized.

**Built with PostgreSQL & SQL.**
