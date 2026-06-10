/*
Created By: Shanika Ormsby
Created Date: 06-06-2026
Description: Delay reasons with the highest average VOR
*/

SELECT
    b.primary_delay_reason,
    COUNT(*) AS jobs,
    ROUND(AVG(b.total_vor_days), 2) AS avg_vor_days,
    ROUND(MAX(b.total_vor_days), 2) AS max_vor_days
FROM Bookings_and_VOR b
GROUP BY b.primary_delay_reason
ORDER BY avg_vor_days DESC;
