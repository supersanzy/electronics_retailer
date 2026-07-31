select 
    date,
    currency,
    exchange_rates
from {{ ref('silver_exchange_rates') }}