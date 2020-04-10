CREATE DEFINER=`root`@`localhost` PROCEDURE `sector_procedure`()
BEGIN
TRUNCATE TABLE  ceo_culture_dwh.sector;

insert into ceo_culture_dwh.sector 
	(
	 sector
	)
select
	
    Sector_ as sector            
			
from (
select distinct	Sector as Sector_
from ceo_culture_stg.fg500_ceo) a

left join ceo_culture_dwh.sector b 
		on a.Sector_ = b.sector
;
END