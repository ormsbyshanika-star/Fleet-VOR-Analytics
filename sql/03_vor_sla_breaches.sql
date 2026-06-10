/*
Created By: Shanika Ormsby
Created Date: 06-06-2026
Description: Vehicles breaching the 3.5-day VOR SLA
*/

SELECT
    b.vehicle_id,
    v.vehicle_type,
    v.make_model,
    g.garage_name,
    b.primary_delay_reason,
    b.total_vor_days
FROM Bookings_and_VOR b
JOIN Vehicles v ON b.vehicle_id = v.vehicle_id
JOIN Garages g ON b.garage_id = g.garage_id
WHERE b.total_vor_days > 3.5
ORDER BY b.total_vor_days DESC;
