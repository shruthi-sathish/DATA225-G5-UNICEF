DROP MATERIALIZED VIEW IF EXISTS "death_mortality_wash_fact_view";
DROP MATERIALIZED VIEW IF EXISTS "education_fact_view";
DROP MATERIALIZED VIEW IF EXISTS "ict_skillset_fact_view";
DROP TABLE IF EXISTS public."Death_Mortality_WASH_Fact";
DROP TABLE IF EXISTS public."Education_Fact";
DROP TABLE IF EXISTS public."ICT_Skillset_Fact";
DROP TABLE IF EXISTS public."Indicator_Dimension";
DROP TABLE IF EXISTS public."Location_Dimension";
DROP TABLE IF EXISTS public."Source_Dimension";
DROP TABLE IF EXISTS public."Year_Dimension";

-- Table: public.Year_Dimension
CREATE TABLE IF NOT EXISTS public."Year_Dimension"
(
    "Year_ID" INT NOT NULL,
    "Data_Year" VARCHAR(100),
    CONSTRAINT "Year_ID_pkey" PRIMARY KEY ("Year_ID")
);
ALTER TABLE IF EXISTS public."Year_Dimension"
    OWNER to postgres;
	
-- Table: public.Source_Dimension
CREATE TABLE IF NOT EXISTS public."Source_Dimension"
(
    "Source_ID" INT NOT NULL,
    "Source_Type" VARCHAR(100),
    "Source_Desc" VARCHAR(100),
    CONSTRAINT "Source_ID_pkey" PRIMARY KEY ("Source_ID")
);
ALTER TABLE IF EXISTS public."Source_Dimension"
    OWNER to postgres;

-- Table: public.Indicator_Dimension
CREATE TABLE IF NOT EXISTS public."Indicator_Dimension"
(
    "Indicator_ID" INT NOT NULL,
    "Indicator_Type" VARCHAR(100) NOT NULL,
    "Indicator_Desc" VARCHAR(100) NULL,
    CONSTRAINT "Indicator_Dimension_pkey" PRIMARY KEY ("Indicator_ID")
);
ALTER TABLE IF EXISTS public."Indicator_Dimension"
    OWNER to postgres;
	
-- Table: public.Location_Dimension
CREATE TABLE IF NOT EXISTS public."Location_Dimension"
(
    "Location_ID" SERIAL NOT NULL,
    "ISOCode" VARCHAR(10) NOT NULL,
    "CountryAndAreaName" VARCHAR(100) NOT NULL,
    "RegionName" VARCHAR(100),
    "DevlopmentStage" VARCHAR(100),
    CONSTRAINT "Location_Dimension_plockey" PRIMARY KEY ("Location_ID")
);
ALTER TABLE IF EXISTS public."Location_Dimension"
    OWNER to postgres;

-- Table: public.ICT_Skillset_Fact
CREATE TABLE IF NOT EXISTS public."ICT_Skillset_Fact"
(
	"Skillset_Fact_ID" SERIAL NOT NULL,
    "Location_ID" INT NOT NULL,
	"Indicator_ID" INT NOT NULL,
	"Source_ID" INT NOT NULL,
	"Year_ID" INT NOT NULL,
    "Sex" VARCHAR(10),
    "Moved_File" FLOAT,
    "Copy_Paste" FLOAT,
    "Sent_Email" FLOAT,
	"Used_Excel" FLOAT,
    "Installed_Hardware" FLOAT,
    "Installed_Software" FLOAT,
	"Created_PPT" FLOAT,
    "Transferred_File" FLOAT,
    "Knows_Programming" FLOAT,
	"Atleast_One_Skill_Total" FLOAT,
    "Atleast_One_Skill_Rural" FLOAT,
    "Atleast_One_Skill_Urban" FLOAT,
	"Atleast_One_Skill_Poorest" FLOAT,
    "Atleast_One_Skill_Richest" FLOAT,
    CONSTRAINT "ICT_Skillset_pkey" PRIMARY KEY ("Skillset_Fact_ID"),
	CONSTRAINT "Location_Dimension_ICTfkey" FOREIGN KEY("Location_ID") REFERENCES public."Location_Dimension"("Location_ID") ON UPDATE CASCADE,
	CONSTRAINT "Indicator_ICTfkey" FOREIGN KEY("Indicator_ID") REFERENCES public."Indicator_Dimension"("Indicator_ID") ON UPDATE CASCADE,
	CONSTRAINT "Source_ICTfkey" FOREIGN KEY("Source_ID") REFERENCES public."Source_Dimension"("Source_ID") ON UPDATE CASCADE,
	CONSTRAINT "Year_ICTfkey" FOREIGN KEY("Year_ID") REFERENCES public."Year_Dimension"("Year_ID") ON UPDATE CASCADE
);
ALTER TABLE IF EXISTS public."ICT_Skillset_Fact"
    OWNER to postgres;
	
-- Table: public.Education_Fact
CREATE TABLE IF NOT EXISTS public."Education_Fact"
(
	"Education_Fact_ID" SERIAL NOT NULL,
    "Location_ID" INT NOT NULL,
	"Indicator_ID" INT NOT NULL,
	"Source_ID" INT NOT NULL,
	"Year_ID" INT NOT NULL,
    "Total" FLOAT,
    "Female" FLOAT,
    "Male" FLOAT,
    "Urban" FLOAT,
	"Rural" FLOAT,
	"Poorest" FLOAT,
    "Second" FLOAT,
    "Middle" FLOAT,
    "Fourth" FLOAT,
	"Richest" FLOAT,
    CONSTRAINT "Education_Fact_pkey" PRIMARY KEY ("Education_Fact_ID"),
	CONSTRAINT "Location_Dimension_EDfkey" FOREIGN KEY("Location_ID") REFERENCES public."Location_Dimension"("Location_ID") ON UPDATE CASCADE,
	CONSTRAINT "Indicator_EDfkey" FOREIGN KEY("Indicator_ID") REFERENCES public."Indicator_Dimension"("Indicator_ID") ON UPDATE CASCADE,
	CONSTRAINT "Source_EDfkey" FOREIGN KEY("Source_ID") REFERENCES public."Source_Dimension"("Source_ID") ON UPDATE CASCADE,
	CONSTRAINT "Year_EDfkey" FOREIGN KEY("Year_ID") REFERENCES public."Year_Dimension"("Year_ID") ON UPDATE CASCADE
);
ALTER TABLE IF EXISTS public."Education_Fact"
    OWNER to postgres;
	
-- Table: public.Death_Mortality_WASH_Fact
CREATE TABLE IF NOT EXISTS public."Death_Mortality_WASH_Fact"
(
	"Fact_ID" SERIAL NOT NULL,
    "Location_ID" INT NOT NULL,
	"Indicator_ID" INT NOT NULL,
	"Source_ID" INT NOT NULL,
	"Year_ID" INT NOT NULL,
    "Obs_Value" FLOAT,
    CONSTRAINT "Fact_ID_pkey" PRIMARY KEY ("Fact_ID"),
	CONSTRAINT "Location_Dimension_DMfkey" FOREIGN KEY("Location_ID") REFERENCES public."Location_Dimension"("Location_ID") ON UPDATE CASCADE,
	CONSTRAINT "Indicator_BMfkey" FOREIGN KEY("Indicator_ID") REFERENCES public."Indicator_Dimension"("Indicator_ID") ON UPDATE CASCADE,
	CONSTRAINT "Source_DMfkey" FOREIGN KEY("Source_ID") REFERENCES public."Source_Dimension"("Source_ID") ON UPDATE CASCADE,
	CONSTRAINT "Year_DMfkey" FOREIGN KEY("Year_ID") REFERENCES public."Year_Dimension"("Year_ID") ON UPDATE CASCADE
);
ALTER TABLE IF EXISTS public."Death_Mortality_WASH_Fact"
    OWNER to postgres;
	
	-- Insert Source_Dimension
INSERT INTO public."Source_Dimension" VALUES (1,'UIS','UNESCO Institute for Statistics');
INSERT INTO public."Source_Dimension" VALUES (2,'UN_IGME','United Nations Inter-agency Group for Child Mortality Estimation');
INSERT INTO public."Source_Dimension" VALUES (3,'WHO/UNICEF Joint Monitoring Programme','WHO/UNICEF Joint Monitoring Programme');
INSERT INTO public."Source_Dimension" VALUES (4,'DHS','Demographic and Health Surveys');
INSERT INTO public."Source_Dimension" VALUES (5,'MICS','Multiple Indicator Cluster Surveys'); 
INSERT INTO public."Source_Dimension" VALUES (0,'Not Available','Not Available');

--Insert Year_Dimension
INSERT INTO public."Year_Dimension" VALUES (1,'2010');
INSERT INTO public."Year_Dimension" VALUES (2,'2011');
INSERT INTO public."Year_Dimension" VALUES (3,'2012');
INSERT INTO public."Year_Dimension" VALUES (4,'2013');
INSERT INTO public."Year_Dimension" VALUES (5,'2014');
INSERT INTO public."Year_Dimension" VALUES (6,'2015');
INSERT INTO public."Year_Dimension" VALUES (7,'2016');
INSERT INTO public."Year_Dimension" VALUES (8,'2017');
INSERT INTO public."Year_Dimension" VALUES (9,'2018');
INSERT INTO public."Year_Dimension" VALUES (10,'2019');
INSERT INTO public."Year_Dimension" VALUES (11,'2020');
INSERT INTO public."Year_Dimension" VALUES (0,'Not Available');

--Insert Indicator_Dimension
INSERT INTO public."Indicator_Dimension"  VALUES (1,'Literacy Rate 15 Plus','Literacy Rate 15 Plus');
INSERT INTO public."Indicator_Dimension"  VALUES (2,'Adult Literacy Rate','Adult Literacy Rate');
INSERT INTO public."Indicator_Dimension"  VALUES (3,'Attendance Rate - Primary','Attendance Rate - Primary');
INSERT INTO public."Indicator_Dimension"  VALUES (4,'Attendance Rate - Lower Secondary','Attendance Rate - Lower Secondary');
INSERT INTO public."Indicator_Dimension"  VALUES (5,'Attendance Rate - Upper Secondary','Attendance Rate - Upper Secondary');
INSERT INTO public."Indicator_Dimension"  VALUES (6,'Completion Rate - Primary','Completion Rate - Primary');
INSERT INTO public."Indicator_Dimension"  VALUES (7,'Completion Rate - Lower Secondary','Completion Rate - Lower Secondary');
INSERT INTO public."Indicator_Dimension"  VALUES (8,'Completion Rate - Upper Secondary','Completion Rate - Upper Secondary');
INSERT INTO public."Indicator_Dimension"  VALUES (9,'Out Of School Rate - Primary','Out Of School Rate - Primary');
INSERT INTO public."Indicator_Dimension"  VALUES (10,'Out Of School Rate - Lower Secondary','Out Of School Rate - Lower Secondary');
INSERT INTO public."Indicator_Dimension"  VALUES (11,'Out Of School Rate - Upper Secondary','Out Of School Rate - Upper Secondary');
INSERT INTO public."Indicator_Dimension"  VALUES (12,'Digital Age Connectivity Rate - Primary','Digital Age Connectivity Rate - Primary');
INSERT INTO public."Indicator_Dimension"  VALUES (13,'Digital Age Connectivity Rate - Lower Secondary','Digital Age Connectivity Rate - Lower Secondary');
INSERT INTO public."Indicator_Dimension"  VALUES (14,'Digital Age Connectivity Rate - Upper Secondary','Digital Age Connectivity Rate - Upper Secondary');
INSERT INTO public."Indicator_Dimension"  VALUES (15,'ICT Skills','ICT Skills');
INSERT INTO public."Indicator_Dimension"  VALUES (16,'WASH - Schools with no sanitation service','WASH - Schools with no sanitation service');
INSERT INTO public."Indicator_Dimension"  VALUES (17,'WASH - Schools with no hygiene service','WASH - Schools with no hygiene service');
INSERT INTO public."Indicator_Dimension"  VALUES (18,'WASH - Population practising open defecation','WASH - Population practising open defecation');
INSERT INTO public."Indicator_Dimension"  VALUES (19,'WASH - Schools with no drinking water service','WASH - Schools with no drinking water service');
INSERT INTO public."Indicator_Dimension"  VALUES (20,'Child deaths aged 1-4 years','Child deaths (aged 1-4 years)');
INSERT INTO public."Indicator_Dimension"  VALUES (21,'Child deaths aged 5-14 years','Child deaths (aged 5-14 years)');
INSERT INTO public."Indicator_Dimension" VALUES (0,'Not Available','Not Available');

-- Create Materialized Views combining Fact and Dimension Tables
CREATE MATERIALIZED VIEW  IF NOT EXISTS Death_Mortality_WASH_Fact_View AS 
select "Death_Mortality_WASH_Fact".*,"Location_Dimension"."ISOCode", "Location_Dimension"."CountryAndAreaName","Location_Dimension"."RegionName","Location_Dimension"."DevlopmentStage",
"Indicator_Dimension"."Indicator_Type","Year_Dimension"."Data_Year","Source_Dimension"."Source_Type","Source_Dimension"."Source_Desc"
from public."Death_Mortality_WASH_Fact",public."Location_Dimension",public."Indicator_Dimension",public."Year_Dimension",public."Source_Dimension"
where  "Death_Mortality_WASH_Fact"."Location_ID" = "Location_Dimension"."Location_ID"
and "Death_Mortality_WASH_Fact"."Year_ID" = "Year_Dimension"."Year_ID"
and "Death_Mortality_WASH_Fact"."Source_ID" = "Source_Dimension"."Source_ID"
and "Death_Mortality_WASH_Fact"."Indicator_ID" = "Indicator_Dimension"."Indicator_ID";


CREATE MATERIALIZED VIEW  IF NOT EXISTS ICT_Skillset_Fact_View AS 
select "ICT_Skillset_Fact".*,"Location_Dimension"."ISOCode", "Location_Dimension"."CountryAndAreaName","Location_Dimension"."RegionName","Location_Dimension"."DevlopmentStage",
"Indicator_Dimension"."Indicator_Type","Year_Dimension"."Data_Year","Source_Dimension"."Source_Type","Source_Dimension"."Source_Desc"
from public."ICT_Skillset_Fact",public."Location_Dimension",public."Indicator_Dimension",public."Year_Dimension",public."Source_Dimension"
where  "ICT_Skillset_Fact"."Location_ID" = "Location_Dimension"."Location_ID"
and "ICT_Skillset_Fact"."Year_ID" = "Year_Dimension"."Year_ID"
and "ICT_Skillset_Fact"."Source_ID" = "Source_Dimension"."Source_ID"
and "ICT_Skillset_Fact"."Indicator_ID" = "Indicator_Dimension"."Indicator_ID";

CREATE MATERIALIZED VIEW  IF NOT EXISTS Education_Fact_View AS 
select "Education_Fact".*,"Location_Dimension"."ISOCode", "Location_Dimension"."CountryAndAreaName","Location_Dimension"."RegionName","Location_Dimension"."DevlopmentStage",
"Indicator_Dimension"."Indicator_Type","Year_Dimension"."Data_Year","Source_Dimension"."Source_Type","Source_Dimension"."Source_Desc"
from public."Education_Fact",public."Location_Dimension",public."Indicator_Dimension",public."Year_Dimension",public."Source_Dimension"
where  "Education_Fact"."Location_ID" = "Location_Dimension"."Location_ID"
and "Education_Fact"."Year_ID" = "Year_Dimension"."Year_ID"
and "Education_Fact"."Source_ID" = "Source_Dimension"."Source_ID"
and "Education_Fact"."Indicator_ID" = "Indicator_Dimension"."Indicator_ID";

--Refresh Data in the views
REFRESH MATERIALIZED VIEW Death_Mortality_WASH_Fact_View;
REFRESH MATERIALIZED VIEW ICT_Skillset_Fact_View;
REFRESH MATERIALIZED VIEW Education_Fact_View;
