/*
Created By: Shanika Ormsby
Created Date: 06-06-2026
Description: Vehicles above the fleet average VOR
*/

SELECT
    b.vehicle_id,
    v.make_model,
    g.garage_name,
    b.total_vor_days,
    ROUND(
        b.total_vor_days - (SELECT AVG(total_vor_days) FROM Bookings_and_VOR),
        2
    ) AS days_above_fleet_average
FROM Bookings_and_VOR b
JOIN Vehicles v ON b.vehicle_id = v.vehicle_id
JOIN Garages g ON b.garage_id = g.garage_id
WHERE b.total_vor_days > (
    SELECT AVG(total_vor_days)
    FROM Bookings_and_VOR
)
ORDER BY days_above_fleet_average DESC;
