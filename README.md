# COVID-19-CDC-Cases
 

Data sets can be downloaded at: https://drive.google.com/drive/folders/1dYFUJ6TFUC85d9nFCaxeYseW6OriNox1?usp=share_link



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
| sex   | Sex (Female, Male, Others        |
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

### Cumulative confirmed cases and deaths

![newplot (2)](https://user-images.githubusercontent.com/59629686/210035001-ea4917a0-cfb1-44cf-bf43-b820f6f80129.png)

### Monthly rate of change

![newplot (3)](https://user-images.githubusercontent.com/59629686/210035016-cf3dbec9-180e-4490-9f6d-d4d79c3c6fbf.png)

### Monthly Death Rate

![newplot (4)](https://user-images.githubusercontent.com/59629686/210035039-92968a65-a3d5-461c-b570-175ff7b8f717.png)

## Age Group

### Monthly Cases

![newplot (5)](https://user-images.githubusercontent.com/59629686/210035080-0ad3bcd4-1631-45a9-ab69-4e32463d7df6.png)

### Monthly Death Rate

![newplot (6)](https://user-images.githubusercontent.com/59629686/210035095-920dcfdf-d4eb-412f-903d-b6b8ff2041f1.png)

## Ethnicity and Race

### Proportion of  total cases

![newplot (7)](https://user-images.githubusercontent.com/59629686/210035130-393043a6-6c0c-496a-a273-20b09c6dc50d.png)

![newplot (8)](https://user-images.githubusercontent.com/59629686/210035141-1f7ab138-0b41-46a7-9780-26e0d0faf124.png)

## Case Study: California

### Data Cleaning

+ Let's first look at the death data specifically for counties in California in 2020. 

### Death By County Overview

![image](https://user-images.githubusercontent.com/59629686/210035263-74891cd4-5121-444b-923c-7da826915a58.png)

### Vulnerability Index (VI)

The Vulnerability Index is used as a way to measure the disproportionality of the number of confirmed cases for some demographic subgroup with respect to their corresponding population size. With base population proportion as a fixed reference, if the infection proportion of some subgroup is significantly greater than their actual population percentage, it would suggest that that subgroup is significantly more vulnerable than the other groups as a whole on average. For instance, the Vulnerability Index for Hispanic ethnic group is calculated by:

$$VI = \frac{\mathrm{P}(\text{Ethnicity} = \text{Hispanic} \mid \text{Infected})}{\mathrm{P}(\text{Ethnicity} = \text{Hispanic})} $$

where

$$ \mathrm{P}(\text{Ethnicity} = \text{Hispanic} \mid \text{Infected}) = 
    \frac{\mathrm{P}( \text{Hispanic}, \text{Infected})}{\mathrm{P}(\text{Infected})}$$
    
### By Race

<img width="582" alt="image" src="https://user-images.githubusercontent.com/59629686/210035859-a953e51f-8b32-416f-985b-b47c92e28b4b.png">

### By Ethnicity

<img width="681" alt="image" src="https://user-images.githubusercontent.com/59629686/210037274-d85fa14c-c006-461e-8285-93aed5b3dc5e.png">

### By Age

<img width="585" alt="image" src="https://user-images.githubusercontent.com/59629686/210035775-71775b49-54f3-4b9e-a7bc-cd4e34482582.png">

