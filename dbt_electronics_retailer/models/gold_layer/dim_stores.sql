select 
    row_number() over(order by store_id) as store_key,
    store_id,
    {{case_flag('store_id')}} as enriched_store,
    country,
    state,
   open_date
from {{ ref('silver_stores') }} 