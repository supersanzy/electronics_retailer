select cast(Date as date) as date,
        Currency as currency,
        cast(Exchange as numeric(7,5)) as exchange_rates
from {{ ref('bronze_exchange_rates')}}