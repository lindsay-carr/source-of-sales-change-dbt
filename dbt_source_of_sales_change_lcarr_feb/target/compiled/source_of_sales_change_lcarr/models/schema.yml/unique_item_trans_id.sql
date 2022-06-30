
    
    

select
    trans_id as unique_field,
    count(*) as n_records

from "cfa"."public"."lcarr_sosx_item"
where trans_id is not null
group by trans_id
having count(*) > 1


