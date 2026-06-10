/*
Created By: Shanika Ormsby
Created Date: 06-06-2026
Description: Repair start delay by garage
*/


SELECT
    g.garage_name,
    COUNT(*) AS jobs,
    ROUND(AVG(b.hours_to_start_repair), 2) AS avg_hours_to_start_repair,
    SUM(CASE WHEN b.hours_to_start_repair > 0 THEN 1 ELSE 0 END) AS delayed_start_jobs
FROM Bookings_and_VOR b
JOIN Garages g ON b.garage_id = g.garage_id
GROUP BY g.garage_name
ORDER BY avg_hours_to_start_repair DESC;
