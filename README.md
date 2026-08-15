# 🚚 Logistics Optimization & Delivery Route Analysis

A **PostgreSQL-based logistics analytics project** analyzing delivery delays, route efficiency, warehouse bottlenecks, delivery-agent performance, shipment tracking, and overall delivery KPIs.

> **Case Study:** Logistics Optimization for Delivery Routes
> **Database:** PostgreSQL
> **Tools:** SQL • PostgreSQL • Excel

---

## 📌 About the Project

This project uses logistics data to answer practical operational questions:

- Where are delivery delays happening, and why?
- Which routes and warehouses are underperforming?
- Which delivery agents perform below expectations?
- What's the overall on-time delivery rate, and how does it vary by region?

The analysis connects **orders, routes, warehouses, delivery agents, and shipment tracking** data to understand delivery performance from multiple angles.

---

## 🗂️ Dataset Structure

| Table | Key Fields | Purpose |
|---|---|---|
| `orders` | order_id, warehouse_id, route_id, expected/actual delivery dates, delivery_status | Core order-to-delivery lifecycle |
| `routes` | route_id, start/end location, distance_km, avg_travel_time, traffic_delay_min | Route efficiency evaluation |
| `warehouses` | warehouse_id, location, processing_time_min, dispatch_time | Warehouse bottleneck identification |
| `delivery_agents` | agent_id, route_id, shift_hours, avg_speed, on_time_percentage | Agent performance comparison |
| `shipment_tracking` | shipment_id, order_id, checkpoint, checkpoint_time, delay_reason | Checkpoint-level delay investigation |

---

## 🧩 Project Workflow

```
Raw Data → Create Tables → Data Quality Checks → Delivery Delay Analysis
   ├── Route Optimization
   ├── Warehouse Performance
   ├── Delivery Agent Performance
   └── Shipment Tracking
        → Advanced KPIs → Business Insights
```

---

## 📁 SQL Files (run in order)

| # | File | What it does |
|---|---|---|
| 0 | `Creating_tables.sql` | Builds the 5 relational tables in PostgreSQL |
| 1 | `Data_Cleaning.sql` | Checks for duplicate orders, missing traffic delays, bad date types, and invalid delivery dates |
| 2 | `Delivery_Delay_Analysis.sql` | Calculates per-order delay, finds top 10 most-delayed routes, ranks delayed orders within each warehouse |
| 3 | `Route_Optimization_Insights.sql` | Computes route efficiency (distance/time ratio), flags routes with >20% delayed shipments |
| 4 | `Warehouse_Performance.sql` | Finds slowest warehouses, compares against the global average, ranks warehouses by on-time %  |
| 5 | `Delivery_Agent_Performance.sql` | Ranks agents within their routes, flags agents under 80% on-time, compares top vs. bottom 5 agents |
| 6 | `Shipment_Tracking_Analytics.sql` | Finds each order's last checkpoint, most common delay reasons, orders with 2+ delayed checkpoints |
| 7 | `Advanced_KPI_Reporting.sql` | Delay by region, overall on-time %, average traffic delay by route |

Each file builds on the previous one — data cleaning validates the dataset before any KPI or business conclusion is drawn.

---

## 🛠️ SQL Concepts Applied

- **Aggregation** (avg delay, totals, on-time %)
- **GROUP BY / HAVING** (per-route, per-warehouse, per-agent breakdowns; filtering aggregated results)
- **Window Functions** (`PARTITION BY` for ranking orders per warehouse, agents per route)
- **CTEs** (benchmarking warehouses against the global average)
- **Subqueries** (top-5 vs. bottom-5 agent comparison)
- **PostgreSQL `FILTER`** (on-time vs. delayed counts in one query)
- **SQL Views** (reusable `order_delivery_delay` view)

---

## 📊 Key Analytical Areas

| Area | Investigates |
|---|---|
| Orders | Individual delivery delays |
| Routes | Inefficiency & frequent delays |
| Warehouses | Processing bottlenecks |
| Delivery Agents | On-time performance |
| Shipment Tracking | Where/why delays occur mid-journey |
| KPIs | Overall network performance |

---

## 📂 Repository Structure

```
logistics-sql-analysis/
├── README.md
├── sql/
│   ├── 00_Creating_tables.sql
│   ├── 01_Data_Cleaning.sql
│   ├── 02_Delivery_Delay_Analysis.sql
│   ├── 03_Route_Optimization.sql
│   ├── 04_Warehouse_Performance.sql
│   ├── 05_Delivery_Agent_Performance.sql
│   ├── 06_Shipment_Tracking_Analytics.sql
│   └── 07_Advanced_KPI_Reporting.sql
├── data/
│   ├── orders.xlsx
│   ├── routes.xlsx
│   ├── warehouses.xlsx
│   ├── delivery_agents.xlsx
│   └── shipment_tracking.xlsx
├── presentation/
│   └── Logistics_Optimization.pptx
└── documentation/
    └── Project_Documentation.pdf
```

---

## ▶️ How to Run

1. Run `00_Creating_tables.sql` to set up the schema
2. Load the 5 source datasets into their respective tables
3. Run the remaining SQL files **in numeric order** (01 → 07)

---

## 💡 Key Takeaway

This project shows how PostgreSQL can move beyond simple data retrieval — progressing from individual orders to **route-level, warehouse-level, agent-level, shipment-level, regional, and network-wide** performance, turning raw logistics data into actionable insight on where delays happen and what to fix.

**Built with PostgreSQL & SQL.**
