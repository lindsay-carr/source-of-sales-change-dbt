with trans_detail as
(select business_date, location_num, trans_id, 
        sales_sub_total, cfa_one_id, customer_hash, 
        visit_count, credit_flag, quarter, destination_desc, daypart, 
        monthend_date, region_name, dma_name, location_type_code, service_team_name
 from "cfa"."public"."lcarr_sosx_trans_detail"
),

item as
(select business_date, location_num, trans_id, 
        total_items_sold_count, total_items_promo_count
 from "cfa"."public"."lcarr_sosx_item"
),

trans_item as
(select business_date, location_num, trans_id, 
        sales_sub_total, cfa_one_id, customer_hash, 
        visit_count, credit_flag, quarter, destination_desc, daypart, 
        monthend_date, region_name, dma_name, location_type_code, service_team_name,
        nvl(total_items_sold_count, 0) as total_items_sold_count, 
        nvl(total_items_promo_count, 0) as total_items_promo_count
 from trans_detail
 inner join item using (business_date, location_num, trans_id)
)

select *
from trans_item