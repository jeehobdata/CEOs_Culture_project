
select "company_info_id","rank", "company", "year", "employees", "sector", "industry",
		"HQ Location", "Website", "Years on Global 500 List",
		"revenues_$m", "profit_$m", "assets_$m", "total_stockholder_equity_$m",
		"profit_as_%_of_revenues", "profits_as_%_of_assets", "profits_as_%_of_stockholder_equity",
		"ceo", "Born", "BoY", "education", "country", 
        "g_leadership_id", "Country Name",
        "Performance Oriented","Autocratic","Modesty","Charismatic 3: Self-sacrifice","Team 1: Collaborative Team Orientation",
        "Decisive","Diplomatic","Face-saver","Charismatic 1: Visionary","Humane-oriented","Integrity","Bureaucratic, Originally Labeled ??Procedural??",
        "Administratively Competent","Self-centred","Autonomous","Status Conscious","Charismatic 2: Inspirational","Malevolent",
        "Team 2: Team Integrator","Internally Competitive, Originally Labeled ??Conflict Inducer??","Participative","Charismatic/Value-based Global Leadership Dimension",
        "Team-Oriented Global Leadership Dimension","Self-Protective Global Leadership Dimension","Participative Global Leadership Dimension",
        "Humane-Oriented Global Leadership Dimension","Autonomous Global Leadership Dimension","Country Cluster",
        "g_societal_culture_id","Country Name",
        "Uncertainty Avoidance Societal Practices","Future Orientation Societal Practices","Power Distance Societal Practices",
        "Collectivism I Societal Practices (Institutional Collectivism)","Humane Orientation Societal Practices","Performance Orientation Societal Practices",
        "Collectivism II Societal Practices (In-group Collectivism)","Gender Egalitarianism Societal Practices","Assertiveness Societal Practices",
        "Uncertainty Avoidance Societal Values","Future Orientation Societal Values","Power Distance Societal Values","Collectivism I Societal Values (Institutional Collectivism)",
        "Human Orientation Societal Values","Performance Orientation Societal Values","Collectivism II Societal Values (In-group Collectivism)","Gender Egalitarianism Societal Values",
        "Assertiveness Societal Values","Country Cluster",
        "hofstede_id","ctr","country","pdi","idv","mas","uai","ltowvs","ivr"
        
union
select distinct info.`company_info_id`, info.`rank`, info.company, info.`year`, info.employees, info.sector, info.industry,
				info.`HQ Location`, info.Website, info.`Years on Global 500 List`,
                finan.`revenues_$m`, finan.`profit_$m`, finan.`assets_$m`, finan.`total_stockholder_equity_$m`,
                finan.`profit_as_%_of_revenues`, finan.`profits_as_%_of_assets`, finan.`profits_as_%_of_stockholder_equity`,
                ceo.ceo, ceo.`Born`, ceo.`BoY`, edu.`education`, ctry.`country`, 
                leader.*, culture.*, hof.*
                
from ceo_culture_dwh_2.company_info info
left join ceo_culture_dwh_2.financials finan on (info.`rank` = finan.company_info_id) and (info.`year` = finan.`year`)
left join ceo_culture_dwh_2.ceo ceo on (info.`rank` = ceo.`company_rank`) and (info.`year` = ceo.`year`)
left join ceo_culture_dwh_2.education edu on (ceo.`ceo_id` = edu.`ceo_id`) and (ceo.`year` = edu.`year`)
left join ceo_culture_dwh_2.country ctry on ceo.`ceo_id` = ctry.`ceo_id` and (ceo.`year` = ctry.`year`)
left join ceo_culture_dwh_2.g_leadership leader on ctry.`g_leadership_id` = leader.`g_leadership_id`
left join ceo_culture_dwh_2.g_societal_culture culture on ctry.`g_societal_culture_id` = culture.`g_societal_culture_id`
left join ceo_culture_dwh_2.hofstede hof on ctry.`hofstede_id` = hof.`hofstede_id`
group by `company_info_id`
into outfile "C:\\ProgramData\\...\\full_data_set_v12(May3).csv"
FIELDS TERMINATED BY ';' ENCLOSED BY '"' lines terminated by '\n';

