CREATE DEFINER=`root`@`localhost` PROCEDURE `education_procedure`()
BEGIN
TRUNCATE TABLE  ceo_culture_dwh.education;

insert into ceo_culture_dwh.education
	(
	 education
	)
select
	
    Education_ as education            
			
from (
select	Education as Education_
from ceo_culture_stg.ceo_bio) a

left join ceo_culture_dwh.education b 
		on a.Education_ = b.education
;
END