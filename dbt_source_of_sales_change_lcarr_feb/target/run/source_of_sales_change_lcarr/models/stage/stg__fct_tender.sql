

  create view "cfa"."public"."stg__fct_tender__dbt_tmp" as (
    

with trans_status as ( 
    select status, cancelled_flg
    from "cfa"."public"."lcarr_sosx_stg__dim_transaction_status"
), tender as (
    select business_date,location_num,trans_id,
        destination_code,destination_desc,tender_type,tender_description
    from "cfa"."pos"."trans_tender"
    inner join trans_status using (status)
    where trans_status.cancelled_flg is false
    and business_date between '2022-02-01' and '2022-02-28')

select *
from tender
  ) with no schema binding;
