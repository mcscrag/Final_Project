# Final_Project
Module 21, UNC-CH Data Analytics Bootcamp, Spring 2023

## Status Update: 5/16/2023
Team 3 has decided to explore climate data from around the world, including factors that may contribute to climate change such as (by country) greenhouse gas emissions, agricultural and arable land, energy consumption (gas, oil, or coal), GDP, average temperature, and total population. 


# Team:

## Team Roles and Responsibilities: 
- Brendan McGee - scrum master, analysis, visualizations
- Maria Cedillo - data exploration, ERD, database, vizualizations
- Logan Krueger - database, vizualizations, recorder

## Collaboration Tools: 
- Slack
- Github: https://github.com/mcscrag/Final_Project
- Google Slides

## Communication Protocol: 
- Main communication channel: Slack
- Meet at 6:30pm in class Zoom room 3 on class days for duration of project
- Meet Wednesday nights via Zoom at 7pm when required
- Update the team via Slack channel when individual tasks/milestones are completed or information is needed to progress
- SMS text when necessary or time-sensitive


# Objective

## Business Objective:
Developing countries attempting to greenify their emerging economies want to understand which economic sectors to focus on that will yield the most value - impact for their inputs and expenses. This is informed by understaning which sectors of the economy will be contributing most to emmissions in in the near future (10-20 years). 

## Primary Questions:
- Using historical emissions, economic, and climate data, can we predict which sectors of developing countries' economies are the most impactful? 
- Are certain emmissions by business sector an indicator of "fingerprint" for a country's economic size or development?  
- How does GDP per person (i.e. wealth of a country) affect its total emissions, and emissions by sector?
- How do a country's emmissions sectors develop over time relative to each other?
- How has china vs the US changed over the last 13 years, in emissions and temperature? 


# Method:

## Machine Learning Model: Classification
- Is the breakdown of emmissions by sector a predictor for economic status (i.e. high, upper middle, lower middle, low)

- Alternatively, is the percent of land used for agriculture or forest, or percent of urban population, predictors of economic status (e.g. GDP per capita)

## Planned Visualizations:
- Interactive Tableu map, selectable by year, economic sector, etc. 
- Graph of emissions by business sector for certain countries or regions
- Time series line graph, time on X, emissions on Y, by region
- Bar graph Which sectors are producing the most emissions
- Change in land use over time, change in urbanization over time

## Data Sources: 
- Climate Data 2010-2023 (Taken from the World Bank's Country Climate and Development Report (CCDR))
    https://databank.worldbank.org/source/country-climate-and-development-report-(ccdr)
    filename: "final_draft_dataset.csv"
    - CCDR Documentation: https://www.worldbank.org/en/publication/country-climate-development-reports
    - Explanation of the Mt CO2e unit of measurement: https://www.epa.gov/sites/default/files/2014-12/documents/ghgcalculatorhelp.pdf

- Temperature Data 1990-2022
    https://www.fao.org/faostat/en/#data/ET
    filename: "FAO_temperature_data_2010-2022.csv"
    - Description of data:
      "Temperature change on land
    The FAOSTAT Temperature change on land domain disseminates statistics of mean surface temperature change by country, with annual updates. The current dissemination covers the period 1961–2022. Statistics are available for monthly, seasonal and annual mean temperature anomalies, i.e., temperature change with respect to a baseline climatology, corresponding to the period 1951–1980. The standard deviation of the temperature change of the baseline methodology is also available. Data are based on the publicly available GISTEMP data, the Global Surface Temperature Change data distributed by the National Aeronautics and Space Administration Goddard Institute for Space Studies (NASA-GISS)

- Country Classification by Economic Status 
    https://datahelpdesk.worldbank.org/knowledgebase/articles/906519-world-bank-country-and-lending-groups
    filename: "economic_status.csv"

## Database Tables
ERD for database construction
    ![ERD](/sql/ERD.png)

## Presentation
Google Slides
