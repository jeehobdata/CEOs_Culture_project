CREATE DATABASE  IF NOT EXISTS `ceo_culture_stg`/*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ceo_culture_stg`;


 -- Create ceo_bio table
Drop table if exists `ceo_bio`;
CREATE table ceo_bio(
id int(255) not null,
ceo varchar(255),
company_rank int(255) not null,
Born varchar(500),
Nationality varchar(255),
Education varchar(10000),
BoY varchar(50),

PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';

-- The value column needs to be separated before uploading to s3


 -- Create fg500-ceo table
Drop table if exists `fg500_ceo`;
CREATE table fg500_ceo(
id int(255) not null,
CEO varchar(255) ,
Sector varchar(255), 
Industry varchar(255),
`HQ Location` varchar(255),
Website varchar(255),
`Years on Global 500 List` varchar(100),
Employees varchar(255),
company varchar(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';



 -- Create globe_leadership table
CREATE table globe_leadership(
Country int(255) not null,
`Country Name` varchar(255),
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
`Country Cluster` varchar(150),
PRIMARY KEY (Country))
COLLATE 'utf8mb4_0900_ai_ci';



 -- Create globe_societal-culture table
CREATE table globe_societal_culture(
Country int(255) not null,
`Country Name` varchar(255),
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
`Country Cluster` varchar(150),
PRIMARY KEY (Country))
COLLATE 'utf8mb4_0900_ai_ci';



 -- Create hofstede table
Drop table if exists `hofstede`;
CREATE table hofstede(
ctr varchar(150) ,
country varchar(255), 
pdi varchar(50),
idv varchar(50),
mas varchar(50),
uai varchar(50),
ltowvs varchar(50),
ivr varchar(50))
COLLATE 'utf8mb4_0900_ai_ci';


 -- Create financial_values table
CREATE table financial_values(
`id` int(255) not null,
`Revenues_$M` varchar(300),
`Profits_$M` varchar(300),
`Assets_$M` varchar(300),
`Total_Stockholder_Equity_$M` varchar(300),
`Profit_as_%_of_Revenues` varchar(300),
`Profits_as_%_of_Assets` varchar(300),
`Profits_as_%_of_Stockholder_Equity` varchar(300),
`company` varchar(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';



 -- Create fg500_company table
CREATE table fg500_company(
id int(255) not null,
`rank` varchar(255),
`company` varchar(255),
`revenues` varchar(300),
`revenue % change` varchar(300),
`profits($M)` varchar(300),
`assets($M)` varchar(300),
`profits % change` varchar(300),
`employees` varchar(300),
`change in rank 500` varchar(50),
`country/territory` varchar(255),
PRIMARY KEY (id))
COLLATE 'utf8mb4_0900_ai_ci';


-- Import data into ceo_bio table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CEOs_info_v6.1(Apr_10_2020).csv' 
INTO TABLE ceo_bio 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Import data into fg500_ceo table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fg500_CEOs_v4_all(Apr_10_2020).csv' 
INTO TABLE fg500_ceo 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into fg500_company table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fg500_20200219001549.csv' 
INTO TABLE fg500_company
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into financial_values table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/key_financials_and_profit_ratio_all_v1.csv' 
INTO TABLE financial_values
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Import data into globe_leadership table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/GLOBE_Phase_2_Aggregated_Leadership.csv' 
INTO TABLE globe_leadership
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Import data into globe_societal_culture table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/GLOBE_Phase_2_Aggregated_Societal_Culture.csv' 
INTO TABLE globe_societal_culture
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Import data into hofstede table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hofstede_6D_v2(Mar_16_2020).csv' 
INTO TABLE hofstede
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



 -- Add auto_increment primary key column to hofstede table
 
 Alter table hofstede
 add column hofstede_id int not null auto_increment Primary Key;
