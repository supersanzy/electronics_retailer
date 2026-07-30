with prod_category as 
(
    select 
        distinct CATEGORYKEY as product_category_key,
        CATEGORY as product_category
    FROM {{ ref("bronze_prod_category") }}
)

select 
    product_category_key,
    product_category
from prod_category