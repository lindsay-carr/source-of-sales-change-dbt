{% set locations = var('locations') %}

with trans_status as ( 
    select status, cancelled_flg
    from {{ref('stg__dim_transaction_status')}}
), tender as (
    select business_date,location_num,trans_id,
        destination_code,destination_desc,tender_type,tender_description
    from {{source('pos','trans_tender')}}
    inner join trans_status using (status)
    where trans_status.cancelled_flg is false
    and (business_date between '{{var('date_1_start')}}' and '{{var('date_1_end')}}'
    or business_date between '{{var('date_2_start')}}' and '{{var('date_2_end')}}')
    {%- if locations|length > 0 %}
    and location_num in {{var('locations')}}
    {%- endif -%}
)

select *
from tender 