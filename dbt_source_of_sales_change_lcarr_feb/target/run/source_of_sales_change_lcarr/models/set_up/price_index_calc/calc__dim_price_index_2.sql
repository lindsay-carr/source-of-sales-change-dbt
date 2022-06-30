

  create view "cfa"."public"."calc__dim_price_index_2__dbt_tmp" as (
    with add_same_store_flag as ( 
  SELECT a.dma_name,
  a.location_num,
  a.monthend_date,
  a.look_back_period,
  a.month_sales,
  a.adjusted_sales,
  a.month_sales_pg1,
  a.adjusted_sales_pg1,
  b.same_store_eligible
  FROM "cfa"."public"."lcarr_sosx_calc__dim_price_index_1" a
  inner join "cfa"."public"."lcarr_sosx_stg__fct_same_store" b
  on a.location_num = b.location_num
  and a.monthend_date = b.monthend_date 
), market_aggregation_all_stores as ( 
  select monthend_date,look_back_period,'All Stores' as same_store,
  sum(month_sales) as market_month_sales,
  sum(adjusted_sales) as market_adjusted_sales,
  sum(month_sales_pg1) as market_month_sales_pg1,
  sum(adjusted_sales_pg1) as market_adjusted_sales_pg1
  from add_same_store_flag
  group by 1,2
), market_aggregation_same_stores as ( 
  select monthend_date,look_back_period,'Same Stores' as same_store,
  sum(month_sales) as market_month_sales,
  sum(adjusted_sales) as market_adjusted_sales,
  sum(month_sales_pg1) as market_month_sales_pg1,
  sum(adjusted_sales_pg1) as market_adjusted_sales_pg1
  from add_same_store_flag
  where same_store_eligible = 1
  group by 1,2
), union_all_same_store as ( 
  select monthend_date,look_back_period,same_store,
  market_month_sales,market_adjusted_sales,
  market_month_sales_pg1,market_adjusted_sales_pg1
  from market_aggregation_all_stores
  union
  select monthend_date,look_back_period,same_store,
  market_month_sales,market_adjusted_sales,
  market_month_sales_pg1,market_adjusted_sales_pg1
  from market_aggregation_same_stores
), base_calcs as (
  SELECT monthend_date,look_back_period,same_store,
  market_month_sales,market_adjusted_sales,market_month_sales_pg1,market_adjusted_sales_pg1,
  case when market_adjusted_sales_pg1 = 0.00 then 0.00 else 
  cast(market_month_sales_pg1/market_adjusted_sales_pg1 as float) end as pg1_ratio,
  case when market_month_sales_pg1 = 0.00 then 0.00 else
  cast(market_month_sales/market_month_sales_pg1 as float) end as actual_vs_pg1
  from union_all_same_store
)
select * from base_calcs
  ) with no schema binding;
