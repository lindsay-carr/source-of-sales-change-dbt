with trans_status as ( 
    select trans_status_id as status, cancelled_flg
    from "cfa"."pos"."transaction_status"
)

select * 
from trans_status