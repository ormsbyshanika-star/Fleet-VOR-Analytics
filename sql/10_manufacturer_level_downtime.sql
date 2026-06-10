/*
Created By: Shanika Ormsby
Created Date: 06-06-2026
Description:  Manufacturer-level downtime
*/

SELECT
    CASE
        WHEN INSTR(v.make_model, ' ') > 0
        THEN SUBSTR(v.make_model, 1, INSTR(v.make_model, ' ') - 1)
        ELSE v.make_model
    END AS manufacturer,
    COUNT(*) AS jobs,
    ROUND(AVG(b.total_vor_days), 2) AS avg_vor_days,
    ROUND(SUM(b.total_vor_days), 2) AS total_vor_days
FROM Bookings_and_VOR b
JOIN Vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY manufacturer
ORDER BY avg_vor_days DESC;
