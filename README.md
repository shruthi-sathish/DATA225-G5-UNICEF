# DATA225-G5-UNICEF
DATA 225 Course Project by Study Group 5. Ananlysis on UNICEF Data.

# BACKGROUND
Historically, statistical data that can be compared over time and across countries and regions have been collected for surveys. These surveys focus on the benefit of the population that does not have access to required resources. Often surveys consider many aspects that affect child education such as economy, health, wellbeing, nutrition to name a few. To help with these analyses, there is a need to collect large and standard data that also include child groups that are often not accounted for such as children who are displaced due to natural disasters. With the advancement of technology to capture and analyze data on a large scale, we can use this opportunity to identify the disparities and deploy the resources efficiently to positively impact the efforts of various organizations, governments, people in research, and people who donate to these causes/developments. 

# DATA DESCRIPTION
Raw data is exctracted from UNICEF Data Warehouse for various indicators affecting child education in different countries spanning the time period of 2010 to 2020.
This data has been transformed to fit into a Fact constellation data model. This data model is implemented in PostgreSQL and the data dump can be used to perform analysis on the transformed data

# FILES IN THE REPOSITORY
1. SQL Script/UNICEF_DDL.SQL 
  a. Contains the SQL script to add/drop tables, materialized views 
  b. Insert statements for Source, Year and Indicator dimension tables in the PostgreSQL database. 
2. Data to populate tables/Death_And_WASH_FactTable_Data.csv,Education_FactTable_Data.csv,ICT_Skillset_FactTable_Data.csv,Location_Dimension.csv - CSV files to populate the tables created    using UNICEF_DDL.SQL or UNICEF_DDL_And_ExtractCSV.ipynb
3. PythonCode/UNICEF_DDL_And_ExtractCSV.ipynb - 
  a. Python script to alternatively create the tables, materialized views and insert into Source, Year and Indicator dimension tables.
  b. Python script to generate data dump by joining the fact and dimension tables and export it to CSV. This can be used in Tablue to analyze and create data            visualizations
4. PythonCode/Indicator_Dimension.csv,Year_Dimension.csv,Sourc_Dimension.csv - Data required to populate the Source, Year and Indicator dimension tables through 
   UNICEF_DDL_And_ExtractCSV.ipynb
5. Data Dump for Tableau/Death_And_WASH.csv,Education_Facts.csv,ICT_Skillset.csv - Data dump from joining the data in fact and dimension tables. This can be directly used in Tableau for
   analysis
6. SQL Script/UNICEF_Queries.SQL - Contains queries to perform Rollup, CUBE, Join queries to help analyze the data
