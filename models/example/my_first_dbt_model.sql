{{ config(materialized='table') }}

SELECT
    customer_id AS id,
    name,
    country_code,
    city,
    customer_tier,
FROM {{ ref('raw_customers_updated') }}
WHERE customer_id IS NOT NULL