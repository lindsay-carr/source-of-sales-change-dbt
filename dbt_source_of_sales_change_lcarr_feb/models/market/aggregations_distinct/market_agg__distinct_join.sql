with distinct_calcs_join as (
    select a.monthend_date,a.look_back_period,a.same_store,a.dma_name,
    a.location_type_code,a.daypart,a.destination_desc,
    a.unique_cfa_one_ids,a.unique_hashes,a.hash_transactions,
    cast(b.cfa_one_hash_count as decimal)/b.unique_cfa_one_ids as hash_per_customer
    from {{ref('market_agg__distinct_calcs')}} a
    inner join {{ref('market_agg__hash_base_calcs')}} b 
    on a.monthend_date = b.monthend_date
    and a.look_back_period = b.look_back_period
    and a.same_store = b.same_store
    and a.dma_name = b.dma_name 
    and a.location_type_code = b.location_type_code 
    and a.daypart = b.daypart
    and a.destination_desc = b.destination_desc
) 
select * from distinct_calcs_join