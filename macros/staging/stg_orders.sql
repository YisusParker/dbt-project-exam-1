{{ config(materialized='table') }}

SELECT
    order_id AS id_pedido,
    customer_id AS id_cliente,
    order_date AS dt_pedido,
    amount AS precio,
    currency AS moneda,
    order_status AS estado_pedido,
    item_count AS cantidad_articulos,
FROM {{ source('raw','raw_orders_updated') }}