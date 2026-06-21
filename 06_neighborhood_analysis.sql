SELECT
	CASE
		WHEN latitude BETWEEN 45.674 AND 45.688 AND longitude BETWEEN -111.045 AND -111.025 THEN 'Downtown Core'
		WHEN latitude BETWEEN 45.658 AND 45.673 AND longitude BETWEEN -111.055 AND -111.040 THEN 'University / MSU Area'
			ELSE 'Outlying Gallatin County / Rural'
	END AS geographic_location,
	COUNT(*) AS total_properties,
	ROUND(AVG(price), 2) AS avg_nightly_price,
	ROUND(AVG(estimated_revenue_l365d), 2) AS avg_annual_revenue
FROM v_clean_listings
GROUP BY
	CASE
	WHEN latitude BETWEEN 45.674 AND 45.688 AND longitude BETWEEN -111.045 AND -111.025 THEN 'Downtown Core'
		WHEN latitude BETWEEN 45.658 AND 45.673 AND longitude BETWEEN -111.055 AND -111.040 THEN 'University / MSU Area'
			ELSE 'Outlying Gallatin County / Rural'
	END
ORDER BY avg_annual_revenue DESC;