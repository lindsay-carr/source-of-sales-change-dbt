with dim_date_pull as ( 
    select distinct monthend_date,CAST(DATEADD(month, -11, monthend_date) as date) as comparison_monthend_date
    from {{source('public','dim_date')}}
    where monthend_date >= CAST('01-01-2019' as date)
    and monthend_date < DATEADD(month,1,GETDATE())
), dim_date_calc_1 as ( 
    select monthend_date,comparison_monthend_date,
    DATEPART(day,comparison_monthend_date) as day_compare
    from dim_date_pull
), dim_date_calc_2 as ( 
    select monthend_date,
    CAST(DATEADD(day,-day_compare,comparison_monthend_date) as date) as previous_year_monthend_date 
    from dim_date_calc_1
)

select * from dim_date_calc_2
