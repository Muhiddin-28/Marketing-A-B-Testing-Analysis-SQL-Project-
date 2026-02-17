-- 03. Statistical Significance Check
-- Purpose: Verify whether the conversion rate difference between
-- the ad group and the control (PSA) group is statistically meaningful

WITH stats AS (
    -- Aggregate users and conversions by test group
    SELECT
        test_group,
        COUNT(*) AS users,
        SUM(CASE WHEN converted THEN 1 ELSE 0 END)::numeric AS conversions
    FROM ab_marketing
    GROUP BY test_group
),
rates AS (
    -- Calculate conversion rates
    SELECT
        test_group,
        conversions / users AS conversion_rate,
        users
    FROM stats
),
calc AS (
    -- Extract values for ad and psa groups
    SELECT
        (SELECT conversion_rate FROM rates WHERE test_group = 'ad')  AS cr_ad,
        (SELECT conversion_rate FROM rates WHERE test_group = 'psa') AS cr_psa,
        (SELECT users FROM rates WHERE test_group = 'ad')            AS n_ad,
        (SELECT users FROM rates WHERE test_group = 'psa')           AS n_psa
)
SELECT
    -- Difference in conversion rates (lift)
    cr_ad - cr_psa AS conversion_diff,

    -- Standard error approximation for two proportions
    SQRT(
        (cr_ad * (1 - cr_ad) / n_ad) +
        (cr_psa * (1 - cr_psa) / n_psa)
    ) AS standard_error
FROM calc;
