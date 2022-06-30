

  create view "cfa"."public"."stg__dim_fcr_loc_sales_elig__dbt_tmp" as (
    with fcr_loc_sales_elig as ( 
    select location_num,monthend_date,
    cm_num_actual_bus_days_cy as actual_days,
    cm_num_avail_bus_days_cy as avail_days
    from "cfa"."fin_lh"."fcr_locations_sales_eligibility" 
    where monthend_date >= cast('01-01-2021' as date)
)
select * from fcr_loc_sales_elig
  ) with no schema binding;
