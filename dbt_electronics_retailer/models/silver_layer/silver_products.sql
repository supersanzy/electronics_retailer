with silver_products_data as
(
    select ProductKey as product_id,
        {{clean_strings('ProductName')}} AS product_name,
        {{clean_strings('Brand')}} as brand,
        {{clean_strings('Color')}} as color,
        {{replace_symbols('UnitCostUSD')}} as unit_cost_usd,
        {{replace_symbols('UnitPriceUSD')}} as unit_price_usd,
        CategoryKey as category_id, 
        {{clean_strings('Category')}} as category,
        CAST(SUBSTRING(SubcategoryKey, 1, 1) AS INT) as sub_category_id,
        {{clean_strings('Subcategory')}} as sub_category
    from {{ ref('bronze_products') }}
),

    final_products_data as
    (
        select product_id,
            product_name,
            brand,
            color,
            cast(replace(unit_cost_usd, ',', '') as numeric(10,2)) as unit_cost_usd,
            cast(replace(unit_price_usd, ',', '') as numeric(10,2)) as unit_price_usd,
            category_id,
            category,
            sub_category_id,
            sub_category
        from silver_products_data
    )

select * from final_products_data