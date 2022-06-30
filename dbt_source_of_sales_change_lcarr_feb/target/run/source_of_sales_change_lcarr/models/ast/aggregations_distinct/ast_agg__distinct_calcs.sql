

  create  table
    "cfa"."public"."ast_agg__distinct_calcs__dbt_tmp"
    
    
    
  as (
    with distinct_calcs_all_store as (
    select monthend_date,look_back_period,'All Stores' as same_store,service_team_name,
    location_type_code,daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,service_team_name,
    location_type_code,'All' as daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,service_team_name,
    location_type_code,'All' as daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,service_team_name,
    location_type_code,daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,service_team_name,
    'All' as location_type_code,daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,service_team_name,
    'All' as location_type_code,daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,service_team_name,
    'All' as location_type_code,'All' as daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,service_team_name,
    'All' as location_type_code,'All' as daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    group by 1,2,3,4,5,6,7
), distinct_calcs_same_store as (
    select monthend_date,look_back_period,'Same Stores' as same_store,service_team_name,
    location_type_code,daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    where same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,service_team_name,
    location_type_code,'All' as daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    where same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,service_team_name,
    location_type_code,'All' as daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    where same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,service_team_name,
    location_type_code,daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    where same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,service_team_name,
    'All' as location_type_code,daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    where same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,service_team_name,
    'All' as location_type_code,daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    where same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,service_team_name,
    'All' as location_type_code,'All' as daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    where same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,service_team_name,
    'All' as location_type_code,'All' as daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from "cfa"."public"."lcarr_sosx_ast_agg__month_lookback_distinct"
    where same_store_eligible = 1
    group by 1,2,3,4,5,6,7
)

select * from distinct_calcs_all_store 
union 
select * from distinct_calcs_same_store
  );