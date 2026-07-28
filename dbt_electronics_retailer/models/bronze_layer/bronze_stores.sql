with stores_data as
(
    select StoreKey,
        Country,
        State,
        SquareMeters,
        OpenDate
    from {{ ref('Stores') }}
)

select * from stores_data