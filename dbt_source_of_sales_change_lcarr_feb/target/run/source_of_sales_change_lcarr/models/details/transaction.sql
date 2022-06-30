

  create  table
    "cfa"."public"."transaction__dbt_tmp"
    
    
    
  as (
    with fct_transaction as ( 
    select business_date, location_num, trans_id,
    monthend_date, quarter, 
    destination_code, destination_desc, 
    tax_amount, delivery_tip, sales_sub_total,
    cfa_one_id, customer_hash
    from "cfa"."public"."lcarr_sosx_stg__fct_transaction"
), location as ( 
    select location_num, service_team_name, location_type_code,
        region_name, dma_name 
    from "cfa"."public"."lcarr_sosx_stg__dim_location"
), transaction as ( 
    select business_date, location_num, trans_id,
        monthend_date, quarter,
        destination_code, destination_desc,
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
)

select *
from transaction
  );