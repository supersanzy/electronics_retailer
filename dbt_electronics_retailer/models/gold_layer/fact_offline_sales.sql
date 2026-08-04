with offline_sales as
(
    select 
        order_id, 
        line_item,
        order_date, 
        product_key, 
        customer_key, 
        store_key,
        quantity, 
        unit_price_usd,
        currency_code,
        sales_channel
        
    from {{ ref('fact_sales') }}
    where delivery_date is null
)

select * from offline_sales