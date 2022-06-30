with fcr_loc_sales_elig as ( 
    select location_num,monthend_date,
    actual_days, avail_days
    from "cfa"."public"."lcarr_sosx_stg__dim_fcr_loc_sales_elig"
), dim_monthend_date as ( 
    select monthend_date,previous_year_monthend_date
    from "cfa"."public"."lcarr_sosx_calc__dim_monthend_date"
), dim_same_store as ( 
    select a.location_num, a.monthend_date, '1 month' as look_back_period, 
    a.actual_days, a.avail_days, b.previous_year_monthend_date,
    cast(a.actual_days as decimal)/a.avail_days as same_store_percent
    from fcr_loc_sales_elig a 
    inner join dim_monthend_date b using (monthend_date)
)
select * from dim_same_store