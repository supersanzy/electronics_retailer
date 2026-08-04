with get_top_3_selling_product_and_category_sales as
(
    select p.product_name, p.category, sum(f.unit_price_usd) as total_sales_per_category,
    from {{ref('fact_sales')}} as f
    join {{ ref('dim_products') }} p
    on p.product_key = f.product_key
    group by 1, 2
),

    final_data as
    (
        select product_name, category, total_sales_per_category
            dense_rank() over(partition by category order by total_sales_per_category desc) as rn
        from get_top_3_selling_product_and_category_sales
    )

select product_name, category, total_sales_per_category, rn
from get_top_3_selling_product_and_category_sales
where rn <= 3