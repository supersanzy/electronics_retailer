select 
    {{ dbt_utils.generate_surrogate_key(['store_id'])}} as store_key,
    store_id,
    {{store_type_flag('store_id')}} as derived_store,
    country,
    state,
    square_meters,
    open_date
from {{ ref('silver_stores') }} 