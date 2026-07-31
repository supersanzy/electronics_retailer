select 
    row_number() over(order by customer_id) as customer_key,
    customer_id,
    customer_name,
    gender,
    country,
    city,
    state,
    birthday
from {{ ref('silver_customers') }}