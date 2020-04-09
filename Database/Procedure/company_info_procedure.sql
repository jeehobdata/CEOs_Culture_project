CREATE DEFINER=`root`@`localhost` PROCEDURE `company_info_procedure`()
BEGIN
TRUNCATE TABLE  ceo_culture_dwh.company_info;

insert into ceo_culture_dwh.company_info 
	(
	 `rank`, 
	 company, 
	 ceo,
	 employees,
	 `change in rank 500`,
     `country/territory`,
     Sector,
     Industry,
     `HQ Location`,
     `Website`,
     `Years on Global 500 List`
	)
select
	
    a.`rank` as `rank`,
	a.company_ as company,
	a.CEO_ as ceo,
	a.employees as employees,
	a.`change in rank 500` as `change in rank 500`,
    a.`country/territory` as `country/territory`,
    a.Sector as Sector,
    a.Industry as Industry,
    a.`HQ Location` as `HQ Location`,
    a.`Website` as `Website`, 
    a.`Years on Global 500 List` as `Years on Global 500 List`
    
			
from (
		select distinct CEO_, company_, `rank`, employees, `change in rank 500`, 
				`country/territory`, Sector, Industry, `HQ Location`, `Website`, `Years on Global 500 List`
		from 
			(select id, company as company_, `rank`, employees, `change in rank 500`, `country/territory`
			from ceo_culture_stg.fg500_company) fcy
				left join (select id, CEO as CEO_, Sector, Industry, `HQ Location`, `Website`, `Years on Global 500 List`
					from ceo_culture_stg.fg500_ceo) fgc
					on fcy.id = fgc.id
			
	  ) a

left join ceo_culture_dwh.company_info info 
		on a.CEO_ = info.ceo
			AND a.company_ = info.company AND a.`Rank` = info.`Rank`
            AND a.employees = info.employees AND a.`change in rank 500` = info.`change in rank 500`
            AND a.`country/territory` = info.`country/territory` AND a.Sector = info.Sector
            AND a.Industry = info.Industry AND a.`HQ Location` = info.`HQ Location`  
            AND a.`Website` = info.`Website` AND a.`Years on Global 500 List` = info.`Years on Global 500 List`
            

;

END