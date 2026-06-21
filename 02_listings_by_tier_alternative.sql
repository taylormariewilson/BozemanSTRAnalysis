WITH TieredListings AS (
    SELECT 
        estimated_revenue_l365d,
        price,
        CASE 
            WHEN price < 100 THEN 'Budget (<$100)'
            WHEN price BETWEEN 100 AND 199 THEN 'Moderate ($100-$199)'
            WHEN price BETWEEN 200 AND 399 THEN 'Premium ($200-$399)'
            WHEN price BETWEEN 400 AND 999 THEN 'Luxury ($400-$999)'
            ELSE 'Ultra-Luxury ($1000+)' 
        END AS price_tier
    FROM listings
    WHERE estimated_revenue_l365d > 0 AND estimated_revenue_l365d IS NOT NULL
)
SELECT 
    price_tier,
    COUNT(*) AS total_properties,
    ROUND(AVG(estimated_revenue_l365d), 2) AS avg_tier_revenue
FROM TieredListings
GROUP BY price_tier
ORDER BY MIN(price);