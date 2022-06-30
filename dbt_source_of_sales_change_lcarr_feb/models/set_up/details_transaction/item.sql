with fct_item as ( 
    select business_date, location_num, trans_id, pin,
    item_sold_count, item_promo_count
    from {{ ref('stg__fct_item')}}
), location as ( 
    select location_num, service_team_name, location_type_code,
    region_name, dma_name 
    from {{ ref('stg__dim_location')}}
), dim_item as ( 
    select pin, hierarchy_1
    from {{ ref('stg__dim_item')}}
), item as ( 
    select business_date, location_num, trans_id,
        sum(item_sold_count) as total_items_sold_count,
        sum(item_promo_count) as total_items_promo_count
    from fct_item
    inner join dim_item using (pin)
    inner join location using (location_num)
    where hierarchy_1 <> ''
        and hierarchy_1 <> ' '
        and hierarchy_1 is not null
        and hierarchy_1 not in ('Non-Food','Miscellaneous') 
    group by 1, 2, 3
)

select *
from item