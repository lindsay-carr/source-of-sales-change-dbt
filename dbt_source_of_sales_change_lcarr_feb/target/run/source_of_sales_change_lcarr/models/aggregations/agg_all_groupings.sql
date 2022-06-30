

  create view "cfa"."public"."agg_all_groupings__dbt_tmp" as (
    
select quarter,monthend_date,
location_num,dma_name,region_name,service_team_name,
location_type_code,daypart,destination_desc,
sum(sales_sub_total) as sales_sub_total,
sum(refund) as refunds,
count(distinct trans_id) as transactions,
sum(visit_count) as purchaser_visits,
sum(credit_flag) as credit_txn,
sum(total_items_promo_count) as total_items_promo_count,
sum(total_items_sold_count) as total_items_sold_count
from public.lc_transactions_items
group by quarter,monthend_date,
location_num,dma_name,region_name,service_team_name,
location_type_code,daypart,destination_desc
union
select quarter,monthend_date,
location_num,dma_name,region_name,service_team_name,
location_type_code,'All' as dayaprt,destination_desc,
sum(sales_sub_total) as sales_sub_total,
sum(refund) as refunds,
count(distinct trans_id) as transactions,
sum(visit_count) as purchaser_visits,
sum(credit_flag) as credit_txn,
sum(total_items_promo_count) as total_items_promo_count,
sum(total_items_sold_count) as total_items_sold_count
from public.lc_transactions_items
group by quarter,monthend_date,
location_num,dma_name,region_name,service_team_name,
location_type_code,daypart,destination_desc
  ) with no schema binding;
