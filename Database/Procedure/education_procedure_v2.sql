CREATE DEFINER=`root`@`localhost` PROCEDURE `education_procedure`()
BEGIN
SET foreign_key_checks = 0;

TRUNCATE TABLE  ceo_culture_dwh_2.education;

insert into ceo_culture_dwh_2.education
	(
	 education,
     ceo_id
	)
select
	
    a.Education_ as education,            
	a.ceo_id_ as ceo_id
from (
select	Education as Education_, id as ceo_id_
from ceo_culture_stg.ceo_bio_2019
union
select	Education as Education_, id as ceo_id_
from ceo_culture_stg.ceo_bio_2018
union
select	Education as Education_, id as ceo_id_
from ceo_culture_stg.ceo_bio_2017
union
select	Education as Education_, id as ceo_id_
from ceo_culture_stg.ceo_bio_2016) a

left join ceo_culture_dwh_2.education b 
		on a.Education_ = b.education AND a.ceo_id_ = b.ceo_id
;
SET foreign_key_checks = 1;

END