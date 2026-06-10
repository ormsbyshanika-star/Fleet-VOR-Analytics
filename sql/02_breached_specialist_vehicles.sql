/*
Created By: Shanika Ormsby
Created Date: 06-06-2026
Description: How many Specialist vehicles were booked outside the 48-hour SLA?
*/

SELECT
    b.vehicle_id,
    v.make_model,
    g.garage_name,
    b.hours_to_book,
    b."booking_sla_breached?"
FROM Bookings_and_VOR b
JOIN Vehicles v ON b.vehicle_id = v.vehicle_id
JOIN Garages g ON b.garage_id = g.garage_id
WHERE v.vehicle_type = 'Specialised'
  AND b.hours_to_book > 48
ORDER BY b.hours_to_book DESC;
