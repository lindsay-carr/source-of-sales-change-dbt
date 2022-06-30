with dim_price_index_sales as ( 
    SELECT dma_name,
    sales.location_num,
    monthend_date,
    '1 month' as look_back_period,
    month_sales,
    adjusted_sales,
    month_sales_pg1,
    adjusted_sales_pg1
    FROM "cfa"."restfin_dl"."fcs_adjusted_sales" sales
    inner join "cfa"."public"."location_attributes" loc
    on sales.location_num = loc.location_num
    where monthend_date = CAST('02-28-2021' as date)
    or monthend_date = CAST('02-28-2022' as date)
)
select * from dim_price_index_sales