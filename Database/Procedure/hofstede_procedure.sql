CREATE DEFINER=`root`@`localhost` PROCEDURE `hofstede_procedure`()
BEGIN
TRUNCATE TABLE  ceo_culture_dwh.hofstede;

insert into ceo_culture_dwh.hofstede 
	(
	 ctr,
     country,
     pdi,
     idv,
     mas,
     uai,
     ltowvs,
     ivr
	)
select
	
    a.ctr as ctr,
    a.country as country,
	a.pdi as pdi,
	a.idv as idv,
	a.mas as mas,
	a.uai as uai,
    a.ltowvs as ltowvs,
    a.ivr as ivr
			
from ceo_culture_stg.hofstede a

left join ceo_culture_dwh.hofstede b 
		on a.ctr = b.ctr AND a.country = b.country
        AND a.pdi = b.pdi AND a.idv = b.idv 
        AND a.mas = b.mas AND a.uai = b.uai 
        AND a.ltowvs = b.ltowvs AND a.ivr = b.ivr

;
END