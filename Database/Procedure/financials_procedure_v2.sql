CREATE DEFINER=`root`@`localhost` PROCEDURE `financials_procedure`()
BEGIN
SET foreign_key_checks = 0;

TRUNCATE TABLE  ceo_culture_dwh_2.financials;

insert into ceo_culture_dwh_2.financials 
	(
	`company_info_id`,
    `revenues_$m`,
	`profit_$m`,
	`assets_$m`,
	`total_stockholder_equity_$m`,
	`profit_as_%_of_revenues`,
	`profits_as_%_of_assets`,
	`profits_as_%_of_stockholder_equity`,
    `year`
	)
select
	
    a.`id_` as `company_info_id`,
    a.`Revenues_$M_` as `revenues_$m`,
	a.`Profits_$M_` as `profit_$m`,
	a.`Assets_$M_` as `assets_$m`,
	a.`Total_Stockholder_Equity_$M_` as `total_stockholder_equity_$m`,
	a.`Profit_as_%_of_Revenues_` as `profit_as_%_of_revenues`,
	a.`Profits_as_%_of_Assets_` as `profits_as_%_of_assets`,
	a.`Profits_as_%_of_Stockholder_Equity_` as `profits_as_%_of_stockholder_equity`, 
    a.`year_` as `year`
			
from 
		(select `id` as `id_`,
				`Revenues_$M` as `Revenues_$M_`,
				`Profits_$M` as `Profits_$M_`,
				`Assets_$M` as `Assets_$M_`,
				`Total_Stockholder_Equity_$M` as `Total_Stockholder_Equity_$M_`,
				`Profit_as_%_of_Revenues` as `Profit_as_%_of_Revenues_`,
				`Profits_as_%_of_Assets` as `Profits_as_%_of_Assets_`,
				`Profits_as_%_of_Stockholder_Equity` as `Profits_as_%_of_Stockholder_Equity_`,
                `year` as `year_`
		from ceo_culture_stg.financial_values_2019
Union
select `id` as `id_`,
				`Revenues_$M` as `Revenues_$M_`,
				`Profits_$M` as `Profits_$M_`,
				`Assets_$M` as `Assets_$M_`,
				`Total_Stockholder_Equity_$M` as `Total_Stockholder_Equity_$M_`,
				`Profit_as_%_of_Revenues` as `Profit_as_%_of_Revenues_`,
				`Profits_as_%_of_Assets` as `Profits_as_%_of_Assets_`,
				`Profits_as_%_of_Stockholder_Equity` as `Profits_as_%_of_Stockholder_Equity_`,
                `year` as `year_`
		from ceo_culture_stg.financial_values_2018
Union
select `id` as `id_`,
				`Revenues_$M` as `Revenues_$M_`,
				`Profits_$M` as `Profits_$M_`,
				`Assets_$M` as `Assets_$M_`,
				`Total_Stockholder_Equity_$M` as `Total_Stockholder_Equity_$M_`,
				`Profit_as_%_of_Revenues` as `Profit_as_%_of_Revenues_`,
				`Profits_as_%_of_Assets` as `Profits_as_%_of_Assets_`,
				`Profits_as_%_of_Stockholder_Equity` as `Profits_as_%_of_Stockholder_Equity_`,
                `year` as `year_`
		from ceo_culture_stg.financial_values_2017
Union
select `id` as `id_`,
				`Revenues_$M` as `Revenues_$M_`,
				`Profits_$M` as `Profits_$M_`,
				`Assets_$M` as `Assets_$M_`,
				`Total_Stockholder_Equity_$M` as `Total_Stockholder_Equity_$M_`,
				`Profit_as_%_of_Revenues` as `Profit_as_%_of_Revenues_`,
				`Profits_as_%_of_Assets` as `Profits_as_%_of_Assets_`,
				`Profits_as_%_of_Stockholder_Equity` as `Profits_as_%_of_Stockholder_Equity_`,
                `year` as `year_`
		from ceo_culture_stg.financial_values_2016

        ) a

left join ceo_culture_dwh_2.financials b 
		on a.`id_` = b.`company_info_id`
        AND a.`Revenues_$M_` = b.`revenues_$m` AND a.`Profits_$M_` = b.`profit_$m`
        AND a.`Assets_$M_` = b.`assets_$m`  AND a.`Total_Stockholder_Equity_$M_` = b.`total_stockholder_equity_$m`
        AND a.`Profit_as_%_of_Revenues_` = b.`profit_as_%_of_revenues`  AND a.`Profits_as_%_of_Assets_` = b.`profits_as_%_of_assets`
        AND a.`Profits_as_%_of_Stockholder_Equity_` = b.`profits_as_%_of_stockholder_equity`
        AND a.`year_` = b.`year`

;

SET foreign_key_checks = 1;
END