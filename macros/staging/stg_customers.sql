{{ config(materialized='table') }}

SELECT
    customer_id AS id_cliente,
    name AS nombre,
    country_code AS pais,
    city AS ciudad,
    customer_tier AS clase,
FROM {{ source('raw','raw_customers_updated') }}