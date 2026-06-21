-- Raw data included unbooked and blank listings. Using CTE to isolate active, revenue-generating properties so the zeros will not skew market averages.
WITH RankedRevenue AS (
    SELECT 
        id,
        price,
        estimated_revenue_l365d,
-- NTILE() window function to segment the Bozeman market into deciles based on revenue performance.
        NTILE(10) OVER (ORDER BY estimated_revenue_l365d DESC) AS revenue_decile
    FROM listings
    WHERE estimated_revenue_l365d > 0 AND estimated_revenue_l365d IS NOT NULL
)
SELECT 
    revenue_decile,
    COUNT(*) AS total_properties,
    SUM(estimated_revenue_l365d) AS total_decile_revenue,
    AVG(estimated_revenue_l365d) AS avg_property_revenue,
    AVG(price) AS avg_nightly_rate,
-- Dividing estimated_revenue_l365d by the total revenue to calculate market share percentage of each listing. Multiplying by 1.0 to use decimal math instead of integers.
    ROUND((SUM(estimated_revenue_l365d) * 1.0 / (SELECT SUM(estimated_revenue_l365d) FROM listings WHERE estimated_revenue_l365d > 0)) * 100, 2) AS market_share_percentage
FROM RankedRevenue
GROUP BY revenue_decile
ORDER BY revenue_decile;

/* Insight: The top 10% of revenue-generating rentals in Bozeman make up nearly 30% of all short-term rental 
revenue with an average nightly rate of 1500 USD. */
