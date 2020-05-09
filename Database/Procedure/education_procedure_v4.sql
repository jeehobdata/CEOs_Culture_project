CREATE DEFINER=`root`@`localhost` PROCEDURE `education_procedure`()
BEGIN
SET foreign_key_checks = 0;

TRUNCATE TABLE  ceo_culture_dwh_2.education;

insert into ceo_culture_dwh_2.education
	(
	 education,
     ceo_id,
     `year`
	)
select
	
    a.Education_ as education,            
	a.ceo_id_ as ceo_id,
    a.year_ as `year`
from (
select	Education as Education_, id as ceo_id_, `year` as year_ 
from ceo_culture_stg.ceo_bio_2019
union
select	Education as Education_, id as ceo_id_, `year` as year_ 
from ceo_culture_stg.ceo_bio_2018
union
select	Education as Education_, id as ceo_id_, `year` as year_ 
from ceo_culture_stg.ceo_bio_2017
union
select	Education as Education_, id as ceo_id_, `year` as year_ 
from ceo_culture_stg.ceo_bio_2016
union
select	Education as Education_, id as ceo_id_, `year` as year_ 
from ceo_culture_stg.ceo_bio_2015) a

left join ceo_culture_dwh_2.education b 
		on a.Education_ = b.education AND a.ceo_id_ = b.ceo_id
        AND a.year_ = b.`year`
;
SET foreign_key_checks = 1;

END