# Final_Project
Module 21, UNC-CH Data Analytics Bootcamp, Spring 2023

### Status Update: 6/1/2023
Team 3 has updated this file for submission to the final Module 21 segment


# Team

## Team Roles and Responsibilities: 
- Brendan McGee - scrum master, data exploration & analysis, machine learning models, visualizations
- Maria Cedillo - data exploration & analysis, ERD & PostGres database, AWS, vizualizations
- Logan Krueger - data exploration & analysis, vizualizations, recorder

## Collaboration Tools: 
- Slack
- Github: https://github.com/mcscrag/Final_Project
- Google Slides [Final Presentation to Shareholders](https://docs.google.com/presentation/d/1ELYkyjRaMqS_IwX6mNWionJlfgnhnTLRV3eLk56WCu0/edit?usp=sharing "Final Presentation to Shareholders")
- Tableau Public: see link to interactive visualization dashboards in "Results, Visualizations"

## Communication Protocol: 
- Main communication channel: Slack
- Meet at 6:30pm in class Zoom room 3 on class days for duration of project
- Meet Monday and Wednesday nights via Zoom at 7pm as required
- Update the team via Slack channel when individual tasks/milestones are completed or information is needed to progress
- SMS text when necessary or time-sensitive


# Project
## The World Bank Climate Change Initiative: Greenification of Emerging Economies

The World Bank has two goals: end extreme poverty and promote shared prosperity in a sustainable way. 
Specifically, through their Climate Change Initiative: they are working to understand sustainable solutions that build shared prosperity in developing countries!
From the [World Bank Climate Initiative Website](https://openknowledge.worldbank.org/entities/publication/ee8a5cd7-ed72-542d-918b-d72e07f96c79) “Climate change, poverty, and inequality are the defining issues of our age. The World Bank Group is the biggest multilateral funder of climate investments in developing countries. And we intend to go further in helping countries reduce poverty and rise to the challenges of climate change.”

## Business Objective:
Emerging economies want to understand which economic sectors to focus on that will yield the most value - impact for their inputs and expenses. This is informed by understanding which sectors of the economy will be contributing most to emissions in in the near future (10-20 years) using historical data. Given a certain amount of money slated for climate investment in low-income countries, Group 3 will attempt to determine which economic sector or sectors would provide the most impact on reducing CO2 emissions without interfering with a country's economic development - providing a "low-carbon transition to growth".

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

## Data Sources: 
- Historical Climate Data 1990-2023 (Taken from the World Bank's Country Climate and Development Report (CCDR))
    https://databank.worldbank.org/source/country-climate-and-development-report-(ccdr)
    filename: "final_draft_dataset_3.csv"
    - CCDR Documentation: https://www.worldbank.org/en/publication/country-climate-development-reports
    - Explanation of the Mt CO2e unit of measurement: https://www.epa.gov/sites/default/files/2014-12/documents/ghgcalculatorhelp.pdf

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

## Visualizations: 

### Interactive Tableau Visualizations
- Interactive Tableu map, selectable by year, economic sector, etc. 
- Graph of emissions by business sector for certain countries or regions
- Time series line graph, time on X, emissions on Y, by region
- Bar graph Which sectors are producing the most emissions
- Change in land use over time, change in urbanization over time

[Link to Interactive Dashboard 1: Land Use and Emissions by Country](https://public.tableau.com/views/Group3_ClimateChangeAnalysis/Dashboard1?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)
- Interactive bar chart of top emissions by income group, with selectable year range
- Ineractive map of emissions quantities by country, with selectable year range
- Interactive donut charts depicting percentage of land use by income group, with selectable year range

[Link to Interactive Dashboard 2: Emissions by Income Group](https://public.tableau.com/views/Group3_Final_Project/EmissionsbyIncomeGroup_1?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)
- Interactive map displays countries by income level for the most recent date available
- Time series line charts depict emissions by economic sector for high and low income counties
    - Note energy sector contributions to emissions has been declining since ~2005 for high income countries, while the other sectors' contributions remain steady
    - Note land use change and energy are the largest contributing sectors to emissions for low income countries, and have been increasing since ~2000


[Link to Interactive Dashboard 3: Emissions & Consumption by GDP, Urbanization](https://public.tableau.com/views/Group3_Final_Project/EmissionsConsumption?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)
- Time series area chart depicting daily consumption per capita of the 3 energy inputs - coal, gas, and oil - separated by income group
    - Note increasing use of gas by high income countries over other forms of energy, and increased use of coal by high upper middle and lower middle countries
    - Note transportation subsector emissions have been declining in high income countries since ~2005, while upper middle emissions have been steadily increasing in that sime timeframe
-  Butterfly chart depicts growth in total greenhouse gas emissions by country for low-income countries, sorted in descending order, next to GDP growth
    - Note the lack of correlation between total emissions growth and GDP growth - GDP growth therefore cannot be used as a predictor of a change in total emissions
-  Pie chart depicts urbanization (the percent of the population of a given country that is urban versus rural) by income group for any given selectable year (1990-present)
-  Interactive map depicts GDP growth by selectable year

### C02 Emmisions by Country (Mt CO2eq) 
The map below shows the average of C02 emissions generated by different sectors during a period of years. This is a dashboard-viz switching, so the user choose the period of time and metrics and results are displayed in the map. To complement this visualization a bar graphic will show the top 10 countries by metric.

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

## Visualization Conclusions:
- Energy and Land Use are the major sources of CO2 emmisions in low income countries.
-   Energy sector includes subsectors transportation, manufacturing, building/construction.
- China and USA lead 75% of CO2 emmissions by sector.
- Brazil and Indonesia have the highest C02 emmisions by Land Use.
- Upper middle income class has the highest C02 emmissions by Energy sector from 2003 to present.

## Further analysis opportunities:
Expand analysis to look at other greenhouse gases such as methane or nitrous oxide
Incorporate agricultural emissions 
Look for correlations between types of fuels consumed and income group.


# Final Project Presentation
[Final Presentation to Shareholders](https://docs.google.com/presentation/d/1ELYkyjRaMqS_IwX6mNWionJlfgnhnTLRV3eLk56WCu0/edit?usp=sharing "Final Presentation to Shareholders")
