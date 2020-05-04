CREATE DEFINER=`root`@`localhost` PROCEDURE `company_info_procedure`()
BEGIN
SET foreign_key_checks = 0;
TRUNCATE TABLE  ceo_culture_dwh_2.company_info;

insert into ceo_culture_dwh_2.company_info 
	(
	 `rank`, 
     `company`,
	 `employees`,
     `sector`,
     `industry`,
     `HQ Location`,
     `Website`,
     `Years on Global 500 List`,
     `year`
	)
select
	
    a.`rank` as `rank`,
    a.`company` as `company`,
	a.employees as `employees`,
    a.`sector` as `sector`,
    a.`industry` as `industry`,
    a.`HQ Location` as `HQ Location`,
    a.`Website` as `Website`, 
    a.`Years on Global 500 List` as `Years on Global 500 List`,
    a.`year` as `year`
    			
from (
		
		select a19.*
		from
			(select distinct `rank`, `company`, employees, `sector`, `industry`,
					`HQ Location`, `Website`, `Years on Global 500 List`, `year`
			from 
				(select id, `rank`, `company`, employees, `year`
				from ceo_culture_stg.fg500_company_2019) fcy19
					left join (select id, `HQ Location`, `Website`, `Years on Global 500 List`, `Sector`, `Industry`
						from ceo_culture_stg.fg500_ceo_2019) fgc19
					on fcy19.`rank` = fgc19.id
				)a19
				
		 Union
		 
		 select a18.*
		from
			(select distinct `rank`, `company`, employees, `sector`, `industry`,
					`HQ Location`, `Website`, `Years on Global 500 List`, `year`
			from 
				(select id, `rank`, `company`, employees, `year`
				from ceo_culture_stg.fg500_company_2018) fcy18
					left join (select id, `HQ Location`, `Website`, `Years on Global 500 List`, `Sector`, `Industry`
						from ceo_culture_stg.fg500_ceo_2018) fgc18
					on fcy18.`rank` = fgc18.id
				)a18
				
		 Union
		 
		 select a17.*
		from
			(select distinct `rank`, `company`, employees, `sector`, `industry`,
					`HQ Location`, `Website`, `Years on Global 500 List`, `year`
			from 
				(select id, `rank`, `company`, employees, `year`
				from ceo_culture_stg.fg500_company_2017) fcy17
					left join (select id, `HQ Location`, `Website`, `Years on Global 500 List`, `Sector`, `Industry`
						from ceo_culture_stg.fg500_ceo_2017) fgc17
					on fcy17.`rank` = fgc17.id
				)a17
				
		 Union
		 
		 select a16.*
		from
			(select distinct `rank`, `company`, employees, `sector`, `industry`,
					`HQ Location`, `Website`, `Years on Global 500 List`, `year`
			from 
				(select id, `rank`, `company`, employees, `year`
				from ceo_culture_stg.fg500_company_2016) fcy16
					left join (select id, `HQ Location`, `Website`, `Years on Global 500 List`, `Sector`, `Industry`
						from ceo_culture_stg.fg500_ceo_2016) fgc16
					on fcy16.`rank` = fgc16.id
				)a16
            
	  ) a

left join ceo_culture_dwh_2.company_info info 
		on a.`Rank` = info.`Rank`
		AND a.employees = info.employees 
		AND a.`HQ Location` = info.`HQ Location`AND a.`Website` = info.`Website` 
        AND a.`Years on Global 500 List` = info.`Years on Global 500 List`
        AND a.`sector` = info.`sector` AND a.`industry` = info.`industry`
        AND a.`company` = info.`company` AND a.`year`= info.`year`
;            

SET foreign_key_checks = 1;

END