with dim_item as
(select pin, hierarchy_1, short_name
 from {{source('apps', 'dim_item')}})

select *
from dim_item