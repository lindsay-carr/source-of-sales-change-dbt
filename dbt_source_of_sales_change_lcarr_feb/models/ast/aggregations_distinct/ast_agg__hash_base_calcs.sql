{%- set grouping_statements = ["location_type_code,daypart,destination_desc",
    "location_type_code,'All' as daypart,destination_desc",
    "location_type_code,'All' as daypart,'All' as destination_desc",
    "location_type_code,daypart,'All' as destination_desc",
    "'All' as location_type_code,daypart,'All' as destination_desc",
    "'All' as location_type_code,daypart,destination_desc",
    "'All' as location_type_code,'All' as daypart,destination_desc",
    "'All' as location_type_code,'All' as daypart,'All' as destination_desc"] -%}

with hash_base_calcs_all_store as (
    {%- for grouping_statement in grouping_statements %}
    select monthend_date,look_back_period,'All Stores' as same_store,service_team_name,
    {{grouping_statement}},
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from {{ref('ast_agg__month_lookback_distinct')}}
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    group by 1,2,3,4,5,6,7
    {%- if not loop.last %}
    union{% endif -%}
    {% endfor %}
), hash_base_calcs_same_store as ( 
    {%- for grouping_statement in grouping_statements %}
    select monthend_date,look_back_period,'Same Stores' as same_store,service_team_name,
    {{grouping_statement}},
    count(distinct cfa_one_id) as unique_cfa_one_ids, 
    count(distinct customer_hash) as cfa_one_hash_count
    from {{ref('ast_agg__month_lookback_distinct')}}
    where cfa_one_id is not null 
    and cfa_one_id <> ''
    and cfa_one_id <> ' '
    and customer_hash is not null
    and customer_hash <> ''
    and customer_hash <> ' '
    and same_store_eligible = 1
    group by 1,2,3,4,5,6,7
    {%- if not loop.last %}
    union{% endif -%}
    {% endfor %}
)

select * from hash_base_calcs_all_store 
union 
select * from hash_base_calcs_same_store