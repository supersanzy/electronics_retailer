-- Singular test: the natural key of silver_sales_details is the
-- order-line-item combination (order_id + line_item). order_id alone repeats
-- for multi-line orders, so this composite uniqueness check is the correct
-- grain-level test. Returns rows when the grain is violated.
select
    order_id,
    line_item
from {{ ref('silver_sales_details') }}
group by order_id, line_item
having count(*) > 1
