with dim_destination as
(select destination_code, destination_desc, dest_alias
 from "cfa"."common"."d_destination"
 ),

 refund_empty as 
 (select 'REFUND TRANS' as destination_code, '' as destination_desc, 
          'Refund' as dest_alias
 ),

 destination as
 (select destination_code, destination_desc, dest_alias from dim_destination
  union all
  select destination_code, destination_desc, dest_alias from refund_empty
)

select *
from destination