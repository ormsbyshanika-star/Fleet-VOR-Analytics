/*
Created By: Shanika Ormsby
Created Date: 05-06-2026
Description: Which Parts on backorder vehicle downtime is higher than the Fleet average?
*/

SELECT
    b.vehicle_id,
    v.make_model,

    CASE
        WHEN INSTR(v.make_model, ' ') > 0
        THEN SUBSTR(v.make_model, 1, INSTR(v.make_model, ' ') - 1)
        ELSE v.make_model
    END AS Vehicle_Manufacturer,
    b.primary_delay_reason,
    ROUND(julianday(b.garage_out_date) - julianday(b.garage_in_date), 2) AS Total_VOR_Days,
	ROUND(
        (julianday(b.garage_out_date) - julianday(b.garage_in_date)) -
        (
            SELECT AVG(julianday(g.garage_out_date) - julianday(g.garage_in_date))
            FROM Bookings_and_VOR g
        ),2) AS VOR_Variance_From_Fleet_Avg
FROM Bookings_and_VOR b
JOIN Vehicles v
    ON b.vehicle_id = v.vehicle_id
WHERE b.primary_delay_reason = 'Parts on Backorder'
ORDER BY Total_VOR_Days DESC;
