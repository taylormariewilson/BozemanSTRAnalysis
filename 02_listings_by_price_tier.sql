-- Using CASE WHEN to segment listings into price tiers
SELECT 
    CASE 
        WHEN price < 100 THEN 'Budget (<$100)'
        WHEN price BETWEEN 100 AND 199 THEN 'Moderate ($100-$199)'
        WHEN price BETWEEN 200 AND 399 THEN 'Premium ($200-$399)'
        WHEN price BETWEEN 400 AND 999 THEN 'Luxury ($400-$999)'
        ELSE 'Ultra-Luxury ($1000+)' 
    END AS price_tier,
    COUNT(*) AS total_properties,
-- Pulling the average revenue for each price tier
    ROUND(AVG(estimated_revenue_l365d), 2) AS avg_tier_revenue
FROM listings
WHERE estimated_revenue_l365d > 0 AND estimated_revenue_l365d IS NOT NULL
GROUP BY 
    CASE 
        WHEN price < 100 THEN 'Budget (<$100)'
        WHEN price BETWEEN 100 AND 199 THEN 'Moderate ($100-$199)'
        WHEN price BETWEEN 200 AND 399 THEN 'Premium ($200-$399)'
        WHEN price BETWEEN 400 AND 999 THEN 'Luxury ($400-$999)'
        ELSE 'Ultra-Luxury ($1000+)' 
    END
ORDER BY MIN(price); 
-- Insights: Ulta-Luxury generates the most revenue from only 3 listings.