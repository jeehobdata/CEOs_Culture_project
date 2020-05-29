CREATE DEFINER=`admin`@`%` PROCEDURE `g_leadership_procedure`()
BEGIN
SET foreign_key_checks = 0;

TRUNCATE TABLE  ceo_culture_dwh_2.g_leadership;

insert into ceo_culture_dwh_2.g_leadership 
	(
    `g_leadership_id`,
	`Country Name`, 
	`Performance Oriented`,
    `Autocratic`,
    `Modesty`,
    `Charismatic 3: Self-sacrifice`,
    `Team 1: Collaborative Team Orientation`,
    `Decisive`,
    `Diplomatic`,
    `Face-saver`,
    `Charismatic 1: Visionary`,
    `Humane-oriented`,
    `Integrity`,
    `Bureaucratic, Originally Labeled ??Procedural??`,
    `Administratively Competent`,
    `Self-centred`,
    `Autonomous`,
    `Status Conscious`,
    `Charismatic 2: Inspirational`,
    `Malevolent`,
    `Team 2: Team Integrator`,
    `Internally Competitive, Originally Labeled ??Conflict Inducer??`,
    `Participative`,
    `Charismatic/Value-based Global Leadership Dimension`,
    `Team-Oriented Global Leadership Dimension`,
    `Self-Protective Global Leadership Dimension`,
    `Participative Global Leadership Dimension`,
    `Humane-Oriented Global Leadership Dimension`,
    `Autonomous Global Leadership Dimension`,
    `Country Cluster`
	)
select
	
    a.`Country` as `g_leadership_id`,
    a.`Country Name` as `Country Name`,
	a.`Performance Oriented` as `Performance Oriented`,
    a.`Autocratic` as `Autocratic`,
    a.`Modesty` as `Modesty`,
    a.`Charismatic 3: Self-sacrifice` as `Charismatic 3: Self-sacrifice`,
    a.`Team 1: Collaborative Team Orientation` as `Team 1: Collaborative Team Orientation`,
    a.`Decisive` as `Decisive`,
    a.`Diplomatic` as `Diplomatic`,
    a.`Face-saver` as `Diplomatic`,
    a.`Charismatic 1: Visionary` as `Charismatic 1: Visionary`,
    a.`Humane-oriented` as `Humane-oriented`,
    a.`Integrity` as `Integrity`,
    a.`Bureaucratic, Originally Labeled ??Procedural??` as `Bureaucratic, Originally Labeled ??Procedural??`,
    a.`Administratively Competent` as `Administratively Competent`,
    a.`Self-centred` as `Self-centred`,
    a.`Autonomous` as `Autonomous`,
    a.`Status Conscious` as `Status Conscious`,
    a.`Charismatic 2: Inspirational` as `Charismatic 2: Inspirational`,
    a.`Malevolent` as `Malevolent`,
    a.`Team 2: Team Integrator` as `Team 2: Team Integrator`,
    a.`Internally Competitive, Originally Labeled ??Conflict Inducer??` as `Internally Competitive, Originally Labeled ??Conflict Inducer??`,
    a.`Participative` as `Participative`,
    a.`Charismatic/Value-based Global Leadership Dimension` as `Charismatic/Value-based Global Leadership Dimension`,
    a.`Team-Oriented Global Leadership Dimension` as `Team-Oriented Global Leadership Dimension`,
    a.`Self-Protective Global Leadership Dimension` as `Self-Protective Global Leadership Dimension`,
    a.`Participative Global Leadership Dimension` as `Participative Global Leadership Dimension`,
    a.`Humane-Oriented Global Leadership Dimension` as `Humane-Oriented Global Leadership Dimension`,
    a.`Autonomous Global Leadership Dimension` as `Autonomous Global Leadership Dimension`,
    a.`Country Cluster` as `Country Cluster`
			
from ceo_culture_stg.globe_leadership a

left join ceo_culture_dwh_2.g_leadership b 
		on  a.`Country` = b.`g_leadership_id` AND
			a.`Country Name` = b.`Country Name` AND 
			a.`Performance Oriented` = b.`Performance Oriented` AND
			a.`Autocratic` = b.`Autocratic` AND
			a.`Modesty` = b.`Modesty`AND
			a.`Charismatic 3: Self-sacrifice` = b.`Charismatic 3: Self-sacrifice` AND
			a.`Team 1: Collaborative Team Orientation` = b.`Team 1: Collaborative Team Orientation` AND
			a.`Decisive` = b.`Decisive` AND
			a.`Diplomatic` = b.`Diplomatic` AND
			a.`Face-saver` = b.`Diplomatic` AND
			a.`Charismatic 1: Visionary` = b.`Charismatic 1: Visionary` AND
			a.`Humane-oriented` = b.`Humane-oriented` AND
			a.`Integrity` = b.`Integrity` AND
			a.`Bureaucratic, Originally Labeled ??Procedural??` = b.`Bureaucratic, Originally Labeled ??Procedural??` AND
			a.`Administratively Competent` = b.`Administratively Competent`AND
			a.`Self-centred` = b.`Self-centred` AND
			a.`Autonomous` = b.`Autonomous` AND
			a.`Status Conscious` = b.`Status Conscious` AND
			a.`Charismatic 2: Inspirational` = b.`Charismatic 2: Inspirational` AND
			a.`Malevolent` = b.`Malevolent` AND
			a.`Team 2: Team Integrator` = b.`Team 2: Team Integrator` AND
			a.`Internally Competitive, Originally Labeled ??Conflict Inducer??` = b.`Internally Competitive, Originally Labeled ??Conflict Inducer??`AND
			a.`Participative` = b.`Participative` AND
			a.`Charismatic/Value-based Global Leadership Dimension` = b.`Charismatic/Value-based Global Leadership Dimension` AND
			a.`Team-Oriented Global Leadership Dimension` = b.`Team-Oriented Global Leadership Dimension` AND
			a.`Self-Protective Global Leadership Dimension` = b.`Self-Protective Global Leadership Dimension`AND
			a.`Participative Global Leadership Dimension` = b.`Participative Global Leadership Dimension` AND
			a.`Humane-Oriented Global Leadership Dimension` = b.`Humane-Oriented Global Leadership Dimension`AND
			a.`Autonomous Global Leadership Dimension` = b.`Autonomous Global Leadership Dimension` AND
			a.`Country Cluster` = b.`Country Cluster` 
;

SET foreign_key_checks = 1;

END