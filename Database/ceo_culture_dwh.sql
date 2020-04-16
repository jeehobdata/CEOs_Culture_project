
 -- create a database
CREATE DATABASE IF NOT EXISTS `ceo_culture_dwh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ceo_culture_dwh`;
 



 -- Create company_info table
Drop table if exists `company_info`;
create table `company_info`(
`company_info_id` int(255) not null auto_increment  primary key,
`rank` varchar(255), 
`company` varchar(255),
`employees` varchar(255),
`sector` varchar(255),
`industry` varchar(255),
`change in rank 500` varchar(50),
`HQ Location` varchar(255),
`Website` varchar(255),
`Years on Global 500 List` varchar(100))
COLLATE 'utf8mb4_0900_ai_ci';




-- create financials table
Drop table if exists `financials`;
create table `financials`(
`financials_id` int(255) not null auto_increment primary key,
`company_info_id` int(255) not null,
`revenues_$m` varchar(300),
`profit_$m` varchar(300),
`assets_$m` varchar(300),
`total_stockholder_equity_$m` varchar(300),
`profit_as_%_of_revenues` varchar(300),
`profits_as_%_of_assets` varchar(300),
`profits_as_%_of_stockholder_equity` varchar(300)
)
COLLATE 'utf8mb4_0900_ai_ci';

SET foreign_key_checks = 0;
ALTER TABLE `financials`
  ADD CONSTRAINT `financials_ibfk_1` FOREIGN KEY (`company_info_id`) REFERENCES `company_info` (`company_info_id`) on update cascade on delete cascade;
SET foreign_key_checks = 1;



-- Create education table
Drop table if exists `education`;
create table `education`(
`education_id` int(255) not null auto_increment primary key,
`education` varchar(10000),
`ceo_id` int(255) not null)
COLLATE 'utf8mb4_0900_ai_ci';

SET foreign_key_checks = 0;
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`ceo_id`) REFERENCES `ceo` (`ceo_id`) on update cascade on delete cascade;
SET foreign_key_checks = 1;



-- create ceo table
Drop table if exists `ceo`;
create table `ceo`(
`ceo_id` int(255) not null auto_increment primary key,
`ceo` varchar(255),
`company_rank` int(255),
`BoY` varchar(50),
`Born` varchar(500)
)
COLLATE 'utf8mb4_0900_ai_ci';

SET foreign_key_checks = 0;
ALTER TABLE `ceo`
  ADD CONSTRAINT `ceo_ibfk_1` FOREIGN KEY (`company_rank`) REFERENCES `company_info` (`company_info_id`) on update cascade on delete cascade;
SET foreign_key_checks = 1;



-- create country table
Drop table if exists `country`;
create table `country`(
`country_id` int(255) not null auto_increment primary key,
`country` varchar(255),
`ceo_id` int(255),
`g_leadership_id` int(255),
`g_societal_culture_id` int(255),
`hofstede_id` int(255)
)
COLLATE 'utf8mb4_0900_ai_ci';

SET foreign_key_checks = 0;
ALTER TABLE `country`
  ADD CONSTRAINT `country_ibfk_1` FOREIGN KEY (`ceo_id`) REFERENCES `ceo` (`ceo_id`) on update cascade on delete cascade,
  ADD CONSTRAINT `country_ibfk_2` FOREIGN KEY (`g_leadership_id`) REFERENCES `g_leadership` (`g_leadership_id`) on update cascade on delete cascade,
  ADD CONSTRAINT `country_ibfk_3` FOREIGN KEY (`g_societal_culture_id`) REFERENCES `g_societal_culture` (`g_societal_culture_id`) on update cascade on delete cascade,
  ADD CONSTRAINT `country_ibfk_5` FOREIGN KEY (`hofstede_id`) REFERENCES `hofstede` (`hofstede_id`) on update cascade on delete cascade;
SET foreign_key_checks = 1;

 
 


 -- create g_societal_culture table
Drop table if exists `g_societal_culture`;
create table `g_societal_culture`(
`g_societal_culture_id` int(255) not null auto_increment primary key,
`Country Name` varchar(255) not null,
`Uncertainty Avoidance Societal Practices` varchar(50),
`Future Orientation Societal Practices` varchar(50),
`Power Distance Societal Practices` varchar(50),
`Collectivism I Societal Practices (Institutional Collectivism)` varchar(50),
`Humane Orientation Societal Practices` varchar(50),
`Performance Orientation Societal Practices` varchar(50),
`Collectivism II Societal Practices (In-group Collectivism)` varchar(50),
`Gender Egalitarianism Societal Practices` varchar(50),
`Assertiveness Societal Practices` varchar(50),
`Uncertainty Avoidance Societal Values` varchar(50),
`Future Orientation Societal Values` varchar(50),
`Power Distance Societal Values` varchar(50),
`Collectivism I Societal Values (Institutional Collectivism)` varchar(50),
`Human Orientation Societal Values` varchar(50),
`Performance Orientation Societal Values` varchar(50),
`Collectivism II Societal Values (In-group Collectivism)` varchar(50),
`Gender Egalitarianism Societal Values` varchar(50),
`Assertiveness Societal Values` varchar(50),
`Country Cluster` varchar(150))
COLLATE 'utf8mb4_0900_ai_ci';



-- create g_leadership table
Drop table if exists `g_leadership`;
create table `g_leadership`(
`g_leadership_id` int(255) not null auto_increment primary key,
`Country Name` varchar(255) not null,
`Performance Oriented` varchar(50),
`Autocratic` varchar(50),
`Modesty` varchar(50),
`Charismatic 3: Self-sacrifice` varchar(50),
`Team 1: Collaborative Team Orientation` varchar(50),
`Decisive` varchar(50),
`Diplomatic` varchar(50),
`Face-saver` varchar(50),
`Charismatic 1: Visionary` varchar(50),
`Humane-oriented` varchar(50),
`Integrity` varchar(50),
`Bureaucratic, Originally Labeled ??Procedural??` varchar(50),
`Administratively Competent` varchar(50),
`Self-centred` varchar(50),
`Autonomous` varchar(50),
`Status Conscious` varchar(50),
`Charismatic 2: Inspirational` varchar(50),
`Malevolent` varchar(50),
`Team 2: Team Integrator` varchar(50),
`Internally Competitive, Originally Labeled ??Conflict Inducer??` varchar(50),
`Participative` varchar(50),
`Charismatic/Value-based Global Leadership Dimension` varchar(50),
`Team-Oriented Global Leadership Dimension` varchar(50),
`Self-Protective Global Leadership Dimension` varchar(50),
`Participative Global Leadership Dimension` varchar(50),
`Humane-Oriented Global Leadership Dimension` varchar(50),
`Autonomous Global Leadership Dimension` varchar(50),
`Country Cluster` varchar(150))
COLLATE 'utf8mb4_0900_ai_ci';



-- create hofstede table
Drop table if exists `hofstede`;
create table `hofstede`(
`hofstede_id` int(255) not null auto_increment primary key,
`ctr` varchar(150),
`country` varchar(255),
`pdi` varchar(50),
`idv` varchar(50),
`mas` varchar(50),
`uai` varchar(50),
`ltowvs` varchar(50),
`ivr` varchar(50))
COLLATE 'utf8mb4_0900_ai_ci';

