-- 02. A/B Conversion Analysis
-- Purpose:Compare conversion performance between the Ad group (treatment)
-- and the PSA group (control) to determine whether advertising worked.

-- Step 1: Calculate users, conversions, and conversion rate per test group
SELECT
    test_group,
    COUNT(*) AS users,                     -- Total number of users in each group
    SUM(CASE WHEN converted THEN 1 ELSE 0 END) AS conversions,  -- Number of conversions
    ROUND(
        SUM(CASE WHEN converted THEN 1 ELSE 0 END)::numeric / COUNT(*),
        4
    ) AS conversion_rate                   -- Conversion rate per group
FROM ab_marketing
GROUP BY test_group;

-- Step 2: Calculate conversion lift (Ad minus PSA)
-- This shows the net impact of advertising on conversions
WITH cr AS (
    SELECT
        test_group,
        SUM(CASE WHEN converted THEN 1 ELSE 0 END)::numeric / COUNT(*) AS conversion_rate
    FROM ab_marketing
    GROUP BY test_group
)
SELECT
    (SELECT conversion_rate FROM cr WHERE test_group = 'ad')
    -
    (SELECT conversion_rate FROM cr WHERE test_group = 'psa')
    AS conversion_lift;                    -- Positive value indicates ads increased conversions
