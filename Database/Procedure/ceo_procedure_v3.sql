CREATE DEFINER=`root`@`localhost` PROCEDURE `ceo_procedure`()
BEGIN
SET foreign_key_checks = 0;
TRUNCATE TABLE  ceo_culture_dwh_2.ceo;

insert into ceo_culture_dwh_2.ceo 
	(
	 ceo,
     ceo_no,
     company_rank,
	 BoY,
     born,
     `year`
     
	)
select
	
    a.CEO_ as ceo,
    a.ceo_no_ as ceo_no,
    a.company_rank as company_rank,
	a.BoY as BoY,
    a.Born as born,
    a.`year` as `year`
			
from (
		select distinct f.CEO_, f.id as ceo_no_,  f.Born, f.BoY, f.company_rank, f.`year`   
		from 
			(select id, ceo as CEO_, Born, BoY, company_rank, `year`
				from ceo_culture_stg.ceo_bio_2019
           union 
           select id, ceo as CEO_, Born, BoY, company_rank, `year`
				from ceo_culture_stg.ceo_bio_2018
           union
           select id, ceo as CEO_, Born, BoY, company_rank, `year`
				from ceo_culture_stg.ceo_bio_2017
           union
           select id, ceo as CEO_, Born, BoY, company_rank, `year`
				from ceo_culture_stg.ceo_bio_2016
			) f
            order by ceo_
	  ) a

left join ceo_culture_dwh_2.ceo ceo 
		on a.CEO_ = ceo.ceo AND a.Born = ceo.born
        AND a.BoY = ceo.BoY AND a.company_rank = ceo.company_rank
        AND a.`year` = ceo.`year` AND a.ceo_no_ = ceo_no
;

SET foreign_key_checks = 1;
END