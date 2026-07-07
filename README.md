# Fleet VOR Analytics Portfolio 🚚📊

## 📊 Business Context & Strategy
Vehicle Off Road (VOR) downtime represents a critical financial leak and a major operational bottleneck in the fleet management industry. This project investigates root-cause downtime bottlenecks using a simulated commercial fleet dataset. 

Drawing from **2.5 years of firsthand frontline experience in Holman's Driver Care operations**, I designed this analysis to bridge the gap between human operational friction (supplier delays, garage capacity, driver compliance) and actionable data insights.

---

## 🗄️ Relational Database Architecture & Schema
To demonstrate relational data modelling and structural integrity beyond a standard flat file, this project was developed inside **DB Browser for SQLite**. The architecture contains a dedicated staging table, normalised dimension/fact structures, and advanced analytical SQL Views designed to streamline business reporting:

### 📋 Core Tables
1. **`Bookings_and_VOR` (Fact Table):** The transactional core tracking vehicle downtime. It features keys like `booking_id` (PRIMARY KEY), `vehicle_id`, and `garage_id`. It captures critical operational timestamps (`defect_reported_datetime`, `garage_in_date`, `garage_out_date`) alongside calculated commercial metrics like `hours_to_book`, `total_vor_days`, and SLA breach flags (`booking_sla_breached?`, `vor_sla_breached?`).
2. **`Garages` (Dimension Table):** Houses supplier entities mapping `garage_id` (PRIMARY KEY) to `garage_name` (enforced as TEXT UNIQUE).
3. **`Vehicles` (Dimension Table):** Tracks asset metadata mapping `vehicle_id` (PRIMARY KEY) to its specific `vehicle_type` and `make_model`.
4. **`Master_Fleet_Data`:** Serves as the staging layer, demonstrating data ingestion logic before normalisation into relational structures.

### 📊 Advanced SQL Views (Reporting Layer)
To showcase the ability to build reusable analytics for stakeholder reporting, the database contains a custom view: **`v_Garage_Responsibility_Analysis`:** Evaluates SLA compliance flags and primary delay reasons to determine whether delays were caused by garage capacity constraints or internal operational bottlenecks.

---

## 🔒 Data Governance & Strategic Scope
* **Information Security:** In strict alignment with corporate data governance and confidentiality standards, this independent schema was built to safely simulate commercial fleet mechanics without exposing or replicating complex, proprietary corporate databases.
* **Data Masking & Anonymisation:** All vendor, garage, and supplier names have been replaced with randomised, themed placeholder names to maintain absolute business anonymity and protect partner relationships.
* **Analytical Intent:** The primary purpose of this repository is to showcase data hygiene, entity-relationship (ER) mapping logic, and SQL querying strategies rather than heavy infrastructure recreation.

---

## 🛠️ Tools & Technologies Used
* **SQL (SQLite / DB Browser):** Relational database design, table joins, saved views, and analytical query writing.
* **MS Excel & Power Query:** Flat-file source preparation, ETL workflows, data scrubbing, and automated data ingestion pipelines.
* **Power BI & VBA Logic:** Transforming raw transactional operational data into stable, high-utility tools for business stakeholders.

---

## 🚀 Key SQL Analyses Demonstrated
* **Downtime Duration Analysis:** Identifying the top 10% outlier garages causing prolonged VOR durations to evaluate supplier SLAs.
* **Root-Cause Categorisation:** Isolating mechanical maintenance timelines versus administrative or internal approval delays.
* **Trend & Seasonality Forecasting:** Spotting cyclical spikes in vehicle maintenance to help fleet operations optimise preventative booking schedules.

---

## 📈 Future Tech Integration Roadmap
In alignment with modern enterprise data stack strategies, the next phase of this project focuses on expanding this relational foundation into cloud-based analytics:
* Transitioning static datasets into **Power BI Desktop** using both Import Mode and **DirectQuery** to simulate real-time asset tracking.
* Aligning semantic models with **Microsoft Fabric** workflows to explore modern data engineering pipelines.
