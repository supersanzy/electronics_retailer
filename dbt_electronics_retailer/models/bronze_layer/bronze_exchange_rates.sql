with exchange_rates as
(
    select 
        Date,
        Currency,
        Exchange
    from {{ ref('Exchange_Rates') }}
)

select * from exchange_rates