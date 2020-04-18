CREATE DEFINER=`root`@`localhost` PROCEDURE `g_societal_culture_procedure`()
BEGIN
SET foreign_key_checks = 0;

TRUNCATE TABLE  ceo_culture_dwh.g_societal_culture;

insert into ceo_culture_dwh.g_societal_culture 
	(
    `g_societal_culture_id`,
	`Country Name`, 
	`Uncertainty Avoidance Societal Practices`, 
	`Future Orientation Societal Practices`,
    `Power Distance Societal Practices`,
    `Collectivism I Societal Practices (Institutional Collectivism)`,
    `Humane Orientation Societal Practices`,
    `Performance Orientation Societal Practices`,
    `Collectivism II Societal Practices (In-group Collectivism)`,
    `Gender Egalitarianism Societal Practices`,
    `Assertiveness Societal Practices`,
    `Uncertainty Avoidance Societal Values`,
	`Future Orientation Societal Values`,
    `Power Distance Societal Values`,
    `Collectivism I Societal Values (Institutional Collectivism)`,
    `Human Orientation Societal Values`,
    `Performance Orientation Societal Values`,
    `Collectivism II Societal Values (In-group Collectivism)`,
    `Gender Egalitarianism Societal Values`,
    `Assertiveness Societal Values`,
    `Country Cluster`
	)
select
	a.`Country` as `g_societal_culture_id`,
    a.`Country Name` as `Country Name`, 
	a.`Uncertainty Avoidance Societal Practices` as `Uncertainty Avoidance Societal Practices`, 
	a.`Future Orientation Societal Practices` as `Future Orientation Societal Practices`,
    a.`Power Distance Societal Practices` as `Power Distance Societal Practices`,
    a.`Collectivism I Societal Practices (Institutional Collectivism)` as `Collectivism I Societal Practices (Institutional Collectivism)`,
    a.`Humane Orientation Societal Practices` as `Humane Orientation Societal Practices`,
    a.`Performance Orientation Societal Practices` as `Performance Orientation Societal Practices`,
    a.`Collectivism II Societal Practices (In-group Collectivism)` as `Collectivism II Societal Practices (In-group Collectivism)`,
    a.`Gender Egalitarianism Societal Practices` as `Gender Egalitarianism Societal Practices`,
    a.`Assertiveness Societal Practices` as `Assertiveness Societal Practices`,
    a.`Uncertainty Avoidance Societal Values` as `Uncertainty Avoidance Societal Values`,
	a.`Future Orientation Societal Values` as `Future Orientation Societal Values`,
    a.`Power Distance Societal Values` as `Power Distance Societal Values`,
    a.`Collectivism I Societal Values (Institutional Collectivism)` as `Collectivism I Societal Values (Institutional Collectivism)`,
    a.`Human Orientation Societal Values` as `Human Orientation Societal Values`,
    a.`Performance Orientation Societal Values` as `Performance Orientation Societal Values`,
    a.`Collectivism II Societal Values (In-group Collectivism)` as `Collectivism II Societal Values (In-group Collectivism)`,
    a.`Gender Egalitarianism Societal Values` as `Gender Egalitarianism Societal Values`,
    a.`Assertiveness Societal Values` as `Assertiveness Societal Values`,
    a.`Country Cluster` as `Country Cluster`
			
from ceo_culture_stg.globe_societal_culture a

left join ceo_culture_dwh.g_societal_culture b 
		on a.`Country` = b.`g_societal_culture_id` AND
	a.`Country Name` = b.`Country Name` AND 
	a.`Uncertainty Avoidance Societal Practices` = b.`Uncertainty Avoidance Societal Practices`AND 
    a.`Future Orientation Societal Practices` = b.`Future Orientation Societal Practices` AND
    a.`Power Distance Societal Practices` = b.`Power Distance Societal Practices` AND
    a.`Collectivism I Societal Practices (Institutional Collectivism)` = b.`Collectivism I Societal Practices (Institutional Collectivism)` AND
    a.`Humane Orientation Societal Practices` = b.`Humane Orientation Societal Practices` AND
    a.`Performance Orientation Societal Practices` = b.`Performance Orientation Societal Practices` AND
    a.`Collectivism II Societal Practices (In-group Collectivism)` = b.`Collectivism II Societal Practices (In-group Collectivism)` AND
    a.`Gender Egalitarianism Societal Practices` = b.`Gender Egalitarianism Societal Practices` AND
    a.`Assertiveness Societal Practices` = b.`Assertiveness Societal Practices` AND
    a.`Uncertainty Avoidance Societal Values` = b.`Uncertainty Avoidance Societal Values` AND
	a.`Future Orientation Societal Values` = b.`Future Orientation Societal Values` AND
    a.`Power Distance Societal Values` = b.`Power Distance Societal Values`AND
    a.`Collectivism I Societal Values (Institutional Collectivism)` = b.`Collectivism I Societal Values (Institutional Collectivism)` AND
    a.`Human Orientation Societal Values` = b.`Human Orientation Societal Values`AND
    a.`Performance Orientation Societal Values` = b.`Performance Orientation Societal Values`AND
    a.`Collectivism II Societal Values (In-group Collectivism)` = b.`Collectivism II Societal Values (In-group Collectivism)`AND
    a.`Gender Egalitarianism Societal Values` = b.`Gender Egalitarianism Societal Values`AND
    a.`Assertiveness Societal Values` = b.`Assertiveness Societal Values` AND
    a.`Country Cluster` = b.`Country Cluster`
;

SET foreign_key_checks = 1;

END