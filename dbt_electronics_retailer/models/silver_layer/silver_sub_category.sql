with sub_category as 
(
    select 
        distinct CAST(SUBSTRING(SUBCATEGORYKEY, 1, 1) AS INT) as sub_category_key, 
        SUBCATEGORY as sub_catgeory
    FROM {{ ref("bronze_prod_category") }}
)

select * from sub_category