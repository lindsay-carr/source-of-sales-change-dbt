

  create  table
    "cfa"."public"."region_agg__distinct_join__dbt_tmp"
    
    
    
  as (
    with distinct_calcs_join as (
    select a.monthend_date,a.look_back_period,a.same_store,a.region_name,
    a.location_type_code,a.daypart,a.destination_desc,
    a.unique_cfa_one_ids,a.unique_hashes,a.hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from "cfa"."public"."lcarr_sosx_region_agg__distinct_calcs" a
    inner join "cfa"."public"."lcarr_sosx_region_agg__hash_base_calcs" b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period
    and a.same_store = b.same_store
    and a.region_name = b.region_name 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
) 
select * from distinct_calcs_join
  );