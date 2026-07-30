with silver_products_data as
(
    select PRODUCTKEY as product_key,
        {{clean_strings('PRODUCTNAME')}} AS product_name,
        {{clean_strings('BRAND')}} as brand,
        {{clean_strings('COLOR')}} as color,
        {{replace_symbols('UNITCOSTUSD')}} as unit_cost_usd,
        {{replace_symbols('UNITPRICEUSD')}} as unit_price_usd,
        SUBCATEGORYKEY as sub_category_key,
        CATEGORYKEY as product_category_key
    from {{ ref('bronze_products') }}
),

    final_products_data as
    (
        select product_key,
            product_name,
            brand,
            color,
            cast(unit_cost_usd as numeric(10,2)) as unit_cost_usd,
            cast(unit_price_usd as numeric(10,2)) as unit_price_usd,
            sub_category_key,
            product_category_key
        from silver_products_data
    )

select * from final_products_data