

  create view "cfa"."public"."calc__error__dbt_tmp" as (
    with fcs_adj_sales as ( 
    select location_num,monthend_date, 
    month_sales,adjusted_sales,month_sales_pg1,adjusted_sales_pg1
    from "cfa"."public"."lcarr_sosx_stg__dim_adj_sales"
), location_attributes as ( 
    select location_num, dma_name
    from "cfa"."public"."lcarr_sosx_calc__dim_monthend_date"
), fcs_adj_sales_loc as ( 
    select b.dma_name,a.location_num,a.monthend_date,'1 month' as look_back_period,
    a.month_sales,a.adjusted_sales,a.month_sales_pg1,a.adjusted_sales_pg1
    from fcs_adj_sales a 
    inner join location_attributes b using (location_num)
)
select * from fcs_adj_sales_loc
  ) with no schema binding;
