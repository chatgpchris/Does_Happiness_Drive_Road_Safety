# 🇪🇺 Does Happiness Drive Road Safety?  
### A Data Analytics Exploration of Europe’s Road Safety, Happiness, and Economy in 2023

**Author:** Christos Georgakakis  
**Date:** October 2025  
**Previous Projects:** (i) *What_Gives_You_the_Ring* , (ii) *StoiControl*  
**Tableau Public Visuals:** [Europe’s Road Safety, Happiness and Economy (2023)](https://public.tableau.com/app/profile/christos.georgakakis/viz/EuropesRoadSafetyHappinessandEconomyin2023/Sheet42#2)

---

## 🧭 Project Overview

This project examines whether *happier* and *richer* European countries tend to be *safer on the road*.  
It integrates open datasets on **road fatalities**, **happiness scores**, and **economic indicators** for 2023, combining quantitative SQL analysis and visual analytics through Tableau Public.

---

## 🎯 Research Questions

1. Does a country’s happiness level correlate with road safety?  
2. Does economic prosperity, as captured by log GDP per capita, relate to lower accident rates?  
3. To what extent does happiness mediate the link between wealth and road safety?
4. Key hypotheses: (a) The happier a country is, the safer its citizens are on the road; (b) The more indispensable a country’s economy is for its happiness, the safer its citizens are on the road.

---

## 🧩 Datasets

| Dataset | Source | Description |
|----------|---------|-------------|
| **Transport accidents' mortality in Europe – Overview** | [European Road Safety Observatory – Annual Statistical Report 2025](https://road-safety.transport.ec.europa.eu/european-road-safety-observatory/data-and-analysis/annual-statistical-report_en) | Fatalities and population data for European countries (2013–2023). |
| **World Happiness Report 2025 – Data for Figure 2.1** | [World Happiness Report 2025](https://www.worldhappiness.report/data-sharing/) | Life evaluation (3-year average) and log GDP per capita values for 2023. |

Both datasets were imported into **MySQL** for cleaning, transformation, and merging.

---

## ⚙️ Tools & Methods

- **MySQL** — data import, cleaning, ranking, and joining  
- **Tableau Public** — data visualization and dashboard creation  
- **Google Slides** — results presentation and reporting  
- **CSV/Spreadsheet Tools** — exports and intermediate checks  

---

## 🧮 Analytical Workflow

1. Imported both datasets into MySQL.  
2. Cleaned variable names and removed incomplete or aggregate entries (e.g., EU, Liechtenstein).  
3. Joined datasets on country and year, focusing on **2023**.  
4. Calculated:  
   - `fatalities_per_million = fatalities / population_millions`  
   - Ranking variables for fatalities, happiness, and log GDP.  
5. Exported the processed table (`cah3.csv`) for Tableau analysis.  

SQL steps are documented in [`mysql code.sql`](mysql%20code.sql).

---

## 📊 Key Findings

- **Happier countries tend to have fewer road fatalities** per million inhabitants.  
- **Economic prosperity** (log GDP per capita) positively correlates with happiness and negatively with road fatalities per million of population.    
- **Happiness, road safety, and prosperity** appear interconnected, forming a reinforcing triad.
- For more details see my presentation: [`Does Happiness Drive Road Safety _.pdf`](https://github.com/chatgpchris/Does_Happiness_Drive_Road_Safety/blob/03ae85c4a284b06251ec0aa43f8f2e8443e3003b/Does%20Happiness%20Drive%20Road%20Safety%20_.pdf)** 

---

## 🌍 Visualization

Explore the interactive Tableau dashboard:  
👉 [Europe’s Road Safety, Happiness and Economy (2023)](https://public.tableau.com/app/profile/christos.georgakakis/viz/EuropesRoadSafetyHappinessandEconomyin2023/Sheet42#2)

---

## 📈 Output Dataset

The final dataset (`cah3.csv`) includes:

| Column | Description |
|---------|-------------|
| `year` | Observation year (2023) |
| `country` | European country name |
| `fatalities` | Number of road fatalities |
| `population_millions` | Population in millions |
| `fatalities_per_million` | Normalized fatality rate |
| `happiness_score` | Life evaluation (3-year average) |
| `log_gdp` | Explained happiness component: GDP per capita (log) |
| `*_rank` | Ranks by each metric |

---

## 🔍 Interpretation

- Happiness and road safety are strongly linked.
- Economic prosperity, which is a factor contributing to higher happiness scores, relates to road safety as well.
- Wellbeing may both reflect and reinforce safety.
- In happier and more prosperous countries, citizens enjoy better infrastructure and institutions, and potentially a more widely shared sense of responsibility. These psychological and sociopolitical conditions might ground more cautious driving behavior and lower accident rates. Conversely, lack of life satisfaction, economic pressure, or diminished responsible behavior may increase risk in ordinary decision-making and reduce attentiveness on the road.
- These results indicate correlations, not proof that happiness causes fewer fatalities.
  
---

## 📚 Future Work

- Extend analysis to multiple years to detect longitudinal trends.  
- Add variables on infrastructure, law enforcement, and government investments.  
- Expand to global scope for cross-continental comparison.  
- Integrate psychological and behavioral data for explanatory modeling.

---

## 📦 Repository Structure
📁 DoesHappinessDriveRoadSafety/

├── mysql code.sql # SQL analysis script

├── Does Happiness Drive Road Safety_.pdf # Slides presentation

└── README.md # Project description

---

## 🧠 Author

**Christos Georgakakis**   
For any questions or comments, feel free to reach out: *chatgpchris@gmail.com*

*https://www.linkedin.com/in/christos-georgakakis-a43800124/*
---
