CREATE TABLE "countries" (
    "country_code" varchar,
    "country_name" varchar,
    CONSTRAINT "pk_countries" PRIMARY KEY (
        "country_code"
     )
);

CREATE TABLE "economics" (
    "country_name" varchar,
    "country_code" varchar,
    "region" varchar,
    "income_group" varchar,
    CONSTRAINT "pk_economics" PRIMARY KEY (
        "country_name"
     )
);

CREATE TABLE "temperature" (
    "index" int,
    "country_name" varchar,
    "year" int,
    "delta_temperature" float,
    CONSTRAINT "pk_temperature" PRIMARY KEY (
        "index"
     )
);

CREATE TABLE "metrics" (
    "index" int,
    "country_code" varchar,
    "country_name" varchar,
    "year" int,
    "Total_Population" float,
    "Urban_Population" float,
    "GDP" float,
    "GDP_per_Capita" float,
    "GDP_Growth" float,
    "GHG_Growth" float,
    "GHG_Emissions_per_Capita" float,
    "Agricultural_Land" float,
    "Arable_Land" float,
    "Forested_Land" float,
    "CO2_Emissions_by_Sector_Building" float,
    "CO2_Emissions_by_Sector_Bunker_Fuels" float,
    "CO2_Emissions_by_Sector_Electricity_Heat" float,
    "CO2_Emissions_by_Sector_Energy" float,
    "CO2_Emissions_by_Sector_Fugitive_Emissions" float,
    "CCO2_Emissions_by_Sector_Industrial_Processes" float,
    "CO2_Emissions_by_Sector_Land_Use_Change_and_Forestry" float,
    "CO2_Emissions_by_Sector_Manufacturing_Construction" float,
    "CO2_Emissions_by_Sector_Other_Fuel_Combustion" float,
    "CO2_Emissions_by_Sector_Total_excluding_LUCF" float,
    "CO2_Emissions_by_Sector_Total_Including_LUCF" float,
    "CO2_Emissions_by_Sector_Transportation" float,
    "Net_Electricity_Consumption" float,
    "Daily_Coal_Consumption_per_capita" float,
    "Daily_Gas_Consumption_per_capita" float,
    "Daily_Oil_Consumption_per_capita" float,
    CONSTRAINT "pk_metrics" PRIMARY KEY (
        "index"
     )
);

ALTER TABLE "economics" ADD CONSTRAINT "fk_economics_country_code" FOREIGN KEY("country_code")
REFERENCES "countries" ("country_code");

ALTER TABLE "temperature" ADD CONSTRAINT "fk_temperature_country_name" FOREIGN KEY("country_name")
REFERENCES "economics" ("country_name");

ALTER TABLE "metrics" ADD CONSTRAINT "fk_metrics_country_code" FOREIGN KEY("country_code")
REFERENCES "countries" ("country_code");

select*from  economics;