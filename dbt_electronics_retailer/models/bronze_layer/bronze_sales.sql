with sales_data as
(
    select  
        OrderNumber,
        LineItem,
        OrderDate,
        DeliveryDate,
        CustomerKey,
        StoreKey,
        ProductKey,
        Quantity,
        CurrencyCode
    from {{ source('electronics_retail_src', 'sales') }}
)

select * from sales_data