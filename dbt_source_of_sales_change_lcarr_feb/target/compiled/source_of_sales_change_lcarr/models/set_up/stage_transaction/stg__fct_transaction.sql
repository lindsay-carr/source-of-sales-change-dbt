





with transaction as 
( 
    select business_date,location_num,trans_id,end_time,end_hour_min,
    date_part(qtr,business_date)||' '||date_part(year,business_date) as quarter,
    cast(last_day(business_date) as date) as monthend_date,
    destination_code,destination_desc,cfa_one_id,customer_hash,
    sales_sub_total,tax_amount,delivery_tip
    from "cfa"."pos"."trans_header"
    where cancelled_flg = 'false'
    and (business_date between '2022-02-01' and '2022-02-28'
    or business_date between '2021-02-01' and '2021-02-28'))

select *
from transaction