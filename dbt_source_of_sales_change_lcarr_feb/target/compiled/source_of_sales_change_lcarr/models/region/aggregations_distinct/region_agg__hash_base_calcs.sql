with hash_base_calcs_all_store as (
    select monthend_date,look_back_period,'All Stores' as same_store,region_name,
    location_type_code,daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,region_name,
    location_type_code,'All' as daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,region_name,
    location_type_code,'All' as daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,region_name,
    location_type_code,daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,region_name,
    'All' as location_type_code,daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,region_name,
    'All' as location_type_code,daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,region_name,
    'All' as location_type_code,'All' as daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'All Stores' as same_store,region_name,
    'All' as location_type_code,'All' as daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    group by 1,2,3,4,5,6,7
), hash_base_calcs_same_store as (
    select monthend_date,look_back_period,'Same Stores' as same_store,region_name,
    location_type_code,daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    and same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,region_name,
    location_type_code,'All' as daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    and same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,region_name,
    location_type_code,'All' as daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    and same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,region_name,
    location_type_code,daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    and same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,region_name,
    'All' as location_type_code,daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    and same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,region_name,
    'All' as location_type_code,daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    and same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,region_name,
    'All' as location_type_code,'All' as daypart,destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    and same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    union
    select monthend_date,look_back_period,'Same Stores' as same_store,region_name,
    'All' as location_type_code,'All' as daypart,'All' as destination_desc,
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from "cfa"."public"."lcarr_sosx_region_agg__month_lookback_distinct"
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    and same_store_eligible = 1
    group by 1,2,3,4,5,6,7
)

select * from hash_base_calcs_all_store 
union 
select * from hash_base_calcs_same_store