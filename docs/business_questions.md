# Business Questions

This document summarises the business questions explored in the SQL analysis files.

| SQL File | Business Question | Operational Value |
|---|---|---|
| 01_specialist_booking_sla.sql | How many specialist vehicle bookings were completed within the 48-hour SLA? | Measures whether high-priority vehicles are being actioned quickly. |
| 02_breached_specialist_vehicles.sql | Which specialist vehicle bookings breached the 48-hour SLA? | Identifies cases requiring operational review or escalation. |
| 03_vor_sla_breaches.sql | Which vehicles exceeded the 3.5-day VOR SLA? | Highlights downtime cases with operational impact. |
| 04_garage_performance.sql | Which garages have the strongest or weakest VOR SLA performance? | Supports garage performance monitoring and supplier conversations. |
| 05_delay_reason_analysis.sql | Which delay reasons contribute most to downtime? | Helps identify root causes of extended VOR. |
| 06_parts_backorder_vs_fleet_average.sql | Which parts backorder cases are above the fleet average? | Shows whether parts availability is driving excessive downtime. |
| 07_vehicle_VOR_above_fleet_average.sql | Which vehicles had VOR downtime above the fleet average? | Identifies vehicles or cases that may need deeper review. |
| 08_compliant_booking_sla_breached_VOR_sla.sql | Which specialist vehicles were booked within SLA but still breached VOR SLA? | Separates booking performance from repair or garage-related delays. |
| 09_delayed_repair_start_date_by_garage.sql | Which garages had the longest delay before repair work started? | Helps distinguish garage intake delay from overall repair duration. |
| 10_manufacturer_level_downtime.sql | Which manufacturers had the highest average downtime? | Supports vehicle reliability and fleet composition analysis. |
