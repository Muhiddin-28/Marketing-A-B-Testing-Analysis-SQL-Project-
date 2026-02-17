-- 05. Time Analysis
-- Purpose: Identify the most effective days and hours for ad performance

-- Conversion by day of week
SELECT
  most_ads_day AS day,
  COUNT(*) AS users,
  SUM(CASE WHEN converted THEN 1 ELSE 0 END) AS conversions,
  ROUND(
    SUM(CASE WHEN converted THEN 1 ELSE 0 END)::numeric / COUNT(*),
    4
  ) AS conversion_rate
FROM ab_marketing
WHERE test_group = 'ad'
GROUP BY most_ads_day
ORDER BY conversion_rate DESC;

-- Conversion by hour of day
SELECT
  most_ads_hour AS hour,
  COUNT(*) AS users,
  SUM(CASE WHEN converted THEN 1 ELSE 0 END) AS conversions,
  ROUND(
    SUM(CASE WHEN converted THEN 1 ELSE 0 END)::numeric / COUNT(*),
    4
  ) AS conversion_rate
FROM ab_marketing
WHERE test_group = 'ad'
GROUP BY most_ads_hour
ORDER BY conversion_rate DESC;
