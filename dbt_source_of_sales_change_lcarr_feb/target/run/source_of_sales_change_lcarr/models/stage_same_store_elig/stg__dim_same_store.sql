

  create view "cfa"."public"."stg__dim_same_store__dbt_tmp" as (
    with dim_monthend_date as ( 
    select monthend_date, previous_year_monthend_date
    from "cfa"."public"."lcarr_sosx_stg__dim_monthend_date"
), dim_same_store as (
    select a.location_num,a.monthend_date,'1 month' as look_back_period,
    a.cm_num_actual_bus_days_cy as actual_days,a.cm_num_avail_bus_days_cy as avail_days,
    b.previous_year_monthend_date,
    cast(a.cm_num_actual_bus_days_cy as decimal)/a.cm_num_avail_bus_days_cy as same_store_percent
    from "cfa"."fin_lh"."fcr_locations_sales_eligibility" a
    inner join dim_monthend_date b using (monthend_date)
    where monthend_date >= cast('01-01-2021' as date)
)

select *
from dim_same_store
  ) with no schema binding;
