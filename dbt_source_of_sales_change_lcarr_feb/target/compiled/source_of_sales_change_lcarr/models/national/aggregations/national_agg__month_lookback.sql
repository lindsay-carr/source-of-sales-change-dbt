with add_month_lookback as (
  select quarter,region_name,service_team_name,dma_name,location_num,
  monthend_date,'1 month' as look_back_period,
  location_type_code,daypart,destination_desc,sales_sub_total,
  transactions,purchaser_visits,credit_txn,
  total_items_promo_count,total_items_sold_count
  from "cfa"."public"."lcarr_sosx_national_agg__all_groupings"
)
select * from add_month_lookback