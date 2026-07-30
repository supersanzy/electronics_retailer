with silver_stores_data as
(
    select 
        cast(StoreKey as int) as store_key,
        {{clean_strings('Country')}} as country,
        {{clean_strings('State')}} as state,
        cast(SquareMeters as int) as square_meters,
        cast(OpenDate as date) as open_date
    from {{ ref('bronze_stores') }}
)

select * from silver_stores_data
