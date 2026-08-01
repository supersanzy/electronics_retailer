select 
    {{ dbt_utils.generate_surrogate_key(['product_id'])}} as product_key,
    product_id,
    product_name,
    brand,
    color,
    unit_cost_usd,
    unit_price_usd,
    category_id,
    category,
    sub_category_id,
    sub_category
from {{ ref('silver_products') }} as p

