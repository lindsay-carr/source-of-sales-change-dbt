

  create view "cfa"."public"."stg__dim_location__dbt_tmp" as (
    with location as (
    select location_num, service_team_name, location_type_code,
        region_name, dma_name 
    from "cfa"."public"."location_attributes"
    where concept_code = 'CFA'
)

select *
from location
  ) with no schema binding;
