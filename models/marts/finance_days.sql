
-- Build daily finance KPIs for reporting
SELECT
    date_date AS sales_date,
    COUNT(DISTINCT sales_id) AS daily_transactions,
    ROUND(AVG(amount), 2) AS average_basket
FROM {{ ref('stg_raw__sales') }}
GROUP BY date_date
ORDER BY date_date
