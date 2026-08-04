select 
    {{ dbt_utils.generate_surrogate_key(['customer_id'])}} as customer_key,
    {# md5(cast(customer_id as varchar)) as customer_key, #}
    customer_id,
    customer_name,
    gender,
    country,
    city,
    zip_code,
    state,
    state_code,
    continent,
    birthday
from {{ ref('silver_customers') }}