with products_data as
(
    select ProductKey,
        ProductName,
        Brand,
        Color,
        UnitCostUSD,
        UnitPriceUSD,
        SUBCATEGORYKEY,
        CATEGORYKEY
    from {{ source('electronics_retail_src', 'products') }}
)

select * from products_data