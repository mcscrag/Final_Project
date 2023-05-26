# Final_Project
Module 21, UNC-CH Data Analytics Bootcamp, Spring 2023

## Status Update: 5/25/2023
Team 3 has decided to explore climate data from around the world, including to learn how certain total population and greenhouse gas emissions by economic sector contribute to and . 


# Team

## Team Roles and Responsibilities: 
- Brendan McGee - scrum master, data exploration & analysis, machine learning models, visualizations
- Maria Cedillo - data exploration & analysis, ERD & PostGres database, AWS, vizualizations
- Logan Krueger - data exploration & analysis, vizualizations, recorder

## Collaboration Tools: 
- Slack
- Github: https://github.com/mcscrag/Final_Project
- Google Slides

## Communication Protocol: 
- Main communication channel: Slack
- Meet at 6:30pm in class Zoom room 3 on class days for duration of project
- Meet Monday and Wednesday nights via Zoom at 7pm as required
- Update the team via Slack channel when individual tasks/milestones are completed or information is needed to progress
- SMS text when necessary or time-sensitive


# Project
Greenification by Country

## Business Objective:
Emerging economies want to understand which economic sectors to focus on that will yield the most value - impact for their inputs and expenses. 
This is informed by understanding which sectors of the economy will be contributing most to emissions in in the near future (10-20 years) using historical data. 

## Primary Questions:
- Using historical emissions, economic, and climate data, can we predict which sectors of developing countries' economies are the most impactful? 
- Are certain emmissions by business sector an indicator of "fingerprint" for a country's economic size or development?  
- How does GDP per person (i.e. wealth of a country) affect its total emissions, and emissions by sector?
- How do a country's emmissions sectors develop over time relative to each other?
- How has china vs the US changed over the last 23 years, in emissions, GDP, population, and other contributing factors? 


# Method

## Machine Learning Model: Classification
- Brendan update ML strategy (go to "Analysis Results" section below to add results)

## Planned Visualizations:
- Interactive Tableu map, selectable by year, economic sector, etc. 
- Graph of emissions by business sector for certain countries or regions
- Time series line graph, time on X, emissions on Y, by region
- Bar graph Which sectors are producing the most emissions
- Change in land use over time, change in urbanization over time

## Data Sources: 
- Historical Climate Data 1990-2023 (Taken from the World Bank's Country Climate and Development Report (CCDR))
    https://databank.worldbank.org/source/country-climate-and-development-report-(ccdr)
    filename: "final_draft_dataset_3.csv"
    - CCDR Documentation: https://www.worldbank.org/en/publication/country-climate-development-reports
    - Explanation of the Mt CO2e unit of measurement: https://www.epa.gov/sites/default/files/2014-12/documents/ghgcalculatorhelp.pdf

- Temperature Data 1990-2022
    https://www.fao.org/faostat/en/#data/ET
    filename: "FAO_temperature_data_2010-2022.csv"
    - Description of data:
      The FAOSTAT Temperature change on land domain disseminates statistics of mean surface temperature change by country, with annual updates. The current dissemination covers the period 1961–2022. Statistics are available for monthly, seasonal and annual mean temperature anomalies, i.e., temperature change with respect to a baseline climatology, corresponding to the period 1951–1980. The standard deviation of the temperature change of the baseline methodology is also available. Data are based on the publicly available GISTEMP data, the Global Surface Temperature Change data distributed by the National Aeronautics and Space Administration Goddard Institute for Space Studies (NASA-GISS)

- Historical Country Classification by Income    
    https://datahelpdesk.worldbank.org/knowledgebase/articles/906519-world-bank-country-and-lending-groups
    filename: "income_classifiers_by_year.csv"
    filename: "country_income_levels.csv"
    - Description of data: 
      Countries are classified as "Low", "Lower Middle", "Upper Middle", or "High" every year since 1990 using an adjusted scale each year that is calculated using the World Bank Atlas method.
    

## Database Tables:
The database consists of three PostgreSQL tables that are hosted in AWS:
- Countries: Name of 218 countries and corresponding 3 letter country code
- Economics: Countries grouped by region and income group by year
- Metrics: Several metrics related with our project for 1990-2022 by country and by country
 
ERD for database construction
    ![ERD](/sql/ERD.png)
    
Database tables
   ![tables](/sql/tables.png)
    
## Conection AWS

To set up our Postgres database we will use  AWS's relational database service (RDS) to make sure our data is available everywhere.

![AWS_database_finalproject](https://github.com/mcscrag/Final_Project/assets/120151872/741c1289-e740-46ba-872f-7b04c87c3552)

After create our database in AWS, we connected it to Pgadmin local installation.

![Postgres_AWS_connection](https://github.com/mcscrag/Final_Project/assets/120151872/bd839dc1-0423-4ce2-b887-bbaf0584f8e6)


# Analysis Results

## Visualizations 

### C02 Emmisions by Transportation (Mt CO2eq) 

The map below shows the average of C02 Emmisions generated by Transportation during a period of years. This is one of the 3 maps that will be using to create a dashboard-viz switching  , so the user can choose between 3 metrics and see changes in the map.

![Map1](https://github.com/mcscrag/Final_Project/assets/120151872/9387602f-4921-4c39-9fa2-dd4953060de7)


...forthcoming link to Tableau dashboard []

## Project Presentation
Final Presentation to Shareholders: https://docs.google.com/presentation/d/1ELYkyjRaMqS_IwX6mNWionJlfgnhnTLRV3eLk56WCu0/edit?usp=sharing [Segment 2 Presentation](https://docs.google.com/presentation/d/1ELYkyjRaMqS_IwX6mNWionJlfgnhnTLRV3eLk56WCu0/edit?usp=sharing "Final Presentation to Shareholders")
