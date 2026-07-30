with silver_customers_data as
(
    select       
        CustomerKey as customer_key,
        {{clean_strings('Gender')}} as gender,
        {{clean_strings('Name')}} as customer_name,
        {{clean_strings('City')}} as city,
        StateCode as state_code,
        {{clean_strings('State')}} as state,
        ZipCode as zip_code,
        Country as country,
        Continent as continent,
        cast(Birthday as date) as birthday
    from {{ ref('bronze_customers') }}
)

select * from silver_customers_data