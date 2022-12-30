USE db1;

IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[demographic]') AND type in (N'U'))

BEGIN
CREATE TABLE demographic(
	[county] VARCHAR(100),
	[state] CHAR(2),
	[age_perc_65_or_older] DECIMAL(4,2),
	[age_perc_under_18] DECIMAL(4,2),
	[age_perc_under_5] DECIMAL(4,2),
	[age_18_to_65] DECIMAL(4,2),
	[ethn_american_indian_and_alaska_native] DECIMAL(4,2),
	[ethn_asian] DECIMAL(4,2),
	[ethn_black] DECIMAL(4,2),
	[ethn_hispanic_latino] DECIMAL(4,2),
	[ethn_native_hawaiian_and_other_pacific_islander] DECIMAL(4,2),
	[ethn_white] DECIMAL(4,2),
	[ethn_total_perc] DECIMAL(5,2),
	[income_per_cap] INT,
	[population_2020] INT
) 


INSERT INTO demographic 
(county, 
[state], 
age_perc_65_or_older,
age_perc_under_18,
age_perc_under_5,
age_18_to_65,
ethn_american_indian_and_alaska_native,
ethn_asian,
ethn_black,
ethn_hispanic_latino,
ethn_native_hawaiian_and_other_pacific_islander,
ethn_white,
ethn_total_perc,
income_per_cap,
population_2020
)
SELECT 
County,
[State],
[Age_Percent_65_and_Older],
[Age_Percent_Under_18_Years],
[Age_Percent_Under_5_Years],
100.0-[Age_Percent_65_and_Older]-[Age_Percent_Under_18_Years],
[Ethnicities_American_Indian_and_Alaska_Native_Alone],
[Ethnicities_Asian_Alone],
[Ethnicities_Black_Alone],
[Ethnicities_Hispanic_or_Latino],
[Ethnicities_Native_Hawaiian_and_Other_Pacific_Islander_Alone],
[Ethnicities_White_Alone],

[Ethnicities_White_Alone]+[Ethnicities_Asian_Alone]+
 [Ethnicities_Native_Hawaiian_and_Other_Pacific_Islander_Alone]+[Ethnicities_Hispanic_or_Latino]+
 [Ethnicities_Black_Alone]+[Ethnicities_American_Indian_and_Alaska_Native_Alone],

[Income_Per_Capita_Income],
[Population_2020_Population]

FROM dbo.county_demographics;

END

--- SOME DATA CLEANING:
--- there are a total of 1264 rows with false value (-1 or 0), we delete those counties
select * from demographic
where ethn_american_indian_and_alaska_native <= 0 or ethn_native_hawaiian_and_other_pacific_islander <= 0 or ethn_asian <= 0 or ethn_black <= 0 or ethn_hispanic_latino <= 0;

delete from demographic 
where ethn_american_indian_and_alaska_native <= 0 or ethn_native_hawaiian_and_other_pacific_islander <= 0 or ethn_asian <= 0 or ethn_black <= 0 or ethn_hispanic_latino <= 0;

--- we end up with 1875 counties in total after this procedure

--- also we found that some counties has their ethnic groups' percentages not summing up to 100%, which need to be weighted
--- for each ethnic group in each county, their percentages are divided by the total percentages of all ethnic groups in that county

UPDATE demographic
SET ethn_american_indian_and_alaska_native = ethn_american_indian_and_alaska_native/ethn_total_perc

UPDATE demographic
SET ethn_asian = ethn_asian/ethn_total_perc,
	ethn_black = ethn_black/ethn_total_perc,
	ethn_hispanic_latino = ethn_hispanic_latino/ethn_total_perc,
	ethn_native_hawaiian_and_other_pacific_islander = ethn_native_hawaiian_and_other_pacific_islander/ethn_total_perc,
	ethn_white = ethn_white/ethn_total_perc

--- recalculate sum of all percentages for each county
UPDATE demographic
SET ethn_total_perc = ethn_american_indian_and_alaska_native + ethn_asian + ethn_black + ethn_hispanic_latino + ethn_native_hawaiian_and_other_pacific_islander + ethn_white;

--- Now for every county, the population percentage of all ethnic groups sum up to 1 (with some acceptable decimal errors, which is at most 0.02% in magnitude)
SELECT ethn_total_perc FROM demographic;