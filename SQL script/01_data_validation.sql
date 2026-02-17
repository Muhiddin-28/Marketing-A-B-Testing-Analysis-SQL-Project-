-- Check for missing values
SELECT
  COUNT(*) FILTER (WHERE user_id IS NULL)        AS null_user_id,
  COUNT(*) FILTER (WHERE test_group IS NULL)     AS null_test_group,
  COUNT(*) FILTER (WHERE converted IS NULL)      AS null_converted,
  COUNT(*) FILTER (WHERE total_ads IS NULL)      AS null_total_ads,
  COUNT(*) FILTER (WHERE most_ads_day IS NULL)   AS null_day,
  COUNT(*) FILTER (WHERE most_ads_hour IS NULL)  AS null_hour
FROM ab_marketing;

-- Total records
SELECT COUNT(*) AS total_users
FROM ab_marketing;

-- A/B group distribution
SELECT test_group, COUNT(*) AS users
FROM ab_marketing
GROUP BY test_group;

-- Conversion distribution
SELECT converted, COUNT(*) AS users
FROM ab_marketing
GROUP BY converted;

-- Check logical ranges
SELECT
  MIN(total_ads) AS min_ads,
  MAX(total_ads) AS max_ads
FROM ab_marketing;

-- Validate hours
SELECT DISTINCT most_ads_hour
FROM ab_marketing
ORDER BY most_ads_hour;


