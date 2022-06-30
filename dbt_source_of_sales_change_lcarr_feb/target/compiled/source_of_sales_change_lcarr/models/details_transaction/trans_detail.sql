with transaction as
(select business_date, location_num, trans_id,
        tax_amount, delivery_tip, destination_desc, dest_alias, daypart,
        sales_sub_total, cfa_one_id, customer_hash, visit_count, quarter, 
        monthend_date, region_name, dma_name, location_type_code, service_team_name
 from "cfa"."public"."lcarr_sosx_transaction"
),

tender as
(select business_date, location_num, trans_id, 
        credit_flag
 from "cfa"."public"."lcarr_sosx_tender"
),

trans_detail as
(select business_date, location_num, trans_id, daypart,
        sales_sub_total, cfa_one_id, customer_hash, visit_count,
        destination_desc, dest_alias, credit_flag, quarter, 
        monthend_date, region_name, dma_name, location_type_code, service_team_name
 from transaction
 inner join tender using (business_date, location_num, trans_id)
)

select * 
from trans_detail