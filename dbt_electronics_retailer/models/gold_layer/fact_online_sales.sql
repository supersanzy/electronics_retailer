with online_sales as
(
    select order_id, 
        line_item,
        product_key, 
        customer_key, 
        store_key,
        quantity, 
        unit_price_usd,
        order_date, 
        delivery_date,
        currency_code,
        sales_channel
        
    from {{ ref('fact_sales') }}
    where delivery_date is not null
)

select * from online_sales