CREATE DEFINER=`root`@`localhost` PROCEDURE `education_procedure`()
BEGIN
SET foreign_key_checks = 0;

TRUNCATE TABLE  ceo_culture_dwh.education;

insert into ceo_culture_dwh.education
	(
	 education,
     ceo_id
	)
select
	
    Education_ as education,            
	ceo_id_ as ceo_id		
from (
select	Education as Education_, id as ceo_id_
from ceo_culture_stg.ceo_bio) a

left join ceo_culture_dwh.education b 
		on a.Education_ = b.education AND a.ceo_id_ = b.ceo_id
;
SET foreign_key_checks = 1;

END