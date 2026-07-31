with offline_sales as
(
    select sd.order_id, 
        sd.line_item,
        sd.order_date, 
        p.product_key, 
        c.customer_key, 
        s.store_key,
        sd.quantity, 
        p.unit_price_usd,
        sd.currency_code
        
    from {{ ref('silver_sales_details') }} as sd
    left join {{ ref('dim_customers') }} as c
    on c.customer_id = sd.customer_id
    left join {{ ref('dim_stores') }} as s
    on s.store_id = sd.store_id
    left join {{ ref('dim_products') }} as p
    on p.product_id = sd.product_id
    where sd.delivery_date is null
)

select * from offline_sales