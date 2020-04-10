CREATE DEFINER=`root`@`localhost` PROCEDURE `industry_procedure`()
BEGIN
TRUNCATE TABLE  ceo_culture_dwh.industry;

insert into ceo_culture_dwh.industry 
	(
	 industry
	)
select
	
    a.industry_ as industry    
			
from 
		(select distinct Industry as industry_
		from ceo_culture_stg.fg500_ceo) a

left join ceo_culture_dwh.industry b 
		on a.industry_ = b.industry           

;
END