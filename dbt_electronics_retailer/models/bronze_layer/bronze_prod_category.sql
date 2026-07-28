with prod_category_data as
(
    select PRODUCTKEY,
        SUBCATEGORYKEY,
        SUBCATEGORY,
        CATEGORYKEY,
        CATEGORY
    from {{ ref('Products_Category') }}
)

select * from prod_category_data