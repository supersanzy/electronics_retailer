
{# comparing each year's total sales against the previous year's total sales to see how sales changed over time.#}
with total_sales as 
(
    select extract(year from order_date) as year,
    sum(unit_price_usd) as total_sales
    from {{ ref('fact_offline_sales') }}
    group by 1
),
    final_data as
    (
        select year, total_sales,
            lag(total_sales) over(order by year) as year_over_year
            from total_sales
    )

select * from final_data