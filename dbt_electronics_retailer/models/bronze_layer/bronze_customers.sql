with customers_data as 
(
    select 
        CustomerKey,
        Gender,
        Name,
        City,
        StateCode,
        State,
        ZipCode,
        Country,
        Continent,
        Birthday

    from {{ source('electronics_retail_src', 'customers')}}
)

select * from customers_data