with fcs_adjusted_sales as ( 
    SELECT location_num,
    monthend_date,
    month_sales,
    adjusted_sales,
    month_sales_pg1,
    adjusted_sales_pg1
    FROM {{source('prodmix_dl','fcs_adjusted_sales')}} sales
    where monthend_date = CAST('{{var('monthend_date_1')}}' as date)
    or monthend_date = CAST('{{var('monthend_date_2')}}' as date)
)
select * from fcs_adjusted_sales