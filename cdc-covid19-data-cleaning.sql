USE db1;

/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT TOP (1000) [F1]
--      ,[case_month]
--      ,[res_state]
--      ,[state_fips_code]
--      ,[res_county]
--      ,[county_fips_code]
--      ,[age_group]
--      ,[sex]
--      ,[race]
--      ,[ethnicity]
--      ,[case_onset_interval]
--      ,[process]
--      ,[exposure_yn]
--      ,[current_status]
--      ,[symptom_status]
--      ,[hosp_yn]
--      ,[icu_yn]
--      ,[death_yn]
--      ,[case_positive_specimen]
--      ,[underlying_conditions_yn]
--  FROM [cov19_cdc_dataset].[dbo].[cases]


--- Data Cleaning: identifying/refactoring NA entries

  SELECT DISTINCT age_group FROM cases;   
  UPDATE cases
  SET age_group = NULL
  WHERE age_group IN ('Missing','NA');

  --SELECT DISTINCT race FROM cases;
  UPDATE cases 
  SET race = NULL
  WHERE race IN ('Missing', 'Unknown','NA');

  --SELECT DISTINCT sex FROM cases;
  UPDATE cases 
  SET sex = NULL 
  WHERE sex NOT IN ('Male','Female','Other');

  --SELECT DISTINCT ethnicity FROM cases;
  UPDATE cases
  SET ethnicity = NULL 
  WHERE ethnicity IN ('Missing', 'Unknown','NA');

  --SELECT DISTINCT process FROM cases;
  UPDATE cases
  SET process = NULL 
  WHERE process IN ('Missing', 'Unknown','NA');


  --SELECT DISTINCT exposure_yn FROM cases;
  UPDATE cases
  SET exposure_yn = NULL 
  WHERE exposure_yn IN ('Missing', 'Unknown','NA');

  --SELECT DISTINCT current_status FROM cases;

  --SELECT DISTINCT symptom_status FROM cases;
  UPDATE cases
  SET symptom_status = NULL 
  WHERE symptom_status IN ('Missing', 'Unknown','NA');

  --SELECT DISTINCT hosp_yn FROM cases;
  UPDATE cases
  SET hosp_yn = NULL 
  WHERE hosp_yn IN ('Missing', 'Unknown','NA');

  --SELECT DISTINCT icu_yn FROM cases;
  UPDATE cases
  SET icu_yn = NULL 
  WHERE icu_yn IN ('Missing', 'Unknown','NA');

  --SELECT DISTINCT death_yn FROM cases;
  UPDATE cases
  SET death_yn = NULL 
  WHERE death_yn IN ('Missing', 'Unknown','NA');

  --SELECT DISTINCT underlying_conditions_yn FROM cases;


--- Check SQL data types
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'cases'



--- Drop columns
ALTER TABLE cases DROP COLUMN case_positive_specimen_interval, case_onset_interval, underlying_conditions_yn, process, exposure_yn

--- Drop cases that are not laboratory confirmed
--- After that, current_status becomes obsolete so drop it also
DELETE FROM cases WHERE current_status = 'Probable Case'
ALTER TABLE cases DROP COLUMN current_status

--- Select 2020 data into a new table
SELECT * INTO cases_20 FROM cases WHERE case_month LIKE '2020%'

 

--- Select 2022 data into a new table
SELECT * INTO cases_22 FROM cases WHERE case_month LIKE '2022%'




--- Look at the number of total cases for each month and derive percentage change from previous month
SELECT case_month, COUNT(*) AS curr_cases, LAG(COUNT(*),1,0) OVER (ORDER BY case_month) AS prev_cases, 
NULLIF(
		CONCAT(
			ROUND(
						(CAST(COUNT(*) AS FLOAT) / NULLIF(   CAST(LAG(COUNT(*),1,0) OVER (ORDER BY case_month) AS FLOAT)   ,0) - 1)
				,3)*100
			,'%')
	,'%') AS percent_change FROM cases
GROUP BY case_month
ORDER BY case_month ASC;



--- Look at monthly death rate
SELECT t1.case_month, t1.num_death, CONCAT(ROUND(100*t1.num_death/t2.total,2),'%') AS monthly_death_rate FROM 
   (SELECT case_month, CAST(COUNT(*) AS FLOAT) AS num_death FROM cases
	WHERE death_yn = 'Yes' GROUP BY case_month ) AS t1
	INNER JOIN
	(SELECT case_month, CAST(COUNT(*) AS FLOAT) AS total FROM cases GROUP BY case_month) AS t2
	ON t1.case_month = t2.case_month
	ORDER BY case_month ASC;



--- Look at race proportion per month, for the month with highest death rate
WITH monthly AS (
SELECT CAST(COUNT(*) AS FLOAT) AS total FROM cases WHERE case_month = '2020-05'
)
SELECT case_month, CONCAT(ROUND(100*CAST(COUNT(*) AS FLOAT)/(SELECT total FROM monthly),2),'%') AS proportion, race FROM cases
WHERE case_month = '2020-05'
GROUP BY case_month, race
ORDER BY case_month ASC;


--- Look at average difference in time (in weeks) between case onset and positive specimen result
SELECT case_month, ROUND(AVG(CAST(onset_specimen_diff AS FLOAT)),2) AS avg_gap_between_symptom_and_result FROM cases
GROUP BY case_month
ORDER BY case_month ASC;