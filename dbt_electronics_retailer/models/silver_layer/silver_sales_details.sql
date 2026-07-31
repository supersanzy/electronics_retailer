with silver_sales_data as
( 
    select 
        OrderNumber as order_id,
        LineItem as line_item,
        OrderDate as order_date,
        DeliveryDate as delivery_date,
        CustomerKey as customer_id,
        StoreKey as store_id,
        ProductKey as product_id,
        Quantity as quantity,
        CurrencyCode as currency_code
    from {{ ref('bronze_sales') }}
)

select * from silver_sales_data