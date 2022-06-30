with location as (
    select location_num, service_team_name,
        case when location_type_code in ('FSU','MALL','DTO') 
             then location_type_code 
        else 'SAT' end as location_type_code,
        region_name, dma_name 
    from "cfa"."public"."location_attributes"
    where concept_code = 'CFA'
)

select *
from location