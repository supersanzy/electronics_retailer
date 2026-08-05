{{
    config(materialized='ephemeral')
}}

select
    product_id,
    product_name,
    category,
    unit_price_usd
from {{ref('silver_products')}}