/*
Created By: Shanika Ormsby
Created Date: 06-06-2026
Description: How many Specialist vehicles bookings were SLA compliant?
*/

SELECT
    COUNT(*) AS total_specialist_bookings,
    SUM(CASE WHEN b."booking_sla_breached?" = 'No' THEN 1 ELSE 0 END) AS booked_within_48_hours,
    ROUND(
        100.0 * SUM(CASE WHEN b."booking_sla_breached?" = 'No' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS booking_sla_compliance_percent
FROM Bookings_and_VOR b
JOIN Vehicles v ON b.vehicle_id = v.vehicle_id
WHERE v.vehicle_type = 'Specialised';
