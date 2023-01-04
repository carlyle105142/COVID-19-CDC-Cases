# Surprise! Those Factors Increased Likelihood of Death during COVID-19 Pandemic in 2020
 

Data sets can be downloaded at: https://drive.google.com/drive/folders/1dYFUJ6TFUC85d9nFCaxeYseW6OriNox1?usp=share_link

A Tableau dashboard file ".twb" is also attached. Various visualizations for Sex, Hospitalization, ICU, Symptom Status, etc. are provided in those dashboards. A pictures of the main dashboard is provided below. Notice that the dashboards are **interactive**, meaning you can click and drag different categories to explore details of your desire!

<img width="1025" alt="image" src="https://user-images.githubusercontent.com/59629686/210470221-f6651ae8-2e1a-484c-8238-4798c69ef791.png">

## Interesting Findings:
+ **The average death rate at beginning of 2020 was 25% on average; and 80% on average for people older than 65 years.**
+ **Black, Hispanic/Latino populations and those aged over 65 years old were exceptionaly more vulnerable than the rest in California.**
+ **Females had higher death rate than males on average. (Check Tableau Workbook)**
+ **Cases and deaths for some minority groups, including Black people, American Indian, Alaska Native, Native Hawaiian and Other Pacific Islanders, were largely underreported.**
+ **Hospitalization increased the risk of death by over 30 times on average.**
+ **Los Angeles county was the most severely attacked county in California, followed by Riverside, San Diego, Orange and San Bernadino county.**


## Introduction

Started at early 2020, the global outbreak of COVID-19 has since changed every single aspect of our lives. Remarked by its rapid spread and intractable nature, over 6 millions of people worldwide had died from the disease. Among all countries, the United States is one of the most severely impacted nation in terms of total cases and deaths. With its highly diverse population, people at different age, with different ethnic and gender identities, and from different states all had suffered differently from the pandemic due to various reasons. Although a single trend line may efficiently capture the overall severity of the pandemic, demographic variability can often be overlooked. In this project, my goal is to show my audience the impact of COVID-19 from multiple dimensions to offer a fuller view of how different groups of people may have suffered differently from the pandemic. Specifically, I will focus on the year of 2020 only. I will make use of various types of plots and visualization tools to highlight my findings and help you to gain a more in-depth understanding on this topic.

## Overview

**Variable Description**

| Variable          | Description |
| :-----------:      | :----------- |
| case_month        | The earlier of month the clinical date (date related to the illness <br> or specimen collection) or the date received by CDC       |
| res_state          | State of residence        |
| state_fips_code   | State FIPS code        |
| res_county   | County of residence        |
| county_fips_code  | County FIPS code        |
| age_group   | Age group (0 - 17 years; 18 - 49 years; 50 - 64 years; 65 + years)        |
| sex   | Sex (Female, Male, Others)       |
| race   | Race (American Indian/Alaska Native; Asian; Black; Multiple/Other; <br> Native Hawaiian/Other Pacific Islander; White)        |
| ethnicity   | Ethnicity (Hispanic; Non-Hispanic)        |
| symptom_status   | What is the symptom status of this person? (Asymptomatic, Symptomatic)         |
| hosp_yn   | Was the patient hospitalized? (Yes, No)        |
| icu_yn   | Was the patient admitted to an intensive care unit (ICU)? (Yes, No)        |
| death_yn   | Did the patient die as a result of this illness? (Yes, No)       |



**Missing Values**

![newplot](https://user-images.githubusercontent.com/59629686/210034844-2a3aeee2-2879-4f42-920e-b6451d73e6ac.png)

+ We will drop the ICU indicator variable because it contains way too much missing values (93%).
+ The final version of the data set we will use look like below:

<img width="901" alt="image" src="https://user-images.githubusercontent.com/59629686/210034893-df496b23-f010-4656-8478-2a2c7dd431a5.png">

## Overall Trend

### Total confirmed cases and deaths

![newplot (1)](https://user-images.githubusercontent.com/59629686/210034986-54ea069f-ae74-47a1-85b0-50347f3014d6.png)

+ The total comfirmed cases increased at a steady rate from January to July. After a 2 month period of decreasing, it started to rise again from September to December.

+ The total deaths followed roughly the same pattern, except from Febuary to April, where there was a drastic growth in deaths.

+ The decline in number of confirmed cases from July to September could be attributed to hot weather.

+ The drastic increase in death rate from Febuary to April might be due to the lack of preparedness against COVID-19.



### Cumulative confirmed cases and deaths

![newplot (2)](https://user-images.githubusercontent.com/59629686/210035001-ea4917a0-cfb1-44cf-bf43-b820f6f80129.png)

+ From the first confirmed case to 5 million infections, it took about 7 months from January to July.

+ During the next 5 months from July to December, the number of cases grew from 5 million to over 15 million: more than trippled but only with less time.

+ Rate of growth in cumulative deaths was more moderate and followed a linear pace. It eventually reached 200k by the time of December 1st, 2020.

### Monthly rate of change

![newplot (3)](https://user-images.githubusercontent.com/59629686/210035016-cf3dbec9-180e-4490-9f6d-d4d79c3c6fbf.png)

+ Increases in confirmed cases and death both slowed down from April and reached the yearly lowest in May 2020. 
+ From October to November, both confirmed cases and deaths grew at an increasing pace.

### Monthly Death Rate

![newplot (4)](https://user-images.githubusercontent.com/59629686/210035039-92968a65-a3d5-461c-b570-175ff7b8f717.png)

+ The monthly death rate was extremely high in January 2020, which was approximately 25%.
+ Death rates in the first quarter and the first half of the second quarter were the highest in the whole year of 2020, with an average of around 10%.
+ Started from June, the death rates were much lower, with an average of around 2.5%.




## Age Group

### Monthly Cases

![newplot (5)](https://user-images.githubusercontent.com/59629686/210035080-0ad3bcd4-1631-45a9-ab69-4e32463d7df6.png)

### Monthly Death Rate

![newplot (6)](https://user-images.githubusercontent.com/59629686/210035095-920dcfdf-d4eb-412f-903d-b6b8ff2041f1.png)

+ In terms of the number of cases, most of patients were from 18 to 49 years old; least common were patients under 18 years old.

+ In terms of the death rate, patients from 50 to 64 years old and over 65 years old had a much higher chance to decease from COVID-19 than the rest of the population.

+ Death rates for both "50 to 64" and "above 65" age groups both peaked at the beginning, then decreased month by month.

+ From January to Febuary, the average probability of death was 80% for patients over 65 years old and 50% for patients from 50 to 64 years old.

+ A possible explanation is that the old population lacked sufficient self-immunity to fight against the virus; they also tended to have underlying conditions, which were made worse by the infection of COVID-19.

## Hospitalization

### Monthly Death Rate

<img width="680" alt="image" src="https://user-images.githubusercontent.com/59629686/210052137-2d376a27-e751-436e-97f7-0a3c33bcead5.png">


## Ethnicity and Race

### Proportion of total cases

![newplot (7)](https://user-images.githubusercontent.com/59629686/210035130-393043a6-6c0c-496a-a273-20b09c6dc50d.png)

![newplot (8)](https://user-images.githubusercontent.com/59629686/210035141-1f7ab138-0b41-46a7-9780-26e0d0faf124.png)

## Case Study: California


### Death By County Overview

<img width="586" alt="image" src="https://user-images.githubusercontent.com/59629686/210051716-dfd971f0-a06c-48ac-828b-28f663e37860.png">

<img width="587" alt="image" src="https://user-images.githubusercontent.com/59629686/210051364-a1c4c17b-f404-483e-bd33-a9d09285b40e.png">

+ The heatmap was plotted based on the per month number of deaths in each county in California. Furthermore, log transformation was applied. The reason is that Los Angeles county had much higher number of deaths, which overshadows the rest of other counties in the first heatmap.

+ Los Angeles county was the most severely attacked place by COVID-19 in California, without a doubt.

+ Based on the log-deaths, Riverside, San Diego, Orange and San Bernardino also had disproportionately higher number of deaths than the rest of California.

+ Los Angeles

### Vulnerability Index (VI)

The Vulnerability Index is used as a way to measure the disproportionality of the number of confirmed cases for some demographic subgroup with respect to their corresponding population size. With base population proportion as a fixed reference, if the infection proportion of some subgroup is significantly greater than their actual population percentage, it would suggest that that subgroup is significantly more vulnerable than the other groups as a whole on average. For instance, the Vulnerability Index for Hispanic ethnic group is calculated by:

$$VI = \frac{\mathrm{P}(\text{Ethnicity} = \text{Hispanic} \mid \text{Infected})}{\mathrm{P}(\text{Ethnicity} = \text{Hispanic})} $$

where

$$ \mathrm{P}(\text{Ethnicity} = \text{Hispanic} \mid \text{Infected}) = 
    \frac{\mathrm{P}( \text{Hispanic}, \text{Infected})}{\mathrm{P}(\text{Infected})}$$
    
### By Race

<img width="582" alt="image" src="https://user-images.githubusercontent.com/59629686/210035859-a953e51f-8b32-416f-985b-b47c92e28b4b.png">


+ There may be missing data from "American Indian/Alaska Native" and "Native Hawaiian/Other Pacific Islander" because no deaths was reported from both groups during 2020 in California. Their corresponding vulnerability index were thus all 0. Deaths data were also missing for the first two months in California.

+ Among the rest 3 race groups, black people seemed the most vulnerable to COVID-19, especially from March to May; Asian people were the least vulnerable group in terms of deaths.  

+ The black population initially suffered from disproportionately more deaths, but much less latter on (and even no death reported during September and October). This indicated that deaths for black patients may had been severely underreported.

### By Ethnicity

<img width="681" alt="image" src="https://user-images.githubusercontent.com/59629686/210037274-d85fa14c-c006-461e-8285-93aed5b3dc5e.png">

+ It is pretty clear that Hispanic people had been more likely to die from COVID-19 than the Non-Hispanic group.

+ For Hispanic people, their worst months during 2020 were July and September, which were counterintuitively the months associated with the lowest deaths in California in 2020.

### By Age

<img width="585" alt="image" src="https://user-images.githubusercontent.com/59629686/210035775-71775b49-54f3-4b9e-a7bc-cd4e34482582.png">

+ No death was reported for population under 18 years old; this may be a result of incomplete/bad data collection.

+ For population below 64 years old, their death counts were not aligned with their large base popuation percentage as reflected by the low vulnerability index.

+ The population over 64 years old were very severely attacked by the pandemic as their death rates were on average 6 times as high as their base popualtion percentage.

