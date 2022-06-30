

  create view "cfa"."public"."stg__dim_item__dbt_tmp" as (
    with dim_item as
(select pin, hierarchy_1, short_name
 from "cfa"."apps"."dim_item")

select *
from dim_item
  ) with no schema binding;
