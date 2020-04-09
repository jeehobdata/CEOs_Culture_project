CREATE DEFINER=`root`@`localhost` PROCEDURE `company_procedure`()
BEGIN
TRUNCATE TABLE  ceo_culture_dwh.company;

insert into ceo_culture_dwh.company 
	(
	 company
	)
select
	
    a.company_ as company
    
from (
	select company as company_
    from ceo_culture_stg.fg500_company
    order by id)a
 
left join ceo_culture_dwh.company b 
		on a.company_ = b.company
;

END