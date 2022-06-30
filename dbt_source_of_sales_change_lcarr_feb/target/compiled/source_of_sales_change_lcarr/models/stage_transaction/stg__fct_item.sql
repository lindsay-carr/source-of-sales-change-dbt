

with trans_status as ( 
    select status, cancelled_flg
    from "cfa"."public"."lcarr_sosx_stg__dim_transaction_status"
), item as (
    select business_date, location_num, trans_id,
    item_pin as pin, item_sold_count, item_promo_count
    from "cfa"."pos"."trans_item"
    inner join trans_status using (status)
    where trans_status.cancelled_flg is false
    and (business_date between '2022-02-01' and '2022-02-28'
    or business_date between '2021-02-01' and '2021-02-28'))

select *
from item