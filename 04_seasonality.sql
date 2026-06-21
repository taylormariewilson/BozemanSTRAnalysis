SELECT 
    MONTH(C.date) AS calendar_month,
    -- Count total available tracking days for the market in that month
    COUNT(C.date) AS total_days,
    -- Sum up the booked days ('f')
    SUM(CASE WHEN C.available = 'f' THEN 1 ELSE 0 END) AS booked_days,
    -- Calculate occupancy rate for that specific month
    ROUND(
        (SUM(CASE WHEN C.available = 'f' THEN 1 ELSE 0 END) * 1.0 / COUNT(C.date)) * 100, 
        2
    ) AS monthly_occupancy_percentage
FROM calendar C
INNER JOIN listings L 
    ON L.id = C.listing_id
WHERE L.estimated_revenue_l365d > 0 
  AND L.estimated_revenue_l365d IS NOT NULL
GROUP BY MONTH(C.date)
ORDER BY calendar_month;