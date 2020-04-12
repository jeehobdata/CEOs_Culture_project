CREATE DEFINER=`root`@`localhost` PROCEDURE `ceo_procedure`()
BEGIN
SET foreign_key_checks = 0;
TRUNCATE TABLE  ceo_culture_dwh.ceo;

insert into ceo_culture_dwh.ceo 
	(
	 ceo,
     company_rank,
	 BoY,
     born
     
	)
select
	
    a.CEO_ as ceo,
    a.company_rank as company_rank,
	a.BoY as BoY,
    a.Born as born
			
from (
		select distinct f.CEO_, f.Born, f.BoY, f.company_rank   
		from 
			(select CEO as CEO_, Born, BoY, company_rank
				from ceo_culture_stg.ceo_bio 
			) f
	  ) a

left join ceo_culture_dwh.ceo ceo 
		on a.CEO_ = ceo.ceo AND a.Born = ceo.born
        AND a.BoY = ceo.BoY AND a.company_rank = ceo.company_rank
;

SET foreign_key_checks = 1;
END