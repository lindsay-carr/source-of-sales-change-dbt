

  create  table
    "cfa"."public"."regional__big_join__dbt_tmp"
    
    
    
  as (
    with big_join as ( 
  select a.*, e.unique_cfa_one_ids, e.unique_hashes, e.hash_transactions, e.hash_per_customer,
  b.price_index, 
  d.previous_year_monthend_date
  from "cfa"."public"."lcarr_sosx_regional_agg__same_store_all_store" a
  inner join "cfa"."public"."lcarr_sosx_calc__dim_price_index_3" b
  on a.look_back_period = b.look_back_period
  and a.monthend_date = b.monthend_date
  and a.same_store = b.same_store
  inner join "cfa"."public"."lcarr_sosx_calc__dim_monthend_date" d
  on a.monthend_date = d.monthend_date
  inner join "cfa"."public"."lcarr_sosx_regional_agg__distinct_calcs" e
  on a.monthend_date = e.monthend_date
  and a.look_back_period = e.look_back_period
  and a.same_store = e.same_store
  and a.location_type_code = e.location_type_code
  and a.daypart = e.daypart
  and a.destination_desc = e.destination_desc
)
select * from big_join
  );