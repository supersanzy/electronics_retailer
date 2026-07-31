{{
  config(
    materialized = 'view',
    )
}}

with company_cost_metrics as
(
    select
        p.product_key, 
        s.store_key,
        p.unit_price_usd,
        p.unit_cost_usd
        
    from {{ ref('silver_sales_details') }} as sd
    left join {{ ref('dim_customers') }} as c
    on c.customer_id = sd.customer_id
    left join {{ ref('dim_stores') }} as s
    on s.store_id = sd.store_id
    left join {{ ref('dim_products') }} as p
    on p.product_id = sd.product_id
    
)

select * from company_cost_metrics