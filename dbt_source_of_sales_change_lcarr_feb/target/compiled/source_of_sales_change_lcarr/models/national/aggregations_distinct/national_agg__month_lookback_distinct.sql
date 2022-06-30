with one_month_set_up as (
  select a.region_name,a.service_team_name,a.dma_name,
  a.location_num,a.monthend_date,'1 month' as look_back_period,
  a.trans_id,a.cfa_one_id,a.customer_hash,
  a.location_type_code,a.daypart,a.destination_desc,
  b.same_store_eligible
  from "cfa"."public"."lcarr_sosx_trans_item" a
  inner join "cfa"."public"."lcarr_sosx_stg__fct_same_store" b
  on a.location_num = b.location_num
  and a.monthend_date = b.monthend_date 
  and b.look_back_period = '1 month'
)
select * from one_month_set_up