

  create view "cfa"."public"."final_output_all__dbt_tmp" as (
    with final_output_all as ( 
    select * 
    from "cfa"."public"."lcarr_sosx_national__final_output"
    union 
    select * 
    from "cfa"."public"."lcarr_sosx_region__final_output"
    union 
    select * 
    from "cfa"."public"."lcarr_sosx_ast__final_output"
    union
    select * 
    from "cfa"."public"."lcarr_sosx_market__final_output"
) 

select * from final_output_all
  ) with no schema binding;
