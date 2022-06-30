{{ log(var('date_1_start'), info=true) }}
{{ log(var('date_1_end'), info=true) }}
{{ log(var('locations'), info=true) }}

{% set locations = var('locations') %}

with transaction as 
( 
    select business_date,location_num,trans_id,end_time,end_hour_min,
    date_part(qtr,business_date)||' '||date_part(year,business_date) as quarter,
    cast(last_day(business_date) as date) as monthend_date,
    destination_code,destination_desc,cfa_one_id,customer_hash,
    sales_sub_total,tax_amount,delivery_tip
    from {{source('pos','trans_header')}}
    where cancelled_flg = 'false'
    and (business_date between '{{var('date_1_start')}}' and '{{var('date_1_end')}}'
    or business_date between '{{var('date_2_start')}}' and '{{var('date_2_end')}}')
    {%- if locations|length > 0 %}
    and location_num in {{var('locations')}}
    {%- endif -%}
)

select *
from transaction 
