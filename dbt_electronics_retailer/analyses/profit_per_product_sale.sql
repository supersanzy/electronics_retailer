select
    p.product_name, 
    f.unit_cost_usd, 
    f.unit_price_usd, 
    f.unit_price_usd - f.unit_cost_usd as profit_per_product_sale
from {{ ref('fact_sales') }} as f 
join {{ ref('dim_products') }} as p 
on p.product_key = f.product_key
order by profit_per_product_sale desc