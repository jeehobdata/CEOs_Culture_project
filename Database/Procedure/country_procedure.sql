CREATE DEFINER=`root`@`localhost` PROCEDURE `country_procedure`()
BEGIN
SET foreign_key_checks = 0;

TRUNCATE TABLE  ceo_culture_dwh.country;

insert into ceo_culture_dwh.country 
	(
	country,
    company_info_id,
    ceo_id,
    g_leadership_id,
    g_societal_culture_id,
    hofstede_id
	)

select 
	aa.country_ as country,
	aa.company_info_id_ as company_info_id,
    aa.ceo_id_ as ceo_id,
    aa.g_leadership_id_ as g_leadership_id,
    aa.g_societal_culture_id_ as g_societal_culture_id,
    aa.hofstede_id_ as hofstede_id
		
from (
		select  a.country_ as country_,
				a.company_info_id_ as company_info_id_,
				a.ceo_bio_id_ as ceo_id_,
				a.g_leadership_id_ as g_leadership_id_,
				a.g_societal_culture_id_ as g_societal_culture_id_,
				a.hofstede_id_ as hofstede_id_
				from (
						select distinct gl.country__ as country_,  
										gl.g_leadership_id_ as g_leadership_id_,
										ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
										ceo_culture_stg.fg500_company.id as company_info_id_,
										ceo_culture_stg.ceo_bio.id as ceo_bio_id_,
										ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
										
						from (
							select distinct `Country Name` as country__, `Country` as g_leadership_id_
							from ceo_culture_stg.globe_leadership ) gl
						left join ceo_culture_stg.globe_societal_culture on gl.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
						left join ceo_culture_stg.fg500_company on gl.country__ = ceo_culture_stg.fg500_company.`country/territory`
						left join ceo_culture_stg.ceo_bio on gl.country__ = ceo_culture_stg.ceo_bio.Nationality
						left join ceo_culture_stg.hofstede on gl.country__ = ceo_culture_stg.hofstede.country
						
						
						Union all


						select distinct gsc.country__ as country_,  
										ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
										gsc.g_societal_culture_id_ as g_societal_culture_id_,
										ceo_culture_stg.fg500_company.id as company_info_id_,
										ceo_culture_stg.ceo_bio.id as ceo_bio_id_,
										ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
						from (
							select distinct `Country Name` as country__, `Country` as g_societal_culture_id_
							from ceo_culture_stg.globe_societal_culture ) gsc
						left join ceo_culture_stg.globe_leadership on gsc.country__ = ceo_culture_stg.globe_leadership.`Country Name`
						left join ceo_culture_stg.fg500_company on gsc.country__ = ceo_culture_stg.fg500_company.`country/territory`
						left join ceo_culture_stg.ceo_bio on gsc.country__ = ceo_culture_stg.ceo_bio.Nationality
						left join ceo_culture_stg.hofstede on gsc.country__ = ceo_culture_stg.hofstede.country
						
						
						
						Union all


						
						select distinct com.country__ as country_,  
										ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
										ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
										com.company_info_id_ as company_info_id_,
										ceo_culture_stg.ceo_bio.id as ceo_bio_id_,
										ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
						from (
							select distinct `country/territory` as country__, `id` as company_info_id_
							from ceo_culture_stg.fg500_company) com
						left join ceo_culture_stg.globe_leadership on com.country__ = ceo_culture_stg.globe_leadership.`Country Name`
						left join ceo_culture_stg.globe_societal_culture on com.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
						left join ceo_culture_stg.ceo_bio on com.country__ = ceo_culture_stg.ceo_bio.Nationality
						left join ceo_culture_stg.hofstede on com.country__ = ceo_culture_stg.hofstede.country
						
						
						
						Union all
						
						
						
						SELECT distinct c.country__ as country_,  
										ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
										ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
										ceo_culture_stg.fg500_company.id as company_info_id_,
										c.ceo_bio_id_ as ceo_bio_id_,
										ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
						from( 
							select distinct `Nationality` as country__, `id` as ceo_bio_id_
							from ceo_culture_stg.ceo_bio) c
						left join ceo_culture_stg.globe_leadership on c.country__ = ceo_culture_stg.globe_leadership.`Country Name`
						left join ceo_culture_stg.globe_societal_culture on c.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
						left join ceo_culture_stg.fg500_company on c.country__ = ceo_culture_stg.fg500_company.`country/territory`
						left join ceo_culture_stg.hofstede on c.country__ = ceo_culture_stg.hofstede.country
						
					   
						
						Union all
						
						
						
						SELECT distinct h.country__ as country_,  
										ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
										ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
										ceo_culture_stg.fg500_company.id as company_info_id_,
										ceo_culture_stg.ceo_bio.id as ceo_bio_id_,
										h.hofstede_id_ as hofstede_id_
										
						from(
							select distinct country as country__ , `hofstede_id` as hofstede_id_
							from ceo_culture_stg.hofstede) h
						left join ceo_culture_stg.globe_leadership on h.country__ = ceo_culture_stg.globe_leadership.`Country Name`
						left join ceo_culture_stg.globe_societal_culture on h.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
						left join ceo_culture_stg.fg500_company on h.country__ = ceo_culture_stg.fg500_company.`country/territory`
						left join ceo_culture_stg.ceo_bio on h.country__ = ceo_culture_stg.ceo_bio.Nationality
										
					) a
				
			order by country_
	)aa


left join ceo_culture_dwh.country b
		on  aa.country_ = b.country
        AND aa.company_info_id_ = b.company_info_id
		AND aa.ceo_id_ = b.ceo_id
		AND aa.g_leadership_id_ = b.g_leadership_id
		AND aa.g_societal_culture_id_ = b.g_societal_culture_id
		AND aa.hofstede_id_ = b.hofstede_id

;

SET foreign_key_checks = 1;

END