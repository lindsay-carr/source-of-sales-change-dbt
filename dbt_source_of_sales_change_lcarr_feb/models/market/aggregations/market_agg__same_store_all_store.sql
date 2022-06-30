with transaction_same_store as (
  select a.*,b.same_store_eligible,b.actual_days,b.avail_days
  from {{ref('market_agg__month_lookback')}} a
  left join {{ref('stg__fct_same_store')}} b
  on a.location_num = b.location_num
  and a.look_back_period = b.look_back_period
  and a.monthend_date = b.monthend_date
  order by dma_name,location_num,look_back_period,location_type_code,daypart,destination_desc,monthend_date
), transaction_agg_all_stores as ( 
  select quarter,
  monthend_date,look_back_period,'All Stores' as same_store,dma_name,
  location_type_code,daypart,destination_desc,
  sum(sales_sub_total) as sales_sub_total,
  sum(transactions) as transactions,sum(purchaser_visits) as purchaser_visits,
  sum(credit_txn) as credit_txn,sum(total_items_promo_count) as total_items_promo_count,
  sum(total_items_sold_count) as total_items_sold_count,
  sum(actual_days) as actual_days, 
  sum(avail_days) as avail_days
  from transaction_same_store
  group by 1,2,3,4,5,6,7,8
), transaction_agg_same_stores as ( 
  select quarter,
  monthend_date,look_back_period,'Same Stores' as same_store,dma_name,
  location_type_code,daypart,destination_desc,
  sum(sales_sub_total) as sales_sub_total,
  sum(transactions) as transactions,sum(purchaser_visits) as purchaser_visits,
  sum(credit_txn) as credit_txn,sum(total_items_promo_count) as total_items_promo_count,
  sum(total_items_sold_count) as total_items_sold_count,
  sum(actual_days) as actual_days,
  sum(avail_days) as avail_days
  from transaction_same_store
  where same_store_eligible = 1 
  group by 1,2,3,4,5,6,7,8
), union_all_same_market_transactions as ( 
  select * from transaction_agg_all_stores
  union
  select * from transaction_agg_same_stores
)
select * from union_all_same_market_transactions