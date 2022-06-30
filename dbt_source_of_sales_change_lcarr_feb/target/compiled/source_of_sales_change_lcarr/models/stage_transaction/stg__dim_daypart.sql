with dim_time as
(select hour_min as end_hour_min, daypart
 from "cfa"."apps"."time_d"
)

select *
from dim_time