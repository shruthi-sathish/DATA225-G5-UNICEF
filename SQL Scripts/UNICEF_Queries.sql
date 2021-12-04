__________________________________________________________________________________
SELECT "Location_Dimension"."CountryAndAreaName", "Year_Dimension"."Data_Year","Indicator_Dimension"."Indicator_Type", SUM("Death_Mortality_WASH_Fact"."Obs_Value") AS Total_Data,  
        GROUPING ("Location_Dimension"."CountryAndAreaName") as CountryOrArea_Rollup, 
        GROUPING ("Year_Dimension"."Data_Year") as Year_Rollup,
		GROUPING ("Indicator_Dimension"."Indicator_Type") as Indicator_Type_Rollup
        from public."Death_Mortality_WASH_Fact" ,public."Location_Dimension",public."Indicator_Dimension",public."Year_Dimension"
        where  "Death_Mortality_WASH_Fact"."Location_ID" = "Location_Dimension"."Location_ID"
        and "Death_Mortality_WASH_Fact"."Year_ID" = "Year_Dimension"."Year_ID"
        and "Death_Mortality_WASH_Fact"."Indicator_ID" = "Indicator_Dimension"."Indicator_ID"
        and "Indicator_Dimension"."Indicator_Type" like '%Child%'
        GROUP BY ROLLUP ("Location_Dimension"."CountryAndAreaName", "Year_Dimension"."Data_Year","Indicator_Dimension"."Indicator_Type")
		ORDER BY public."Location_Dimension"."CountryAndAreaName", public."Year_Dimension"."Data_Year";
__________________________________________________________________________________
SELECT "Location_Dimension"."CountryAndAreaName", "Year_Dimension"."Data_Year","Indicator_Dimension"."Indicator_Type", SUM("Death_Mortality_WASH_Fact"."Obs_Value") AS Total_Data,  
        GROUPING ("Location_Dimension"."CountryAndAreaName") as CountryOrArea_Rollup, 
        GROUPING ("Year_Dimension"."Data_Year") as Year_Rollup,
		GROUPING ("Indicator_Dimension"."Indicator_Type") as Indicator_Type_Rollup
        from public."Death_Mortality_WASH_Fact" ,public."Location_Dimension",public."Indicator_Dimension",public."Year_Dimension"
        where  "Death_Mortality_WASH_Fact"."Location_ID" = "Location_Dimension"."Location_ID"
        and "Death_Mortality_WASH_Fact"."Year_ID" = "Year_Dimension"."Year_ID"
        and "Death_Mortality_WASH_Fact"."Indicator_ID" = "Indicator_Dimension"."Indicator_ID"
        and "Indicator_Dimension"."Indicator_Type" like '%Child%'
        GROUP BY 
		GROUPING SETS (
			("Location_Dimension"."CountryAndAreaName", "Year_Dimension"."Data_Year","Indicator_Dimension"."Indicator_Type"),
			("Location_Dimension"."CountryAndAreaName", "Year_Dimension"."Data_Year"),
			("Location_Dimension"."CountryAndAreaName"),
			()
			)		
		ORDER BY public."Location_Dimension"."CountryAndAreaName", public."Year_Dimension"."Data_Year";
		
--------------------------------------------------------------------------------------------------
SELECT "Location_Dimension"."CountryAndAreaName", "Year_Dimension"."Data_Year","Indicator_Dimension"."Indicator_Type", SUM("Death_Mortality_WASH_Fact"."Obs_Value") AS Total_Data,  
        GROUPING ("Location_Dimension"."CountryAndAreaName") as CountryOrArea_Rollup, 
        GROUPING ("Year_Dimension"."Data_Year") as Year_Rollup,
		GROUPING ("Indicator_Dimension"."Indicator_Type") as Indicator_Type_Rollup
        from public."Death_Mortality_WASH_Fact" ,public."Location_Dimension",public."Indicator_Dimension",public."Year_Dimension"
        where  "Death_Mortality_WASH_Fact"."Location_ID" = "Location_Dimension"."Location_ID"
        and "Death_Mortality_WASH_Fact"."Year_ID" = "Year_Dimension"."Year_ID"
        and "Death_Mortality_WASH_Fact"."Indicator_ID" = "Indicator_Dimension"."Indicator_ID"
        and "Indicator_Dimension"."Indicator_Type" like '%Child%'
GROUP BY ROLLUP ("Location_Dimension"."CountryAndAreaName", "Year_Dimension"."Data_Year","Indicator_Dimension"."Indicator_Type")
HAVING
 		GROUPING ("Indicator_Dimension"."Indicator_Type") = 0 AND
        GROUPING ("Location_Dimension"."CountryAndAreaName") = 0 AND
        GROUPING ("Year_Dimension"."Data_Year") = 1
ORDER BY public."Location_Dimension"."CountryAndAreaName", public."Year_Dimension"."Data_Year";
		
---------------------------------------------------------------------------------------------
SELECT public."Location_Dimension"."CountryAndAreaName", public."Year_Dimension"."Data_Year", 
SUM("Death_Mortality_WASH_Fact"."Obs_Value") AS Total_Data
        from public."Death_Mortality_WASH_Fact" ,public."Location_Dimension",public."Indicator_Dimension",public."Year_Dimension"
        where  "Death_Mortality_WASH_Fact"."Location_ID" = "Location_Dimension"."Location_ID"
        and "Death_Mortality_WASH_Fact"."Year_ID" = "Year_Dimension"."Year_ID"
        and "Death_Mortality_WASH_Fact"."Indicator_ID" = "Indicator_Dimension"."Indicator_ID"
        and "Indicator_Dimension"."Indicator_Type" = 'Child deaths aged 1-4 years'
        GROUP BY CUBE (public."Location_Dimension"."CountryAndAreaName", public."Year_Dimension"."Data_Year")
		ORDER BY public."Location_Dimension"."CountryAndAreaName", public."Year_Dimension"."Data_Year";
--------------------------------------------------------------------------------------

select public."Location_Dimension"."CountryAndAreaName",
public."Year_Dimension"."Data_Year",
public."Indicator_Dimension"."Indicator_Type",
MAX(public."Education_Fact"."Male") as Max_Male_Proportion,
MAX(public."Education_Fact"."Female") as Max_Female_Proportion
from public."Education_Fact",public."Location_Dimension",public."Indicator_Dimension",public."Year_Dimension"
where 
public."Education_Fact"."Location_ID" = public."Location_Dimension"."Location_ID" 
and public."Education_Fact"."Indicator_ID" = public."Indicator_Dimension"."Indicator_ID"
and public."Education_Fact"."Year_ID" = public."Year_Dimension"."Year_ID"
and public."Education_Fact"."Year_ID" != 0
and public."Indicator_Dimension"."Indicator_Type" = 'Out Of School Rate - Lower Secondary'
GROUP BY public."Location_Dimension"."CountryAndAreaName",
public."Year_Dimension"."Data_Year",
public."Indicator_Dimension"."Indicator_Type"
ORDER BY public."Location_Dimension"."CountryAndAreaName",public."Year_Dimension"."Data_Year";

__________________________________________________________________________________

select public."Location_Dimension"."CountryAndAreaName",
public."Year_Dimension"."Data_Year",
public."Indicator_Dimension"."Indicator_Type",
MAX(public."Death_Mortality_WASH_Fact"."Obs_Value") as Max_Value
from public."Death_Mortality_WASH_Fact",public."Location_Dimension",public."Indicator_Dimension",public."Year_Dimension"
where 
public."Death_Mortality_WASH_Fact"."Location_ID" = public."Location_Dimension"."Location_ID" 
and public."Death_Mortality_WASH_Fact"."Indicator_ID" = public."Indicator_Dimension"."Indicator_ID"
and public."Death_Mortality_WASH_Fact"."Year_ID" = public."Year_Dimension"."Year_ID"
and public."Death_Mortality_WASH_Fact"."Year_ID" != 0
and public."Death_Mortality_WASH_Fact"."Indicator_ID" = '21'
GROUP BY public."Location_Dimension"."CountryAndAreaName",
public."Year_Dimension"."Data_Year",
public."Indicator_Dimension"."Indicator_Type"
ORDER BY public."Location_Dimension"."CountryAndAreaName",public."Year_Dimension"."Data_Year";
----------------------------------------------------------------------------------------
create view  hygiene as
select "Location_Dimension"."CountryAndAreaName" as country ,"Year_Dimension"."Data_Year" as year,
"Death_Mortality_WASH_Fact"."Obs_Value" as schools_with_no_hygiene_service
from public."Death_Mortality_WASH_Fact",
public."Year_Dimension" , public."Location_Dimension" , public."Indicator_Dimension"
where
"Year_Dimension"."Year_ID" = "Death_Mortality_WASH_Fact"."Year_ID"
and "Location_Dimension"."Location_ID" = "Death_Mortality_WASH_Fact"."Location_ID"
and "Death_Mortality_WASH_Fact"."Indicator_ID" = 17;
__________________________________________________________________________________
create view open1 as
select "Location_Dimension"."CountryAndAreaName" as country ,"Year_Dimension"."Data_Year" as year,
"Death_Mortality_WASH_Fact"."Obs_Value" as population_practising_open_defecation
from public."Death_Mortality_WASH_Fact",
public."Year_Dimension" , public."Location_Dimension" , public."Indicator_Dimension"
where
"Year_Dimension"."Year_ID" = "Death_Mortality_WASH_Fact"."Year_ID"
and "Location_Dimension"."Location_ID" = "Death_Mortality_WASH_Fact"."Location_ID"
and "Death_Mortality_WASH_Fact"."Indicator_ID" = 18;
__________________________________________________________________________________
create view  water as
select "Location_Dimension"."CountryAndAreaName" as country ,"Year_Dimension"."Data_Year" as year,
"Death_Mortality_WASH_Fact"."Obs_Value" as schools_with_no_drinking_water_service
from public."Death_Mortality_WASH_Fact",
public."Year_Dimension" , public."Location_Dimension" , public."Indicator_Dimension"
where
"Year_Dimension"."Year_ID" = "Death_Mortality_WASH_Fact"."Year_ID"
and "Location_Dimension"."Location_ID" = "Death_Mortality_WASH_Fact"."Location_ID"
and "Death_Mortality_WASH_Fact"."Indicator_ID" = 19;

__________________________________________________________________________________

create view  cd as
select "Location_Dimension"."CountryAndAreaName" as country ,"Year_Dimension"."Data_Year" as year,
"Death_Mortality_WASH_Fact"."Obs_Value" as child_deaths_aged_1_4_years
from public."Death_Mortality_WASH_Fact",
public."Year_Dimension" , public."Location_Dimension" , public."Indicator_Dimension"
where
"Year_Dimension"."Year_ID" = "Death_Mortality_WASH_Fact"."Year_ID"
and "Location_Dimension"."Location_ID" = "Death_Mortality_WASH_Fact"."Location_ID"
and "Death_Mortality_WASH_Fact"."Indicator_ID" = 20;


__________________________________________________________________________________
create view  cd1 as
select "Location_Dimension"."CountryAndAreaName" as country ,"Year_Dimension"."Data_Year" as year,
"Death_Mortality_WASH_Fact"."Obs_Value" as child_deaths_aged_5_14_years
from public."Death_Mortality_WASH_Fact",
public."Year_Dimension" , public."Location_Dimension" , public."Indicator_Dimension"
where
"Year_Dimension"."Year_ID" = "Death_Mortality_WASH_Fact"."Year_ID"
and "Location_Dimension"."Location_ID" = "Death_Mortality_WASH_Fact"."Location_ID"
and "Death_Mortality_WASH_Fact"."Indicator_ID" = 21;

__________________________________________________________________________________

create view  results as
select "Location_Dimension"."CountryAndAreaName" as country, "Year_Dimension"."Data_Year" as year, "Indicator_Dimension"."Indicator_Desc" as indicator,
"Location_Dimension"."DevlopmentStage" as developmemt_stage,
"Education_Fact"."Total" as total, "Education_Fact"."Female" as female, "Education_Fact"."Male" as male
from public."Education_Fact",
public."Year_Dimension" , public."Location_Dimension" , public."Indicator_Dimension"
where
"Year_Dimension"."Year_ID" = "Education_Fact"."Year_ID"
and "Location_Dimension"."Location_ID" = "Education_Fact"."Location_ID"
and "Indicator_Dimension"."Indicator_ID" = "Education_Fact"."Indicator_ID";

__________________________________________________________________________________


select DISTINCT "results"."country", "results"."year", "results"."developmemt_stage",
"sanitation"."schools_with_no_sanitation_service",
"hygiene"."schools_with_no_hygiene_service",
"open1"."population_practising_open_defecation",
"water"."schools_with_no_drinking_water_service",
"results"."indicator",
"results"."total"
from public."results", public."sanitation", public."hygiene", public."open1", public."water"
where
"results"."country" = "sanitation"."country" and "results"."year" = "sanitation"."year" and
"results"."country" = "hygiene"."country" and "results"."year" = "hygiene"."year" and
"results"."country" = "open1"."country" and "results"."year" = "open1"."year" and
"results"."country" = "water"."country" and "results"."year" = "water"."year"
and "sanitation"."schools_with_no_sanitation_service" != 0
and "hygiene"."schools_with_no_hygiene_service" != 0
and "open1"."population_practising_open_defecation" != 0
and "water"."schools_with_no_drinking_water_service" != 0
and "results"."year" = '2019'
order by "results"."country", "results"."year" desc;
__________________________________________________________________________________
select DISTINCT "results"."country", "results"."year", "results"."developmemt_stage",
"cd1"."child_deaths_aged_5_14_years",
"results"."indicator",
"results"."total"
from public."results", public."cd1"
where
"results"."country" = "cd1"."country" and "results"."year" = "cd1"."year" 
and "cd1"."child_deaths_aged_5_14_years" != 0
and "results"."indicator" = 'Out Of School Rate - Upper Secondary'
--order by "results"."country", "results"."year","cd1"."child_deaths_aged_5_14_years" desc;
order by "cd1"."child_deaths_aged_5_14_years" desc;


