SELECT
	CASE
		WHEN L.price < 100 THEN 'Budget (<$100)'
		WHEN L.price BETWEEN 100 AND 199 THEN 'Moderate ($100-$199)'
		WHEN L.price BETWEEN 200 AND 399 THEN 'Premium ($200-$399)'
		WHEN L.price BETWEEN 400 AND 999 THEN 'Luxury ($400-$999)'
		ELSE 'Ultra-Luxury ($1000+)'
	END AS price_tier,
	COUNT(DISTINCT L.id) AS unique_properties,
	COUNT(C.date) AS total_calendar_days,
	SUM(CASE WHEN C.available = 'f' THEN 1 ELSE 0 END) AS total_booked_days,
-- Dividing the number of booked days by the total numbers of calendar days to calculate occupancy %
	ROUND(
        (SUM(CASE WHEN C.available = 'f' THEN 1 ELSE 0 END) * 1.0 / COUNT(C.date)) * 100, 
        2
    ) AS occupancy_percentage
	FROM listings L
	INNER JOIN calendar C
		ON L.id = C.listing_id
	WHERE L.estimated_revenue_l365d > 0
		AND L.estimated_revenue_l365d IS NOT NULL
	GROUP BY
		CASE
			WHEN L.price < 100 THEN 'Budget (<$100)'
			WHEN L.price BETWEEN 100 AND 199 THEN 'Moderate ($100-$199)'
			WHEN L.price BETWEEN 200 AND 399 THEN 'Premium ($200-$399)'
			WHEN L.price BETWEEN 400 AND 999 THEN 'Luxury ($400-$999)'
			ELSE 'Ultra-Luxury ($1000+)'
		END
	ORDER BY MIN(L.price);