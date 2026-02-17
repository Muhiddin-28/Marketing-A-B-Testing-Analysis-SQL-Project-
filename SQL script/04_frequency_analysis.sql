-- 04. Frequency Analysis
-- Purpose: Find how conversion changes as ad exposure increases

SELECT
  CASE
    WHEN total_ads BETWEEN 0 AND 5 THEN '0–5 ads'
    WHEN total_ads BETWEEN 6 AND 10 THEN '6–10 ads'
    WHEN total_ads BETWEEN 11 AND 20 THEN '11–20 ads'
    ELSE '21+ ads'
  END AS ads_bucket,
  COUNT(*) AS users,
  SUM(CASE WHEN converted THEN 1 ELSE 0 END) AS conversions,
  ROUND(
    SUM(CASE WHEN converted THEN 1 ELSE 0 END)::numeric / COUNT(*),
    4
  ) AS conversion_rate
FROM ab_marketing
WHERE test_group = 'ad'
GROUP BY ads_bucket
ORDER BY ads_bucket;
