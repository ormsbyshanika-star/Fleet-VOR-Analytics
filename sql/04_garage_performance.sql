/*
Created By: Shanika Ormsby
Created Date: 06-06-2026
Description: Garage-level VOR SLA performance
*/

SELECT
    g.garage_name,
    COUNT(*) AS jobs,
    ROUND(AVG(b.total_vor_days), 2) AS avg_vor_days,
    ROUND(
        100.0 * SUM(CASE WHEN b."vor_sla_breached?" = 'No' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS vor_sla_compliance_percent
FROM Bookings_and_VOR b
JOIN Garages g ON b.garage_id = g.garage_id
GROUP BY g.garage_name
ORDER BY vor_sla_compliance_percent ASC;
