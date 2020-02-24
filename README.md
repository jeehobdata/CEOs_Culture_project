# CEOs_Culture_project

Capstone Project

1. Topic
  1.1. How do the national background of CEOs affect the companies’ market capitalization? Is there any correlation between cultural background and certain industries?

2. Assumption
  2.1. The behaviors of the CEOs are affected by the national cultural background
  2.2. The Cultural background of CEOs has impact on the companies’ market capitalizations.
  2.3. The characteristics of CEOs can be categorized by cultural background.
  2.4. Cultural characteristics

3. Factors
  3.1. List of Companies
  3.2. The CEOs’ Nationalities
  3.3. National Characteristics (Hofstede’s cultural 6 dimensions)
  3.4. Market Capitalization

4. Dataset
  4.1. Companies / CEOs (Including Nationalities)
    4.1.1. ] Fortune Global 500 (Companies) (https://fortune.com/global500/2019/search/)
  4.2. Cultural Characteristics
    4.2.1. Hofstede’s cultural 6 dimensions (https://www.hofstede-insights.com/product/compare-countries/)
  4.3. The Market Capitalization
  4.4. Data Source
    4.4.1 Companies / CEO lists: Fortune Global 500
    4.4.2 CEOs’ nationalities: Wikipedia
    4.4.3 National Characteristics: Hofstede-Insights
    4.4.4 The companies: To be determined

5. Deliverable
  5.1. Linear Regression Model (using DataRobot)
  5.2. Data Visualization (AWS SageMaker or Tableau)
    5.2.1. Dashboard
      5.2.1.1. Time series analysis: Market Capitalization
      5.2.1.2. CEO Classification by culture
      5.2.1.3. Global company map (Including Industry)
      5.2.1.4. KPI index

6. Tasks
  6.1. Get the datasets
    6.1.1. Scrap data from the web pages
      6.1.1.1. Companies: Fortune Global 500
      6.1.1.2. CEOs’ nationalities: Wikipedia
      6.1.1.3. National Characteristics: hofstede-insights
      6.1.1.4. Market Capitalization: TBD
  6.2. AWS
    6.2.1. Upload to AWS S3 bucket
      6.2.1.1. Use AWS Lambda functions
    6.2.2. Connect to AWS RDS / Mysql Instance
  6.3. Create database (MySQL)
    6.3.1. Staging database schema
    6.3.2. Data Warehouse Schema
      6.3.2.1. Clean the datasets
      6.3.2.2. Store procedures
  6.4. Auto ML
    6.4.1. Use Python for feature engineering
    6.4.2. Connect to the DataRobot
    6.4.3. Run Supervised Machine Learning
      6.4.3.1. Relationship between Market Cap and hofstede’s 6 dimensions
  6.5. Create Visualization
    6.5.1. Connect to Tableau or AWS SageMaker
    6.5.2. Build a dashboard
