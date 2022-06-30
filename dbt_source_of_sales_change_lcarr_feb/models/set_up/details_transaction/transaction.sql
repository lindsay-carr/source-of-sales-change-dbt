with fct_transaction as ( 
    select business_date, location_num, trans_id,
    monthend_date, quarter, end_hour_min,
    destination_code, destination_desc, 
    tax_amount, delivery_tip, sales_sub_total,
    cfa_one_id, customer_hash
    from {{ ref('stg__fct_transaction')}}
), location as ( 
    select location_num, service_team_name, location_type_code,
        region_name, dma_name 
    from {{ ref('stg__dim_location')}}
), daypart as ( 
    select end_hour_min,daypart
    from {{ref('stg__dim_daypart')}} 
), destination as ( 
    select destination_code, destination_desc, dest_alias
    from {{ref('stg__dim_destination')}}
), transaction as ( 
    select business_date, location_num, trans_id, daypart,
        monthend_date, quarter,
        destination_code, destination_desc, dest_alias,
        service_team_name, location_type_code, 
        region_name, dma_name,
        cfa_one_id, customer_hash,
        tax_amount, delivery_tip, 
        sales_sub_total,
        case when customer_hash <> '' and customer_hash <> ' ' 
             and  customer_hash is not null
        then 1 else 0 end as visit_count
    from fct_transaction
    inner join location using (location_num)
    inner join destination using (destination_code,destination_desc) 
    inner join daypart using (end_hour_min)
)

select *
from transaction