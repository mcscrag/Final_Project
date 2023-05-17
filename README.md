# Final_Project
Module 21, UNC-CH Data Analytics Bootcamp, Spring 2023

## Status: 5/16/2023
Team 3 has decided to explore climate data from around the world, including factors that may contribute to climate change such as (by country) greenhouse gas emissions, agricultural and arable land, energy consumption (gas, oil, or coal), GDP, average temperature, and total population. 

# Research Objective:
- Use historical emissions, economic, and climate data to predict which sectors of a developing countries' economy 
greenify the economy of a country, want to get the most value, know what sectors of the economy will be contributing to emmissions in the next 10-20 years (in the near future).   

## Primary Questions:
- Are certain emmissions by business sector an indicator of "fingerprint" for a country's economic size or development?  
- How does GDP per person (i.e. wealth of a country) affect its total emissions, and emissions by sector?
- How do a country's emmissions sectors develop over time relative to each other?
- How has china vs the US changed over the last 13 years, in emissions and temperature? 

# Machine Learning Model: Classification
- Is the breakdown of emmissions by sector a predictor for economic status (i.e. high, upper middle, lower middle, low)

- Alternatively, is the percent of land used for agriculture or forest, or percent of urban population, predictors of economic status (e.g. GDP per capita)

# Planned Visualizations:
- Interactive Tableu map, selectable by year, economic sector, etc. 
- Graph of emissions by business sector for certain countries or regions
- Time series line graph, time on X, emissions on Y, by region
- Bar graph Which sectors are producing the most emissions
- Change in land use over time, change in urbanization over time

# Data Sources: 
- Climate Data 2010-2023
    https://databank.worldbank.org/source/country-climate-and-development-report-(ccdr)
    filename: "final_draft_dataset.csv"

- Temperature Data 1990-2022
    https://www.fao.org/faostat/en/#data/ET
    filename: "FAO_temperature_data_2010-2022.csv"

        Description of data:
        "Temperature change on land
        The FAOSTAT Temperature change on land domain disseminates statistics of mean surface temperature change by country, with annual updates. The current dissemination covers the period 1961–2022. Statistics are available for monthly, seasonal and annual mean temperature anomalies, i.e., temperature change with respect to a baseline climatology, corresponding to the period 1951–1980. The standard deviation of the temperature change of the baseline methodology is also available. Data are based on the publicly available GISTEMP data, the Global Surface Temperature Change data distributed by the National Aeronautics and Space Administration Goddard Institute for Space Studies (NASA-GISS)."

- Country Classification by Economic Status 
    https://datahelpdesk.worldbank.org/knowledgebase/articles/906519-world-bank-country-and-lending-groups
    filename: "economic_status.csv"

# Database Tables
ERD for database construction
    ![ERD](/ERD.png)

# Team Roles and Responsibilities: 
- Brendan McGee - scrum master, analysis, visualizations
- Maria Cedillo - data exploration, ERD, database, vizualizations
- Logan Krueger - database, vizualizations, recorder