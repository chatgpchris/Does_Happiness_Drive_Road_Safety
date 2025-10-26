DROP DATABASE IF EXISTS transport_accidents_mortality;
CREATE DATABASE transport_accidents_mortality;
USE transport_accidents_mortality;

/*
Download the overview section of the Annual Statistical Report 2025 [Data set]. (2025, March 14) 
by the European Road Safety Observatory (European Commission, Directorate-General for Mobility and Transport), 
available at European Commission's website: 
https://road-safety.transport.ec.europa.eu/european-road-safety-observatory/data-and-analysis/annual-statistical-report_en  (Last accessed and dataset downloaded on the 19th of August, 2025).
Save it in CVS and import in in MySQL with Table Wizard.
*/

/*
Download the World Happiness Report 2025 "Data For Figure 2.1" 
Helliwell, J. F., Layard, R., Sachs, J. D., De Neve, J.-E., Aknin, L. B., & Wang, S. (Eds.). (2025). World Happiness Report 2025. University of Oxford: Wellbeing Research Centre. 
avalaible at https://www.worldhappiness.report/data-sharing/  (Last accessed: 22-10-2025). 
Save it in CSV and import it in MySQL with Table Wizard.

*/

SELECT *
FROM overview;

#check the data time range
SELECT DISTINCT Year
FROM overview
ORDER BY Year; -- so we are focusing on 2013-2023

SELECT *
FROM overview;
SELECT *
FROM happiness;

ALTER TABLE happiness
RENAME COLUMN ï»¿Year TO Year;

#join the 2 tables (overview and happiness)
SELECT o.Year AS overview_year, h.Year as happiness_year, o.Country, o.Fatalities, o.Population_Mio, h.`Life evaluation (3-year average)`, h.`Explained by: Log GDP per capita`
FROM overview o LEFT JOIN happiness h ON o.Country = h.`Country name` AND o.Year = h.Year;  # Some of the 2013-2018 values are missing from happiness, so let's set them aside in the next query

SELECT o.Year AS overview_year, h.Year as happiness_year, o.Country, o.Fatalities, o.Population_Mio, h.`Life evaluation (3-year average)`, h.`Explained by: Log GDP per capita`
FROM overview o LEFT JOIN happiness h ON o.Country = h.`Country name` AND o.Year = h.Year
WHERE o.Year > 2018 AND o.Country NOT IN ('Liechtenstein', 'EU'); # Liechtenstein and EU data were also removed

WITH car_accidents_happiness AS (
SELECT o.Year AS overview_year, h.Year as happiness_year, o.Country, o.Fatalities, o.Population_Mio, h.`Life evaluation (3-year average)`, h.`Explained by: Log GDP per capita`
FROM overview o LEFT JOIN happiness h ON o.Country = h.`Country name` AND o.Year = h.Year
WHERE o.Year = 2023 AND o.Country NOT IN ('Liechtenstein', 'EU')
)
SELECT * 
FROM car_accidents_happiness
ORDER BY car_accidents_happiness.Fatalities; # export this as csv named "CAH" and reimport it with Table Wizard as cah
SELECT * 
FROM cah;

SELECT overview_year AS year, Country AS country, Fatalities AS fatalities, Population_Mio as population_millions, `Life evaluation (3-year average)` AS happiness_score, `Explained by: Log GDP per capita` AS log_gdp
FROM cah; #export this as csv named "cah2" and reimport it with Table Wizard as cah2

SELECT *
FROM cah2;

SELECT year, 
	country, 
    fatalities,
    RANK () OVER (ORDER BY fatalities DESC) AS fatalities_rank,
    population_millions,
    RANK () OVER (ORDER BY population_millions DESC) AS population_rank,
    ROUND((fatalities/population_millions), 2) AS fatalities_per_million,
	RANK () OVER (ORDER BY ROUND((fatalities/population_millions), 2) DESC) AS fatalities_per_million_rank,
    happiness_score,
    RANK () OVER (ORDER BY happiness_score DESC) AS happiness_rank,
    log_gdp,
    RANK () OVER (ORDER BY log_gdp DESC) AS log_gdp_rank
FROM cah2
ORDER BY fatalities_per_million_rank; #export it as csv named "cah3" and reimport it with Table Wizard

SELECT *
from cah3;

# import it at Tableu Public to create the dashboard

