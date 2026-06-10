# Data Dictionary

This data dictionary describes the tables used in the Fleet VOR Analytics project.

The dataset is fictional and was created for learning and portfolio purposes. It is based on general fleet operations concepts, including defect reporting, garage booking, vehicle off-road downtime, repair delays, and SLA performance.

## Database Overview

The SQLite database contains three main analysis tables:

| Table | Description |
|---|---|
| Vehicles | Stores vehicle reference information such as vehicle ID, type, and make/model. |
| Garages | Stores garage reference information, including garage IDs and garage names. |
| Bookings_and_VOR | Stores booking, repair, and vehicle off-road records. This is the main fact table used for SLA and downtime analysis. |

The database also includes a staging table used during import and cleaning:

| Table | Description |
|---|---|
| Staging_Fleet | Raw imported fleet data before being split into the normalised Vehicles, Garages, and Bookings_and_VOR tables. |

## Table Relationships

The main analysis uses the following relationships:

| Relationship | Description |
|---|---|
| Bookings_and_VOR.vehicle_id → Vehicles.vehicle_id | Links each booking/VOR record to the relevant vehicle. |
| Bookings_and_VOR.garage_id → Garages.garage_id | Links each booking/VOR record to the garage handling the repair. |

This structure allows vehicle details and garage details to be stored once, while multiple operational records can be analysed through the Bookings_and_VOR table.

## Vehicles Table

The `Vehicles` table contains one record per vehicle.

| Column | Data Type | Description |
|---|---:|---|
| vehicle_id | TEXT | Unique vehicle identifier, such as `VH1000`. |
| vehicle_type | TEXT | Vehicle category, such as `Standard` or `Specialised`. Specialist vehicles are assessed against the 48-hour booking SLA. |
| make_model | TEXT | Vehicle make and model, such as `Ford Transit` or `Vauxhall Vivaro`. This can be used for manufacturer-level analysis. |

## Garages Table

The `Garages` table contains one record per garage.

| Column | Data Type | Description |
|---|---:|---|
| garage_id | INTEGER | Unique garage identifier used to link garage records to bookings. |
| garage_name | TEXT | Name of the garage handling the repair or VOR event. |

## Bookings_and_VOR Table

The `Bookings_and_VOR` table is the main operational table. It contains one record per booking/VOR event.

| Column | Data Type | Description |
|---|---:|---|
| booking_id | INTEGER | Unique identifier for each booking/VOR record. |
| vehicle_id | TEXT | Vehicle linked to the booking. Joins to `Vehicles.vehicle_id`. |
| garage_id | INTEGER | Garage linked to the booking. Joins to `Garages.garage_id`. |
| defect_reported_datetime | TEXT | Date and time the defect was reported. Used as the starting point for booking SLA analysis. |
| garage_booked_datetime | TEXT | Date and time the garage booking was made. Used with defect reported time to calculate hours to book. |
| garage_in_date | TEXT | Date and time the vehicle arrived at the garage. Used as the start point for VOR downtime. |
| garage_out_date | TEXT | Date and time the vehicle left the garage. Used as the end point for VOR downtime. |
| actual_repair_start_date | TEXT | Date and time repair work actually started. Used to analyse delay between garage arrival and repair start. |
| estimated_completion_date | TEXT | Expected completion date for the repair. Can be compared with actual garage out date to assess overrun. |
| primary_delay_reason | TEXT | Main reason for delay, such as parts backorder, garage capacity, incorrect diagnosis, or recovery issue. |
| hours_to_book | REAL | Number of hours between defect report and garage booking. Used to measure whether specialist vehicles were booked within 48 hours. |
| booking_sla_breached? | TEXT | Indicates whether the 48-hour booking SLA was breached. Values include `Yes`, `No`, or `Not Applicable`. |
| hours_to_start_repair | REAL | Number of hours between garage arrival and actual repair start. Used to assess garage intake or repair start delays. |
| total_vor_days | REAL | Total vehicle off-road downtime in days, calculated from garage in date to garage out date. |
| vor_sla_breached? | TEXT | Indicates whether the VOR SLA of 3.5 days was breached. Values include `Yes` or `No`. |

## Key Metrics

| Metric | Description |
|---|---|
| Booking SLA Compliance | Percentage of specialist vehicles booked within 48 hours of defect report. |
| VOR SLA Compliance | Percentage of vehicles with total VOR downtime at or below 3.5 days. |
| Total VOR Days | Total downtime from garage arrival to garage exit. |
| Average VOR Days | Mean downtime across vehicles, garages, delay reasons, or manufacturers. |
| Fleet Average Variance | Difference between a vehicle’s VOR days and the overall fleet average. |
| Repair Start Delay | Time between garage arrival and actual repair start. |

## Business Rules Used

| Rule | Description |
|---|---|
| Specialist booking SLA | Specialist vehicles should be booked within 48 hours of defect report. |
| VOR SLA | Vehicle off-road downtime target is 3.5 days or less. |
| Booking SLA breach | A specialist vehicle is considered breached if `hours_to_book` is greater than 48. |
| VOR SLA breach | A vehicle is considered breached if `total_vor_days` is greater than 3.5. |

## Notes

- This is a mock dataset and does not contain real company, customer, driver, supplier, or garage data.
- Date/time fields are stored as text in SQLite but are formatted as date/time values.
- The table `Bookings_and_VOR` is the primary table for most SQL analysis.
- Columns containing a question mark, such as `booking_sla_breached?`, should be wrapped in double quotes when queried in SQLite.
