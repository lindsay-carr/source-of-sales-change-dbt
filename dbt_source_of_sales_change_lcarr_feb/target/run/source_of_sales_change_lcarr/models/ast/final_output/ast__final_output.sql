

  create  table
    "cfa"."public"."ast__final_output__dbt_tmp"
    
    
    
  as (
    with twentytwo as (
select *
from "cfa"."public"."lcarr_sosx_ast__big_join" 
where monthend_date = cast('02-28-2022' as date) 
), twentyone as ( 
select * 
from "cfa"."public"."lcarr_sosx_ast__big_join"
where monthend_date = cast('02-28-2021' as date)
) 

select a.quarter,
a.look_back_period,a.same_store,
'AST' as geolevel, 
a.service_team_name as geolevel_detail,
a.location_type_code,a.daypart,a.destination_desc,
a.monthend_date as current_monthend_date,
a.sales_sub_total as current_sales_sub_total,
a.transactions as current_transactions,
a.purchaser_visits as current_purchaser_visits,
a.credit_txn as current_credit_txn,
a.total_items_promo_count as current_total_items_promo_count,
a.total_items_sold_count as current_total_items_sold_count,
a.actual_days as current_actual_days,
a.avail_days as current_avail_days,
a.price_index as current_price_index,
a.unique_cfa_one_ids as current_unique_cfa_one_ids,
a.unique_hashes as current_unique_hashes,
a.hash_transactions as current_hash_transactions,
a.hash_per_customer as current_hash_per_customer,
a.previous_year_monthend_date as check_date,
b.monthend_date as previous_monthend_date,
b.sales_sub_total as previous_sales_sub_total,
b.transactions as previous_transactions,
b.purchaser_visits as previous_purchaser_visits,
b.credit_txn as previous_credit_txn,
b.total_items_promo_count as previous_total_items_promo_count,
b.total_items_sold_count as previous_total_items_sold_count,
b.actual_days as previous_actual_days,
b.avail_days as previous_avail_days,
b.price_index as previous_price_index,
b.unique_cfa_one_ids as previous_unique_cfa_one_ids,
b.unique_hashes as previous_unique_hashes,
b.hash_transactions as previous_hash_transactions,
b.hash_per_customer as previous_hash_per_customer
from twentytwo a 
inner join twentyone b
on a.look_back_period = b.look_back_period 
and a.same_store = b.same_store 
and a.service_team_name = b.service_team_name
and a.location_type_code = b.location_type_code 
and a.daypart = b.daypart
and a.destination_desc = b.destination_desc
and a.previous_year_monthend_date = b.monthend_date
order by same_store,location_type_code,daypart,destination_desc
  );