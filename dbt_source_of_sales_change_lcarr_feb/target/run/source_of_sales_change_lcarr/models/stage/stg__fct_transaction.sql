

  create view "cfa"."public"."stg__fct_transaction__dbt_tmp" as (
    





with transaction as 
( 
    select business_date,location_num,trans_id,end_time,end_hour_min,
    date_part(qtr,end_time)||' '||date_part(year,end_time) as quarter,
    cast(last_day(end_time) as date) as monthend_date,
    destination_code,destination_desc,cfa_one_id,customer_hash,
    sales_sub_total,tax_amount,delivery_tip
    from "cfa"."pos"."trans_header"
    where cancelled_flg = 'false'
    and business_date between '2022-02-01' and '2022-02-28')

select *
from transaction
  ) with no schema binding;
