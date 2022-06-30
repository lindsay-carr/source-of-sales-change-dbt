with final_output_all as ( 
    select * 
    from {{ref('national__final_output')}}
    union 
    select * 
    from {{ref('region__final_output')}}
    union 
    select * 
    from {{ref('ast__final_output')}}
    union
    select * 
    from {{ref('market__final_output')}}
) 

select * from final_output_all