# Final_Project
Module 21, UNC-CH Data Analytics Bootcamp, Spring 2023

### Status Update: 5/25/2023
Team 3 has updated this file to submit for Module 21, Segment 3.


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
### Objectives
- Can an ML model use CO2 emissions data broken down by economic sector to predict and classify the wealth per capita of a country. 
### Method
- Three different classification models were run on our data. We used SkiKitLearn's DecisionTreeClassifier, EasyEnsembleClassifier, and RandomForestClassifier algorithms. 
- The dataset was reduced to just the CO2 emissions columns, net electricity generation, total population, country name and year. The CO2 emissions due to Fugitive Emissions (any GHG leaking from a pipeline or train car, etc.) was omitted due to significantly more nulls in this metric. 
- This reduced dataset was merged with a classification dataset also retrieved from the World Bank data repository. This classifcationm dataset labels countries according to three possible income levels (High, Upper Middle, Lower Middle, and Low). The merge was performed in Pandas using pd.merge and the tables were joined on both the year and country_name columns. Once complete, now all of the rows of emissions data was labelled with an income classification. 
- country_name and year were dropped, the income_group column was encoded with the values {'H': 0, 'UM': 1, 'LM: 2, 'L': 3}. 
- The data was then assigned with X containing all of the features and y containing the target 'income_group' column. The features dataset X was then scaled, and finally the X_scaled set and y set were split into training and testing sets along a 75-25 split.
- The three models were then trained on the labelled training data. Once trained, the models were used to predict the income group labels of the remaining test features.
- A confusion matrix and classification report was generated for each model. Additionally, for both the decision tree and random forest classifiers, a features importance plot was generated to discern which features were most correlated with income group.
- Finally, each model was then tuned using the Grid Search Cross Validation method to find optimal parameters. These optimal parameters were then fed back into a new instance of the model and the results compared to the original.

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
    
 ![EDR_6Tables](https://github.com/mcscrag/Final_Project/assets/120151872/517ec6e4-4f13-4dd2-8c92-f15b8debb888)

Database tables
   
  
   ![tables](/sql/tables.png)
    
## Conection AWS
To set up our Postgres database we will use AWS's relational database service (RDS) to make sure our data is available everywhere.

![AWS_database_finalproject](https://github.com/mcscrag/Final_Project/assets/120151872/741c1289-e740-46ba-872f-7b04c87c3552)

After creating our database in AWS, we connected it to a Pgadmin local installation.

![Postgres_AWS_connection](https://github.com/mcscrag/Final_Project/assets/120151872/bd839dc1-0423-4ce2-b887-bbaf0584f8e6)


# Analysis Results

## Summary
...placeholder for forthcoming final analysis results []

## Machine Learning
Three machine learning models were trained and tested on the dataset.

### Confusion Matrices and Classification Reports

#### Decision Tree

![decision_tree](/sql/decision_tree.png)

#### Easy Ensemble

![easy_ensemble](/sql/easy_ensemble.png)

#### Random Forest

![random_forest](/sql/random_forest.png)

#### Conclusions

- The random forest classification model gave the highest accuracy score, closely followed by the decision tree classifier. The Ensemble classifier performed far more poorly.

### Feature Importance Analysis
SciKitLearn's decision tree model and random forest model both have the functionality to provide information about which features contributed the most to the output.

#### Decision Tree

![feature_importance](/sql/tree_importance.png)

#### Random Forest

![feature_importance](/sql/forest_importance.png)

#### Conclusions

- For both models the Total Population of a country was the most correlated to it's economic classification. 
- The most important emissions by economic sector were transportation and Land-Use-Change. This correlates well with the following data visualizations that show a large difference between High Income countries and Low Income countries in these two sectors. 
- Population being included in the model may be too important and contributing to overfitting.

### Model Tuning and Grid Search Cross Validation
Focusing primarily on the Random Forest model since it performs the best, we employed grid search cross validation to find the most optimal parameters.

#### Random Forest

Original Parameters:
- Criterion: Gini (default)
- Max Depth: None (default)
- Max Features: sqrt (default)
- n_estimators: 128

Validated the following parameters:
- Criterion: Entropy, Gini
- Max Depth: 4, 5, 6, 7, 8
- Max Features: sqrt, log2
- n_estimators: 100, 200, 300, 400, 500 
    
Best Parameters: 
- Criterion: Entropy
- Max Depth: 8
- Max Features: sqrt
- n_estimators: 400

Running the model again with optimized parameters yielded an accuracy score of 92% and the following confusion matrix:

![tree_tuning](/sql/forest_tuning.png)

#### Conclusions

- The tuning actually lead to a slightly less accurate result.
- It's possible that the Max_depth parameter is too impactful to leave on default as we did with the original model. Our grid search actually doesn't include a none value for max_depth, which is the default setting used in the original run of the model.
- In the future we could explore how much leaving max_depth at none contributes to overfitting, and if we actually overfit the data and our optimized parameters are a better fit for real data.

## Visualizations 

https://public.tableau.com/views/Group3_ClimateChangeAnalysis/Dashboard1?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link

### C02 Emmisions by Country (Mt CO2eq) 
The map below shows the average of C02 emissions generated by different sectors during a period of years. This is a dashboard-viz switching  , so the user choose the period of time and metrics and results are displayed in the map. To complement this visualization a bar graphic will show the top 10 countries by metric.

![image](https://github.com/mcscrag/Final_Project/assets/120151872/9a3ca170-4895-44b2-8aed-fb8bf54060c9)

![image](https://github.com/mcscrag/Final_Project/assets/120151872/ca6409d3-a693-48ea-8cc9-f346e46f6b4e)


### C02 Emmisions by Income Level (Mt CO2eq) 

To narrow our analysis we group the countries by income level and evaluate the top 5 C02 emissions.
![image](https://github.com/mcscrag/Final_Project/assets/120151872/15d6cf27-50c3-4cee-9f9c-8382e70a399c)

### Land Used
Since land used has 25% of impact in gas emmisions, we create a visualization that shows the average percentaje by income level country.

![image](https://github.com/mcscrag/Final_Project/assets/120151872/a0c7819c-f34f-42fd-8f56-fc811386441e)



### Transportation Sector Emissions by Income Group Comparison - 1990 and 2018
This bar chart illustrates the difference in C02 emissions generated by the transportation sector of Low, Low Middle, Upper Middle, and High income countries between 1990 and the most current accurate data from 2018. 

![TranspoMap19902018](https://github.com/mcscrag/Final_Project/blob/master/sql/TranspoMap19902018.png)

### Transportation Sector Emissions by Income Group over Time
This line graph illustrates the trends for C02 emissions generated by the transportation sector of Low, Low Middle, Upper Middle, and High income countries over the period from 1990-2018.
- Note the spike in emissions by Upper Middle income countries in 2010 at the same time that a corresponding dip by Lower Middle income countries. This mirroring might indicate that many countries transitioned from being classified as Lower Middle to Upper Middle at this time due to world economic factors, which means actual total emissions likely remained marginally unchanged during that period.  

![TranspoLine](https://github.com/mcscrag/Final_Project/blob/master/sql/TranspoLine.png)

### Fuel Type Consumption by Income Group over Time
This line graph illustrates how consumption of each fuel type changed with time by Low, Low Middle, Upper Middle, and High income countries over the period from 1990-2018. 
- Note the spike in coal consumption by Lower Middle income countries from the period between 2009-2013 (immediately following a global recession).
- Note the high oil consumtion of High income countries throughout the last 23 years, averaging 60x more consumption of oil than Low income countries, and spiking between 1999-2008.

![FuelConsumption](https://github.com/mcscrag/Final_Project/blob/master/sql/FuelConsumption.png)

...placeholder for additional Tableau visualizations []

## Visualization Conclusions

- Energy and Land Use are the sources of CO2 emmisions in low income countries.
- China and USA lead 75% of CO2 emmissions by sector.
- Brazil and Indonesia have the highest C02 emmisions by Land Used.
- Upper middle income class has the highest C02 emmissions by Energy during 2003-2016.

# Project Presentation
[Final Presentation to Shareholders](https://docs.google.com/presentation/d/1ELYkyjRaMqS_IwX6mNWionJlfgnhnTLRV3eLk56WCu0/edit?usp=sharing "Final Presentation to Shareholders")
