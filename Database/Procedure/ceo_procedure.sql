CREATE DEFINER=`root`@`localhost` PROCEDURE `ceo_procedure`()
BEGIN
TRUNCATE TABLE  ceo_culture_dwh.ceo;

insert into ceo_culture_dwh.ceo 
	(
	 ceo, 
	 born, 
	 nationality,
	 BoY,
	 company
	)
select
	
    a.CEO_ as ceo,
	a.company as company,
	a.Born as born,
	a.Nationality as nationality,
	a.BoY as BoY            
			
from (
		select distinct CEO_, company, Born, Nationality, BoY   
		from 
			(select id, CEO as CEO_, company
			from ceo_culture_stg.fg500_ceo) fc
				left join ceo_culture_stg.ceo_bio cb
				on fc.id = cb.`index`
			order by fc.id
	  ) a

left join ceo_culture_dwh.ceo ceo 
		on a.CEO_ = ceo.ceo
			AND a.company = ceo.company AND a.Born = ceo.born
            AND a.Nationality = ceo.nationality AND a.BoY = ceo.BoY

;

END