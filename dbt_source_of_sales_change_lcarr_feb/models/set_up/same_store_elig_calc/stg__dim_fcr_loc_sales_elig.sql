with fcr_loc_sales_elig as ( 
    select location_num,monthend_date,
    cm_num_actual_bus_days_cy as actual_days,
    cm_num_avail_bus_days_cy as avail_days
    from {{source('fin_lh','fcr_locations_sales_eligibility')}} 
    where monthend_date >= cast('{{var('first_date_same_store')}}' as date)
)
select * from fcr_loc_sales_elig