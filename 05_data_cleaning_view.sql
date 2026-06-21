DROP VIEW IF EXISTS v_clean_listings;
GO

CREATE VIEW v_clean_listings AS
SELECT 
    id,
    listing_url,
    name,
    room_type,
    accommodates,
    bathrooms,
    bedrooms,
    price,
    estimated_revenue_l365d,
    latitude,
    longitude
FROM listings
-- Removing listings where revenue is zero
WHERE estimated_revenue_l365d > 0 
-- Removing listings where revenue is null
  AND estimated_revenue_l365d IS NOT NULL
-- Removing outlier listings over $2000 that skew the data
  AND price < 2000;

SELECT *
FROM v_clean_listings;
