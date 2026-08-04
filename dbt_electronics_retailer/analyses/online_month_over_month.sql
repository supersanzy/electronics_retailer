
{# comparing each month's total sales against the previous month's total sales to see how sales changed over time.#}

with total_sales as 
(
    SELECT TO_CHAR(order_date, 'YYYY-MM') as year_month,
    sum(unit_price_usd) as total_sales
    from {{ ref('fact_online_sales') }}
    group by 1
),
    final_data as
    (
        select year_month, total_sales,
            lag(total_sales) over(order by year_month asc) as month_over_month,
            abs(total_sales - lag(total_sales) over(order by year_month)) as sales_difference
            from total_sales
    )

select * from final_data