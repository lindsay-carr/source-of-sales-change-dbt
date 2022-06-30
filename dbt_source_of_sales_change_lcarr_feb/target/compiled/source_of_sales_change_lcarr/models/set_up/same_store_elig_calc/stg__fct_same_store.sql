with subset_1 as ( 
  select * 
  from "cfa"."public"."lcarr_sosx_stg__dim_same_store"
  where monthend_date = cast('02-28-2022' as date) 
), subset_2 as ( 
  select * 
  from "cfa"."public"."lcarr_sosx_stg__dim_same_store"
  where monthend_date = cast('02-28-2021' as date) 
), current_comparison as (
  select s1.location_num,
  s1.look_back_period,s1.monthend_date,
  s1.actual_days as current_actual_days,s1.avail_days as current_avail_days,
  s1.same_store_percent as current_same_store_percent,
  s1.previous_year_monthend_date,
  s2.monthend_date as date_check,
  s2.actual_days as previous_actual_days,
  s2.avail_days as previous_avail_days,
  s2.same_store_percent as previous_same_store_percent
  from subset_1 s1
  inner join subset_2 s2
  on s1.location_num = s2.location_num 
  and s1.look_back_period = s2.look_back_period
  and s1.previous_year_monthend_date = s2.monthend_date
), same_store_eligibility_calc as ( 
  select location_num,look_back_period,monthend_date,
  current_actual_days,current_avail_days,current_same_store_percent,
  previous_year_monthend_date,previous_actual_days,
  previous_avail_days,previous_same_store_percent,
  case when current_same_store_percent >= 0.90
  and previous_same_store_percent >= 0.90 then 1 else 0 end as same_store_eligible
  from current_comparison
), same_store_final_output as (
  select location_num,look_back_period,monthend_date,
  current_actual_days as actual_days,current_avail_days as avail_days,
  same_store_eligible from same_store_eligibility_calc
  union 
  select location_num,look_back_period,previous_year_monthend_date as monthend_date,
  previous_actual_days as actual_days,previous_avail_days as avail_days,
  same_store_eligible from same_store_eligibility_calc
)
select * from same_store_final_output