/*
Created By: Shanika Ormsby
Created Date: 06-06-2026
Description: Specialist vehicles booked on time but still breaching VOR SLA
*/

SELECT
    b.vehicle_id,
    v.make_model,
    g.garage_name,
    b.hours_to_book,
    b.total_vor_days,
    b.primary_delay_reason
FROM Bookings_and_VOR b
JOIN Vehicles v ON b.vehicle_id = v.vehicle_id
JOIN Garages g ON b.garage_id = g.garage_id
WHERE v.vehicle_type = 'Specialised'
  AND b."booking_sla_breached?" = 'No'
  AND b."vor_sla_breached?" = 'Yes'
ORDER BY b.total_vor_days DESC;
