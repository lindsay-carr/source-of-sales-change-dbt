{%- set grouping_statements = ["location_type_code,daypart,destination_desc",
    "location_type_code,'All' as daypart,destination_desc",
    "location_type_code,'All' as daypart,'All' as destination_desc",
    "location_type_code,daypart,'All' as destination_desc",
    "'All' as location_type_code,daypart,'All' as destination_desc",
    "'All' as location_type_code,daypart,destination_desc",
    "'All' as location_type_code,'All' as daypart,destination_desc",
    "'All' as location_type_code,'All' as daypart,'All' as destination_desc"] -%}

with aggregations_all_groupings as (
    {%- for grouping_statement in grouping_statements %}
    select quarter,monthend_date,
    location_num,dma_name,region_name,service_team_name,
    {{grouping_statement}},
    sum(sales_sub_total) as sales_sub_total,
    count(distinct trans_id) as transactions,
    sum(visit_count) as purchaser_visits,
    sum(credit_flag) as credit_txn,
    sum(total_items_promo_count) as total_items_promo_count,
    sum(total_items_sold_count) as total_items_sold_count
    from {{ref('trans_item')}}
    group by 1,2,3,4,5,6,7,8,9
    {%- if not loop.last %}
    union{% endif -%}
    {% endfor %}
) 
select * from aggregations_all_groupings 