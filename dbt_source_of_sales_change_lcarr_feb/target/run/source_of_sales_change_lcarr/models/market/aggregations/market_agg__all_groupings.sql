

  create  table
    "cfa"."public"."market_agg__all_groupings__dbt_tmp"
    
    
    
  as (
    with aggregations_all_groupings as (
    select quarter,monthend_date,
    location_num,dma_name,region_name,service_team_name,
    location_type_code,daypart,destination_desc,
    sum(sales_sub_total) as sales_sub_total,
    count(distinct trans_id) as transactions,
    sum(visit_count) as purchaser_visits,
    sum(credit_flag) as credit_txn,
    sum(total_items_promo_count) as total_items_promo_count,
    sum(total_items_sold_count) as total_items_sold_count
    from "cfa"."public"."lcarr_sosx_trans_item"
    group by 1,2,3,4,5,6,7,8,9
    union
    select quarter,monthend_date,
    location_num,dma_name,region_name,service_team_name,
    location_type_code,'All' as daypart,destination_desc,
    sum(sales_sub_total) as sales_sub_total,
    count(distinct trans_id) as transactions,
    sum(visit_count) as purchaser_visits,
    sum(credit_flag) as credit_txn,
    sum(total_items_promo_count) as total_items_promo_count,
    sum(total_items_sold_count) as total_items_sold_count
    from "cfa"."public"."lcarr_sosx_trans_item"
    group by 1,2,3,4,5,6,7,8,9
    union
    select quarter,monthend_date,
    location_num,dma_name,region_name,service_team_name,
    location_type_code,'All' as daypart,'All' as destination_desc,
    sum(sales_sub_total) as sales_sub_total,
    count(distinct trans_id) as transactions,
    sum(visit_count) as purchaser_visits,
    sum(credit_flag) as credit_txn,
    sum(total_items_promo_count) as total_items_promo_count,
    sum(total_items_sold_count) as total_items_sold_count
    from "cfa"."public"."lcarr_sosx_trans_item"
    group by 1,2,3,4,5,6,7,8,9
    union
    select quarter,monthend_date,
    location_num,dma_name,region_name,service_team_name,
    location_type_code,daypart,'All' as destination_desc,
    sum(sales_sub_total) as sales_sub_total,
    count(distinct trans_id) as transactions,
    sum(visit_count) as purchaser_visits,
    sum(credit_flag) as credit_txn,
    sum(total_items_promo_count) as total_items_promo_count,
    sum(total_items_sold_count) as total_items_sold_count
    from "cfa"."public"."lcarr_sosx_trans_item"
    group by 1,2,3,4,5,6,7,8,9
    union
    select quarter,monthend_date,
    location_num,dma_name,region_name,service_team_name,
    'All' as location_type_code,daypart,'All' as destination_desc,
    sum(sales_sub_total) as sales_sub_total,
    count(distinct trans_id) as transactions,
    sum(visit_count) as purchaser_visits,
    sum(credit_flag) as credit_txn,
    sum(total_items_promo_count) as total_items_promo_count,
    sum(total_items_sold_count) as total_items_sold_count
    from "cfa"."public"."lcarr_sosx_trans_item"
    group by 1,2,3,4,5,6,7,8,9
    union
    select quarter,monthend_date,
    location_num,dma_name,region_name,service_team_name,
    'All' as location_type_code,daypart,destination_desc,
    sum(sales_sub_total) as sales_sub_total,
    count(distinct trans_id) as transactions,
    sum(visit_count) as purchaser_visits,
    sum(credit_flag) as credit_txn,
    sum(total_items_promo_count) as total_items_promo_count,
    sum(total_items_sold_count) as total_items_sold_count
    from "cfa"."public"."lcarr_sosx_trans_item"
    group by 1,2,3,4,5,6,7,8,9
    union
    select quarter,monthend_date,
    location_num,dma_name,region_name,service_team_name,
    'All' as location_type_code,'All' as daypart,destination_desc,
    sum(sales_sub_total) as sales_sub_total,
    count(distinct trans_id) as transactions,
    sum(visit_count) as purchaser_visits,
    sum(credit_flag) as credit_txn,
    sum(total_items_promo_count) as total_items_promo_count,
    sum(total_items_sold_count) as total_items_sold_count
    from "cfa"."public"."lcarr_sosx_trans_item"
    group by 1,2,3,4,5,6,7,8,9
    union
    select quarter,monthend_date,
    location_num,dma_name,region_name,service_team_name,
    'All' as location_type_code,'All' as daypart,'All' as destination_desc,
    sum(sales_sub_total) as sales_sub_total,
    count(distinct trans_id) as transactions,
    sum(visit_count) as purchaser_visits,
    sum(credit_flag) as credit_txn,
    sum(total_items_promo_count) as total_items_promo_count,
    sum(total_items_sold_count) as total_items_sold_count
    from "cfa"."public"."lcarr_sosx_trans_item"
    group by 1,2,3,4,5,6,7,8,9
) 
select * from aggregations_all_groupings
  );