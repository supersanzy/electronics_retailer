select sales_channel, sum(unit_price_usd)
from {{ ref('fact_sales') }}
group by sales_channel