CREATE DEFINER=`root`@`localhost` PROCEDURE `country_procedure`()
BEGIN
SET foreign_key_checks = 0;

TRUNCATE TABLE  ceo_culture_dwh_2.country;

insert into ceo_culture_dwh_2.country 
	(
	country,
    ceo_id,
    g_leadership_id,
    g_societal_culture_id,
    hofstede_id,
    `year`
	)

	select  e.country_ as country,
			e.ceo_bio_id_ as ceo_id,
			e.g_leadership_id_ as g_leadership_id,
			e.g_societal_culture_id_ as g_societal_culture_id,
			e.hofstede_id_ as hofstede_id,
            e.year_ as `year`
			from (
            
				select distinct a.country_ as country_,  
								a.g_leadership_id_ as g_leadership_id_,
								a.g_societal_culture_id_ as g_societal_culture_id_,
								a.ceo_bio_id_ as ceo_bio_id_,
								a.hofstede_id_ as hofstede_id_,
                                a.year_ as year_
                                
				from 	
					( 
					select distinct gl19.country__ as country_,  
									gl19.g_leadership_id_ as g_leadership_id_,
									ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
									ceo_culture_stg.ceo_bio_2019.id as ceo_bio_id_,
                                    ceo_culture_stg.ceo_bio_2019.`year` as year_,
									ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
									                                    
									
					from (
						select distinct `Country Name` as country__, `Country` as g_leadership_id_
						from ceo_culture_stg.globe_leadership ) gl19
					left join ceo_culture_stg.globe_societal_culture on gl19.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
					left join ceo_culture_stg.ceo_bio_2019 on gl19.country__ = ceo_culture_stg.ceo_bio_2019.Nationality
					left join ceo_culture_stg.hofstede on gl19.country__ = ceo_culture_stg.hofstede.country
					
					Union all

					select distinct gsc19.country__ as country_,  
									ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
									gsc19.g_societal_culture_id_ as g_societal_culture_id_,
									ceo_culture_stg.ceo_bio_2019.id as ceo_bio_id_,
                                    ceo_culture_stg.ceo_bio_2019.`year` as year_,
									ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
					from (
						select distinct `Country Name` as country__, `Country` as g_societal_culture_id_
						from ceo_culture_stg.globe_societal_culture ) gsc19
					left join ceo_culture_stg.globe_leadership on gsc19.country__ = ceo_culture_stg.globe_leadership.`Country Name`
					left join ceo_culture_stg.ceo_bio_2019 on gsc19.country__ = ceo_culture_stg.ceo_bio_2019.Nationality
					left join ceo_culture_stg.hofstede on gsc19.country__ = ceo_culture_stg.hofstede.country
					
					Union all

					SELECT distinct c19.country__ as country_,  
									ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
									ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
									c19.ceo_bio_id_ as ceo_bio_id_,
                                    c19.`year` as year_,
									ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
					from( 
						select distinct `Nationality` as country__, `id` as ceo_bio_id_, `year`
						from ceo_culture_stg.ceo_bio_2019) c19
					left join ceo_culture_stg.globe_leadership on c19.country__ = ceo_culture_stg.globe_leadership.`Country Name`
					left join ceo_culture_stg.globe_societal_culture on c19.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
					left join ceo_culture_stg.hofstede on c19.country__ = ceo_culture_stg.hofstede.country
					
					Union all
					
					SELECT distinct h19.country__ as country_,  
									ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
									ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
									ceo_culture_stg.ceo_bio_2019.id as ceo_bio_id_,
									ceo_culture_stg.ceo_bio_2019.`year` as year_,
                                    h19.hofstede_id_ as hofstede_id_
									
					from(
						select distinct country as country__ , `hofstede_id` as hofstede_id_
						from ceo_culture_stg.hofstede) h19
					left join ceo_culture_stg.globe_leadership on h19.country__ = ceo_culture_stg.globe_leadership.`Country Name`
					left join ceo_culture_stg.globe_societal_culture on h19.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
					left join ceo_culture_stg.ceo_bio_2019 on h19.country__ = ceo_culture_stg.ceo_bio_2019.Nationality
					)	a
					
					
					
					
					Union
					
					
					
				select distinct b.country_ as country_,  
								b.g_leadership_id_ as g_leadership_id_,
								b.g_societal_culture_id_ as g_societal_culture_id_,
								b.ceo_bio_id_ as ceo_bio_id_,
								b.hofstede_id_ as hofstede_id_,
                                b.year_ as year_
				from	
					( 
					select distinct gl18.country__ as country_,  
									gl18.g_leadership_id_ as g_leadership_id_,
									ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
									ceo_culture_stg.ceo_bio_2018.id as ceo_bio_id_,
                                    ceo_culture_stg.ceo_bio_2018.`year` as year_,
									ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
									
					from (
						select distinct `Country Name` as country__, `Country` as g_leadership_id_
						from ceo_culture_stg.globe_leadership ) gl18
					left join ceo_culture_stg.globe_societal_culture on gl18.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
					left join ceo_culture_stg.ceo_bio_2018 on gl18.country__ = ceo_culture_stg.ceo_bio_2018.Nationality
					left join ceo_culture_stg.hofstede on gl18.country__ = ceo_culture_stg.hofstede.country
					
					Union all

					select distinct gsc18.country__ as country_,  
									ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
									gsc18.g_societal_culture_id_ as g_societal_culture_id_,
									ceo_culture_stg.ceo_bio_2018.id as ceo_bio_id_,
                                    ceo_culture_stg.ceo_bio_2018.`year` as year_,
									ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
					from (
						select distinct `Country Name` as country__, `Country` as g_societal_culture_id_
						from ceo_culture_stg.globe_societal_culture ) gsc18
					left join ceo_culture_stg.globe_leadership on gsc18.country__ = ceo_culture_stg.globe_leadership.`Country Name`
					left join ceo_culture_stg.ceo_bio_2018 on gsc18.country__ = ceo_culture_stg.ceo_bio_2018.Nationality
					left join ceo_culture_stg.hofstede on gsc18.country__ = ceo_culture_stg.hofstede.country
					
					Union all

					SELECT distinct c18.country__ as country_,  
									ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
									ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
									c18.ceo_bio_id_ as ceo_bio_id_,
                                    c18.`year` as year_,
									ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
					from( 
						select distinct `Nationality` as country__, `id` as ceo_bio_id_, `year`
						from ceo_culture_stg.ceo_bio_2018) c18
					left join ceo_culture_stg.globe_leadership on c18.country__ = ceo_culture_stg.globe_leadership.`Country Name`
					left join ceo_culture_stg.globe_societal_culture on c18.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
					left join ceo_culture_stg.hofstede on c18.country__ = ceo_culture_stg.hofstede.country
					
					Union all
					
					SELECT distinct h18.country__ as country_,  
									ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
									ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
									ceo_culture_stg.ceo_bio_2018.id as ceo_bio_id_,
                                    ceo_culture_stg.ceo_bio_2018.`year` as year_,
									h18.hofstede_id_ as hofstede_id_
									
					from(
						select distinct country as country__ , `hofstede_id` as hofstede_id_
						from ceo_culture_stg.hofstede) h18
					left join ceo_culture_stg.globe_leadership on h18.country__ = ceo_culture_stg.globe_leadership.`Country Name`
					left join ceo_culture_stg.globe_societal_culture on h18.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
					left join ceo_culture_stg.ceo_bio_2018 on h18.country__ = ceo_culture_stg.ceo_bio_2018.Nationality
					) b
					
					
					
					
					Union
					
					
					
				select distinct c.country_ as country_,  
								c.g_leadership_id_ as g_leadership_id_,
								c.g_societal_culture_id_ as g_societal_culture_id_,
								c.ceo_bio_id_ as ceo_bio_id_,
								c.hofstede_id_ as hofstede_id_,
                                c.year_ as year_
				from	
					( 
					select distinct gl17.country__ as country_,  
									gl17.g_leadership_id_ as g_leadership_id_,
									ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
									ceo_culture_stg.ceo_bio_2017.id as ceo_bio_id_,
                                    ceo_culture_stg.ceo_bio_2017.`year` as year_,
									ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
									
					from (
						select distinct `Country Name` as country__, `Country` as g_leadership_id_
						from ceo_culture_stg.globe_leadership ) gl17
					left join ceo_culture_stg.globe_societal_culture on gl17.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
					left join ceo_culture_stg.ceo_bio_2017 on gl17.country__ = ceo_culture_stg.ceo_bio_2017.Nationality
					left join ceo_culture_stg.hofstede on gl17.country__ = ceo_culture_stg.hofstede.country
					
					Union all

					select distinct gsc17.country__ as country_,  
									ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
									gsc17.g_societal_culture_id_ as g_societal_culture_id_,
									ceo_culture_stg.ceo_bio_2017.id as ceo_bio_id_,
                                    ceo_culture_stg.ceo_bio_2017.`year` as year_,
									ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
					from (
						select distinct `Country Name` as country__, `Country` as g_societal_culture_id_
						from ceo_culture_stg.globe_societal_culture ) gsc17
					left join ceo_culture_stg.globe_leadership on gsc17.country__ = ceo_culture_stg.globe_leadership.`Country Name`
					left join ceo_culture_stg.ceo_bio_2017 on gsc17.country__ = ceo_culture_stg.ceo_bio_2017.Nationality
					left join ceo_culture_stg.hofstede on gsc17.country__ = ceo_culture_stg.hofstede.country
					
					Union all

					SELECT distinct c17.country__ as country_,  
									ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
									ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
									c17.ceo_bio_id_ as ceo_bio_id_,
                                    c17.`year` as year_,
									ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
					from( 
						select distinct `Nationality` as country__, `id` as ceo_bio_id_, `year`
						from ceo_culture_stg.ceo_bio_2017) c17
					left join ceo_culture_stg.globe_leadership on c17.country__ = ceo_culture_stg.globe_leadership.`Country Name`
					left join ceo_culture_stg.globe_societal_culture on c17.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
					left join ceo_culture_stg.hofstede on c17.country__ = ceo_culture_stg.hofstede.country
					
					Union all
					
					SELECT distinct h17.country__ as country_,  
									ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
									ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
									ceo_culture_stg.ceo_bio_2017.id as ceo_bio_id_,
                                    ceo_culture_stg.ceo_bio_2017.`year` as year_,
									h17.hofstede_id_ as hofstede_id_
									
					from(
						select distinct country as country__ , `hofstede_id` as hofstede_id_
						from ceo_culture_stg.hofstede) h17
					left join ceo_culture_stg.globe_leadership on h17.country__ = ceo_culture_stg.globe_leadership.`Country Name`
					left join ceo_culture_stg.globe_societal_culture on h17.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
					left join ceo_culture_stg.ceo_bio_2017 on h17.country__ = ceo_culture_stg.ceo_bio_2017.Nationality
					)c
					
					
					
					
					Union
					
					
					
				select distinct d.country_ as country_,  
								d.g_leadership_id_ as g_leadership_id_,
								d.g_societal_culture_id_ as g_societal_culture_id_,
								d.ceo_bio_id_ as ceo_bio_id_,
								d.hofstede_id_ as hofstede_id_,
                                d.year_ as year_
				from	
					( 
					select distinct gl16.country__ as country_,  
									gl16.g_leadership_id_ as g_leadership_id_,
									ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
									ceo_culture_stg.ceo_bio_2016.id as ceo_bio_id_,
                                    ceo_culture_stg.ceo_bio_2016.`year` as year_,
									ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
									
					from (
						select distinct `Country Name` as country__, `Country` as g_leadership_id_
						from ceo_culture_stg.globe_leadership ) gl16
					left join ceo_culture_stg.globe_societal_culture on gl16.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
					left join ceo_culture_stg.ceo_bio_2016 on gl16.country__ = ceo_culture_stg.ceo_bio_2016.Nationality
					left join ceo_culture_stg.hofstede on gl16.country__ = ceo_culture_stg.hofstede.country
					
					Union all

					select distinct gsc16.country__ as country_,  
									ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
									gsc16.g_societal_culture_id_ as g_societal_culture_id_,
									ceo_culture_stg.ceo_bio_2016.id as ceo_bio_id_,
                                    ceo_culture_stg.ceo_bio_2016.`year` as year_,
									ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
					from (
						select distinct `Country Name` as country__, `Country` as g_societal_culture_id_
						from ceo_culture_stg.globe_societal_culture ) gsc16
					left join ceo_culture_stg.globe_leadership on gsc16.country__ = ceo_culture_stg.globe_leadership.`Country Name`
					left join ceo_culture_stg.ceo_bio_2016 on gsc16.country__ = ceo_culture_stg.ceo_bio_2016.Nationality
					left join ceo_culture_stg.hofstede on gsc16.country__ = ceo_culture_stg.hofstede.country
					
					Union all

					SELECT distinct c16.country__ as country_,  
									ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
									ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
									c16.ceo_bio_id_ as ceo_bio_id_,
                                    c16.`year` as year_,
									ceo_culture_stg.hofstede.hofstede_id as hofstede_id_
					from( 
						select distinct `Nationality` as country__, `id` as ceo_bio_id_, `year`
						from ceo_culture_stg.ceo_bio_2016) c16
					left join ceo_culture_stg.globe_leadership on c16.country__ = ceo_culture_stg.globe_leadership.`Country Name`
					left join ceo_culture_stg.globe_societal_culture on c16.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
					left join ceo_culture_stg.hofstede on c16.country__ = ceo_culture_stg.hofstede.country
																
					Union all
					
					SELECT distinct h16.country__ as country_,  
									ceo_culture_stg.globe_leadership.Country as g_leadership_id_,
									ceo_culture_stg.globe_societal_culture.Country as g_societal_culture_id_,
									ceo_culture_stg.ceo_bio_2016.id as ceo_bio_id_,
                                    ceo_culture_stg.ceo_bio_2016.`year` as year_,
									h16.hofstede_id_ as hofstede_id_
									
					from(
						select distinct country as country__ , `hofstede_id` as hofstede_id_
						from ceo_culture_stg.hofstede) h16
					left join ceo_culture_stg.globe_leadership on h16.country__ = ceo_culture_stg.globe_leadership.`Country Name`
					left join ceo_culture_stg.globe_societal_culture on h16.country__ = ceo_culture_stg.globe_societal_culture.`Country Name`
					left join ceo_culture_stg.ceo_bio_2016 on h16.country__ = ceo_culture_stg.ceo_bio_2016.Nationality
					)d
					
				) e


left join ceo_culture_dwh_2.country b
		on  e.country_ = b.country
        AND e.ceo_bio_id_ = b.ceo_id
		AND e.g_leadership_id_ = b.g_leadership_id
		AND e.g_societal_culture_id_ = b.g_societal_culture_id
		AND e.hofstede_id_ = b.hofstede_id

;

SET foreign_key_checks = 1;

END