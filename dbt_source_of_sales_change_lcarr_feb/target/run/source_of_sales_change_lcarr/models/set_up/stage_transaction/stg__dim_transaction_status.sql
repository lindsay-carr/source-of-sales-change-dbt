

  create view "cfa"."public"."stg__dim_transaction_status__dbt_tmp" as (
    with trans_status as ( 
    select trans_status_id as status, cancelled_flg
    from "cfa"."pos"."transaction_status"
)

select * 
from trans_status
  ) with no schema binding;
