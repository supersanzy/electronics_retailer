{{
    config(materialized='ephemeral')
}}

select
    customer_id,
    customer_name,
    city,
    state,
    country
from {{ ref('silver_customers')}}