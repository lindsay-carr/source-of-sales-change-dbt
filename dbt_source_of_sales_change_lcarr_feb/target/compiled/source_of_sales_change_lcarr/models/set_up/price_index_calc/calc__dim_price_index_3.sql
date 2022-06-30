with min_monthend_date as ( 
    select look_back_period,same_store,min(monthend_date) as min_monthend_date
    from "cfa"."public"."lcarr_sosx_calc__dim_price_index_2"
    group by 1,2
), anchor_calc as ( 
    select m.look_back_period,m.same_store,m.min_monthend_date,bc.pg1_ratio as anchor_ratio
    from min_monthend_date m
    inner join "cfa"."public"."lcarr_sosx_calc__dim_price_index_2" bc 
    on m.look_back_period = bc.look_back_period
    and m.same_store = bc.same_store
    and m.min_monthend_date = bc.monthend_date
), market_big_join as (
    select bc.*, ac.min_monthend_date, ac.anchor_ratio
    from "cfa"."public"."lcarr_sosx_calc__dim_price_index_2" bc 
    inner join anchor_calc ac
    on bc.look_back_period = ac.look_back_period
    and bc.same_store = ac.same_store
), ratio_change as ( 
    select *, pg1_ratio/anchor_ratio as pg1_ratio_change
    from market_big_join
), price_index_final as ( 
    select look_back_period,monthend_date,same_store,actual_vs_pg1*pg1_ratio_change as price_index
    from ratio_change
)
select * from price_index_final