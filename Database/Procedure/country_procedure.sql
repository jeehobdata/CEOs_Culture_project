CREATE DEFINER=`root`@`localhost` PROCEDURE `country_procedure`()
BEGIN
TRUNCATE TABLE  ceo_culture_dwh.country;

insert into ceo_culture_dwh.country 
	(
	country
	)

select aa.country_ as country	
		
from (
		select a.country_	as country_		
		from (
				select distinct `Country Name` as country_
				from ceo_culture_stg.globe_leadership
				group by country_
				
				Union all

				select distinct `Country Name` as country_
				from ceo_culture_stg.globe_societal_culture
				group by country_
				
				Union all

				
				select distinct`country/territory` as country_
				from ceo_culture_stg.fg500_company
				group by country_
				
				Union all
				
				select distinct `Nationality` as country_
				from ceo_culture_stg.ceo_bio
				group by country_
			   
				
				Union all
				
				select distinct h.country__ as country_ 
				from(
					select distinct country as country__
					from ceo_culture_stg.hofstede) h
				group by country_
				
			) a
		group by country_
		order by country_
	)aa


left join ceo_culture_dwh.country b
		on aa.country_ = b.country

;
END