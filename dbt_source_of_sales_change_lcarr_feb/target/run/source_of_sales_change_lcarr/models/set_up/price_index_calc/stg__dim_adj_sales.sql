

  create view "cfa"."public"."stg__dim_adj_sales__dbt_tmp" as (
    with fcs_adjusted_sales as ( 
    SELECT location_num,
    monthend_date,
    month_sales,
    adjusted_sales,
    month_sales_pg1,
    adjusted_sales_pg1
    FROM "cfa"."prodmix_dl"."fcs_adjusted_sales" sales
    where monthend_date = CAST('2021-02-28' as date)
    or monthend_date = CAST('2022-02-28' as date)
)
select * from fcs_adjusted_sales
  ) with no schema binding;
