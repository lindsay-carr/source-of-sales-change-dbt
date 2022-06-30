{%- set grouping_statements = ["location_type_code,daypart,destination_desc",
    "location_type_code,'All' as daypart,destination_desc",
    "location_type_code,'All' as daypart,'All' as destination_desc",
    "location_type_code,daypart,'All' as destination_desc",
    "'All' as location_type_code,daypart,'All' as destination_desc",
    "'All' as location_type_code,daypart,destination_desc",
    "'All' as location_type_code,'All' as daypart,destination_desc",
    "'All' as location_type_code,'All' as daypart,'All' as destination_desc"] -%}

with distinct_calcs_all_store as (
    {%- for grouping_statement in grouping_statements %}
    select monthend_date,look_back_period,'All Stores' as same_store,
    {{grouping_statement}},
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from {{ref('national_agg__month_lookback_distinct')}}
    group by 1,2,3,4,5,6
    {%- if not loop.last %}
    union{% endif -%}
    {% endfor %}
), distinct_calcs_same_store as ( 
    {%- for grouping_statement in grouping_statements %}
    select monthend_date,look_back_period,'Same Stores' as same_store,
    {{grouping_statement}},
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as unique_hashes,
    count(customer_hash) as hash_transactions
    from {{ref('national_agg__month_lookback_distinct')}}
    where same_store_eligible = 1
    group by 1,2,3,4,5,6
    {%- if not loop.last %}
    union{% endif -%}
    {% endfor %}
)

select * from distinct_calcs_all_store 
union 
select * from distinct_calcs_same_store