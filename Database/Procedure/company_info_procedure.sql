CREATE DEFINER=`root`@`localhost` PROCEDURE `company_info_procedure`()
BEGIN
SET foreign_key_checks = 0;
TRUNCATE TABLE  ceo_culture_dwh.company_info;

insert into ceo_culture_dwh.company_info 
	(
	 `rank`, 
	 `employees`,
     `sector`,
     `industry`,
	 `change in rank 500`,
     `HQ Location`,
     `Website`,
     `Years on Global 500 List`
	)
select
	
    a.`rank` as `rank`,
	a.employees as `employees`,
    a.`sector` as `sector`,
    a.`industry` as `industry`,
	a.`change in rank 500` as `change in rank 500`,
    a.`HQ Location` as `HQ Location`,
    a.`Website` as `Website`, 
    a.`Years on Global 500 List` as `Years on Global 500 List`
    			
from (
		select distinct `rank`, employees, `change in rank 500`, `sector`, `industry`,
				`HQ Location`, `Website`, `Years on Global 500 List`
		from 
			(select id, `rank`, employees, `change in rank 500`
			from ceo_culture_stg.fg500_company) fcy
				left join (select id, `HQ Location`, `Website`, `Years on Global 500 List`, `Sector`, `Industry`
					from ceo_culture_stg.fg500_ceo) fgc
					on fcy.`rank` = fgc.id
			
	  ) a

left join ceo_culture_dwh.company_info info 
		on a.`Rank` = info.`Rank`
		AND a.employees = info.employees AND a.`change in rank 500` = info.`change in rank 500`
		AND a.`HQ Location` = info.`HQ Location`AND a.`Website` = info.`Website` 
        AND a.`Years on Global 500 List` = info.`Years on Global 500 List`
        AND a.`sector` = info.`sector` AND a.`industry` = info.`industry`
            
;

SET foreign_key_checks = 1;

END