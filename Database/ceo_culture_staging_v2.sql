CREATE DATABASE  IF NOT EXISTS `ceo_culture_stg`/*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ceo_culture_stg`;


-- Create 2019 tables -------------------------------------------------------------------------------
-- Create ceo_bio_2019 table
Drop table if exists `ceo_bio_2019`;
CREATE table ceo_bio_2019(
id int(255) not null,
ceo varchar(255),
company_rank int(255) not null,
Born varchar(500),
Nationality varchar(255),
Education varchar(10000),
BoY varchar(50),
`year` int(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';

-- The value column needs to be separated before uploading to s3

 -- Create fg500_ceo_2019 table
Drop table if exists `fg500_ceo_2019`;
CREATE table fg500_ceo_2019(
id int(255) not null,
CEO varchar(255) ,
Sector varchar(255), 
Industry varchar(255),
`HQ Location` varchar(255),
Website varchar(255),
`Years on Global 500 List` varchar(100),
Employees varchar(255),
company varchar(255),
`year` int(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';

-- Create financial_values_2019 tables
Drop table if exists `financial_values_2019`;
CREATE table financial_values_2019(
`id` int(255) not null,
`Revenues_$M` varchar(300),
`Profits_$M` varchar(300),
`Assets_$M` varchar(300),
`Total_Stockholder_Equity_$M` varchar(300),
`Profit_as_%_of_Revenues` varchar(300),
`Profits_as_%_of_Assets` varchar(300),
`Profits_as_%_of_Stockholder_Equity` varchar(300),
`company` varchar(255),
`year` int(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';

 -- Create fg500_company_2019 table
Drop table if exists `fg500_company_2019`;
CREATE table fg500_company_2019(
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
`year` int(255),
PRIMARY KEY (id))
COLLATE 'utf8mb4_0900_ai_ci';





-- Create 2018 tables -------------------------------------------------------------------------------
-- Create ceo_bio_2018 table
Drop table if exists `ceo_bio_2018`;
CREATE table ceo_bio_2018(
id int(255) not null,
ceo varchar(255),
company_rank int(255) not null,
Born varchar(500),
Nationality varchar(255),
Education varchar(10000),
BoY varchar(50),
`year` int(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';

 -- Create fg500_ceo_2018 table
Drop table if exists `fg500_ceo_2018`;
CREATE table fg500_ceo_2018(
id int(255) not null,
CEO varchar(255) ,
Sector varchar(255), 
Industry varchar(255),
`HQ Location` varchar(255),
Website varchar(255),
`Years on Global 500 List` varchar(100),
Employees varchar(255),
company varchar(255),
`year` int(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';



-- Create financial_values_2018 tables
Drop table if exists `financial_values_2018`;
CREATE table financial_values_2018(
`id` int(255) not null,
`Revenues_$M` varchar(300),
`Profits_$M` varchar(300),
`Assets_$M` varchar(300),
`Total_Stockholder_Equity_$M` varchar(300),
`Profit_as_%_of_Revenues` varchar(300),
`Profits_as_%_of_Assets` varchar(300),
`Profits_as_%_of_Stockholder_Equity` varchar(300),
`company` varchar(255),
`year` int(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';


 -- Create fg500_company_2018 table 
Drop table if exists `fg500_company_2018`;
CREATE table fg500_company_2018(
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
`year` int(255),
PRIMARY KEY (id))
COLLATE 'utf8mb4_0900_ai_ci';



-- Create 2017 tables -------------------------------------------------------------------------------
-- Create ceo_bio_2017 table
Drop table if exists `ceo_bio_2017`;
CREATE table ceo_bio_2017(
id int(255) not null,
ceo varchar(255),
company_rank int(255) not null,
Born varchar(500),
Nationality varchar(255),
Education varchar(10000),
BoY varchar(50),
`year` int(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';

 -- Create fg500_ceo_2017 table
Drop table if exists `fg500_ceo_2017`;
CREATE table fg500_ceo_2017(
id int(255) not null,
CEO varchar(255) ,
Sector varchar(255), 
Industry varchar(255),
`HQ Location` varchar(255),
Website varchar(255),
`Years on Global 500 List` varchar(100),
Employees varchar(255),
company varchar(255),
`year` int(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';


-- Create financial_values_2017 tables
Drop table if exists `financial_values_2017`;
CREATE table financial_values_2017(
`id` int(255) not null,
`Revenues_$M` varchar(300),
`Profits_$M` varchar(300),
`Assets_$M` varchar(300),
`Total_Stockholder_Equity_$M` varchar(300),
`Profit_as_%_of_Revenues` varchar(300),
`Profits_as_%_of_Assets` varchar(300),
`Profits_as_%_of_Stockholder_Equity` varchar(300),
`company` varchar(255),
`year` int(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';


 -- Create fg500_company_2017 table 
Drop table if exists `fg500_company_2017`;
CREATE table fg500_company_2017(
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
`year` int(255),
PRIMARY KEY (id))
COLLATE 'utf8mb4_0900_ai_ci';



-- Create 2016 tables -------------------------------------------------------------------------------
-- Create ceo_bio_2016 table
Drop table if exists `ceo_bio_2016`;
CREATE table ceo_bio_2016(
id int(255) not null,
ceo varchar(255),
company_rank int(255) not null,
Born varchar(500),
Nationality varchar(255),
Education varchar(10000),
BoY varchar(50),
`year` int(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';

 -- Create fg500_ceo_2016 table
Drop table if exists `fg500_ceo_2016`;
CREATE table fg500_ceo_2016(
id int(255) not null,
CEO varchar(255) ,
Sector varchar(255), 
Industry varchar(255),
`HQ Location` varchar(255),
Employees varchar(255),
Website varchar(255),
`Years on Global 500 List` varchar(100),
company varchar(255),
`year` int(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';


-- Create financial_values_2016 tables
Drop table if exists `financial_values_2016`;
CREATE table financial_values_2016(
`id` int(255) not null,
`Revenues_$M` varchar(300),
`Profits_$M` varchar(300),
`Assets_$M` varchar(300),
`Total_Stockholder_Equity_$M` varchar(300),
`Profit_as_%_of_Revenues` varchar(300),
`Profits_as_%_of_Assets` varchar(300),
`Profits_as_%_of_Stockholder_Equity` varchar(300),
`company` varchar(255),
`year` int(255),
PRIMARY KEY (`id`))
COLLATE 'utf8mb4_0900_ai_ci';


 -- Create fg500_company_2016 table 
Drop table if exists `fg500_company_2016`;
CREATE table fg500_company_2016(
id int(255) not null,
`rank` varchar(255),
`company` varchar(255),
`employees` varchar(300),
`revenue % change` varchar(300),
`profits($M)` varchar(300),
`profits % change` varchar(300),
`assets($M)` varchar(300),
`year` int(255),
PRIMARY KEY (id))
COLLATE 'utf8mb4_0900_ai_ci';




 -- Create globe_leadership table
Drop table if exists `globe_leadership`;
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
Drop table if exists `globe_societal_culture`;
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


 
-- import data into 2019 tables -------------------------------------------------------------
-- Import data into ceo_bio_2019 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CEOs_info_2019_v1(Apr_25_2020).csv' 
INTO TABLE ceo_bio_2019 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Import data into fg500_ceo_2019 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fg500_CEOs_2019_All(Apr_25_2020).csv' 
INTO TABLE fg500_ceo_2019 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into fg500_company_2019 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fg500_2019_20200219001549.csv' 
INTO TABLE fg500_company_2019
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into financial_values_2019 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/key_financials_and_profit_ratio_all_2019_v1.csv' 
INTO TABLE financial_values_2019
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




-- import data into 2018 tables -------------------------------------------------------------
-- Import data into ceo_bio_2018 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CEOs_info_2018_v1(Apr_25_2020).csv' 
INTO TABLE ceo_bio_2018 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into fg500_ceo_2018 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fg500_CEOs_2018_v2(Apr_25_2020).csv' 
INTO TABLE fg500_ceo_2018 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into fg500_company_2018 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fg500_2018_20200414014002.csv' 
INTO TABLE fg500_company_2018
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into financial_values_2018 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/key_financials_and_profit_ratio_all_2018_v1.csv' 
INTO TABLE financial_values_2018
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




-- import data into 2017 tables -------------------------------------------------------------
-- Import data into ceo_bio_2017 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CEOs_info_2017_v1(Apr_25_2020).csv' 
INTO TABLE ceo_bio_2017 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into fg500_ceo_2017 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fg500_CEOs_2017_v1(Apr_25_2020).csv' 
INTO TABLE fg500_ceo_2017 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into fg500_company_2017 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fg500_2017_20200414020411.csv' 
INTO TABLE fg500_company_2017
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into financial_values_2017 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/key_financials_and_profit_ratio_all_2017_v1.csv' 
INTO TABLE financial_values_2017
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




-- import data into 2016 tables -------------------------------------------------------------
-- Import data into ceo_bio_2016 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CEOs_info_2016_v1(Apr_25_2020).csv' 
INTO TABLE ceo_bio_2016 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into fg500_ceo_2016 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fg500_CEOs_2016_v2(May_3_2020).csv' 
INTO TABLE fg500_ceo_2016 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into fg500_company_2016 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fg500_2016_20200414023501.csv' 
INTO TABLE fg500_company_2016
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Import data into financial_values_2016 table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/key_financials_and_profit_ratio_all_2016_v1.csv' 
INTO TABLE financial_values_2016
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;






-- Import data into globe_leadership table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/GLOBE_Phase_2_Aggregated_Leadership_v2.csv' 
INTO TABLE globe_leadership
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Import data into globe_societal_culture table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/GLOBE_Phase_2_Aggregated_Societal_Culture_v2.csv' 
INTO TABLE globe_societal_culture
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Import data into hofstede table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hofstede_6D_v3(Apr_18_2020).csv' 
INTO TABLE hofstede
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



 -- Add auto_increment primary key column to hofstede table
 
 Alter table hofstede
 add column hofstede_id int not null auto_increment Primary Key;
