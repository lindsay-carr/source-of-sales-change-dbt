with fct_tender as ( 
    select business_date, location_num, trans_id,
    tender_description, destination_desc
    from {{ ref('stg__fct_tender')}}
), location as ( 
    select location_num, service_team_name, location_type_code,
    region_name, dma_name 
    from {{ ref('stg__dim_location')}}
), tender as ( 
    select business_date, location_num, trans_id, 
       -- destination_desc, tender_description, tender_type, 
       max(case when tender_description = 'Credit' then 1
            when tender_description in ('Exact Dollar', 'On Demand', 'CFA Card', '$20', 'Cash', 'Next Dollar', '$10') then 0
	        when tender_description not like '%Credit%'
	             or destination_desc='' or destination_desc=' ' or destination_desc is null
	             or destination_desc='Other' then 0
	   else 1 end) as credit_flag
 from fct_tender
 inner join location using (location_num) 
 group by 1, 2, 3
)

select *
from tender