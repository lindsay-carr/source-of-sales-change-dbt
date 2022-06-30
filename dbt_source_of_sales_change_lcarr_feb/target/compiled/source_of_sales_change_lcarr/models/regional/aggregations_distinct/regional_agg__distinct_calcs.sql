with distinct_calcs_all_store as (
    select a.monthend_date,a.look_back_period,'All Stores' as same_store,
    a.location_type_code,a.daypart,a.destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where b.same_store = 'All Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'All Stores' as same_store,
    a.location_type_code,'All' as daypart,a.destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where b.same_store = 'All Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'All Stores' as same_store,
    a.location_type_code,'All' as daypart,'All' as destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where b.same_store = 'All Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'All Stores' as same_store,
    a.location_type_code,a.daypart,'All' as destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where b.same_store = 'All Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'All Stores' as same_store,
    'All' as location_type_code,a.daypart,'All' as destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where b.same_store = 'All Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'All Stores' as same_store,
    'All' as location_type_code,a.daypart,a.destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where b.same_store = 'All Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'All Stores' as same_store,
    'All' as location_type_code,'All' as daypart,a.destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where b.same_store = 'All Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'All Stores' as same_store,
    'All' as location_type_code,'All' as daypart,'All' as destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where b.same_store = 'All Stores'
    group by 1,2,3,4,5,6,10
), distinct_calcs_same_store as (
    select a.monthend_date,a.look_back_period,'Same Stores' as same_store,
    a.location_type_code,a.daypart,a.destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where a.same_store_eligible = 1
    and b.same_store = 'Same Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'Same Stores' as same_store,
    a.location_type_code,'All' as daypart,a.destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where a.same_store_eligible = 1
    and b.same_store = 'Same Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'Same Stores' as same_store,
    a.location_type_code,'All' as daypart,'All' as destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where a.same_store_eligible = 1
    and b.same_store = 'Same Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'Same Stores' as same_store,
    a.location_type_code,a.daypart,'All' as destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where a.same_store_eligible = 1
    and b.same_store = 'Same Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'Same Stores' as same_store,
    'All' as location_type_code,a.daypart,'All' as destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where a.same_store_eligible = 1
    and b.same_store = 'Same Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'Same Stores' as same_store,
    'All' as location_type_code,a.daypart,a.destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where a.same_store_eligible = 1
    and b.same_store = 'Same Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'Same Stores' as same_store,
    'All' as location_type_code,'All' as daypart,a.destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where a.same_store_eligible = 1
    and b.same_store = 'Same Stores'
    group by 1,2,3,4,5,6,10
    union
    select a.monthend_date,a.look_back_period,'Same Stores' as same_store,
    'All' as location_type_code,'All' as daypart,'All' as destination_desc,
    count(distinct a.cfa_one_id) as unique_cfa_one_ids, 
    count(distinct a.customer_hash) as unique_hashes,
    count(a.customer_hash) as hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_regional_agg__month_lookback_distinct" a
    inner join "cfa"."public"."lcarr_sosx_regional_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
    where a.same_store_eligible = 1
    and b.same_store = 'Same Stores'
    group by 1,2,3,4,5,6,10
)

select * from distinct_calcs_all_store 
union 
select * from distinct_calcs_same_store