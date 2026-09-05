--STEP 7:-Check NULL Values in boxoffice Table
SELECT
    SUM(FilmID IS NULL) AS FilmID_NULL,
    SUM(Title IS NULL) AS Title_NULL,
    SUM(Release_Date IS NULL) AS Release_Date_NULL,
    SUM(DirectorID IS NULL) AS DirectorID_NULL,
    SUM(Lead_Actor_Actress IS NULL) AS Lead_Actor_NULL,
    SUM(LanguageID IS NULL) AS LanguageID_NULL,
    SUM(Industry IS NULL) AS Industry_NULL,
    SUM(GenreID IS NULL) AS GenreID_NULL,
    SUM(Budget IS NULL) AS Budget_NULL,
    SUM(First_Day_Collection_Worldwide IS NULL) AS First_Day_NULL,
    SUM(Worldwide_Collection_in_Crores IS NULL) AS Worldwide_Collection_NULL,
    SUM(Overseas_Collection IS NULL) AS Overseas_Collection_NULL,
    SUM(India_Gross_Collection IS NULL) AS India_Gross_NULL,
    SUM(Verdict IS NULL) AS Verdict_NULL,
    SUM(IMDb_Rating IS NULL) AS IMDb_Rating_NULL,
    SUM(Runtime_mins IS NULL) AS Runtime_NULL,
    SUM(OTT_Platform IS NULL) AS OTT_Platform_NULL,
    SUM(Year IS NULL) AS Year_NULL,
    SUM(Month IS NULL) AS Month_NULL,
    SUM(Month_Name IS NULL) AS Month_Name_NULL,
    SUM(Week_Name IS NULL) AS Week_Name_NULL
FROM boxoffice;


#STEP 8:-Check Duplicate Movies
SELECT
    FilmID,
    COUNT(*) AS Duplicate_count
FROM boxoffice
GROUP BY FilmID
HAVING COUNT(*) > 1;


#CHECK DUPLICATE MOVIE TITLES
SELECT
    Title,
    COUNT(*) AS count
FROM boxoffice
GROUP BY Title
HAVING COUNT(*) > 1;


#STEP 9:- CHECK DATA RANGES
SELECT 
    MIN(Budget) AS Minimum_Budget,
    MAX(Budget) AS Maximum_Budget,

    MIN(Worldwide_Collection_in_Crores) AS Minimum_Worldwide,
    MAX(Worldwide_Collection_in_Crores) AS Maximum_Worldwide,

    MIN(IMDb_Rating) AS Minimum_IMDb,
    MAX(IMDb_Rating) AS Maximum_IMDb,

    MIN(Runtime_mins) AS Minimum_Runtime,
    MAX(Runtime_mins) AS Maximum_Runtime
FROM boxoffice;


# I FOUND OUT THAT ONE MOVIE WITH (BUDGET = 0.00).
-- THIS IS SUSPICIOUS BECAUSE A MOVIE BUDGET GENERALLY NOT BE ZERO. LET'S INVESTIGATE


#STEP 10:-FIND MOVIES WITH ZERO BUDGET
SELECT 
    FilmID,
    Title,
    Budget,
    Worldwide_Collection_in_Crores,
    Verdict
FROM boxoffice
WHERE Budget = 0;


#STEP 11:- Check for Invalid/negative Values
SELECT * FROM boxoffice
WHERE Budget < 0
   OR Worldwide_Collection_in_Crores < 0
   OR Overseas_Collection < 0
   OR India_Gross_Collection < 0
   OR IMDb_Rating < 0
   OR IMDb_Rating > 10
   OR Runtime_mins <= 0;


#STEP 12: Check Missing Values in Important Tables
SELECT
    SUM(DirectorID IS NULL) AS DirectorID_NULL,
    SUM(Director IS NULL) AS Director_NULL
FROM director;

SELECT
    SUM(GenreID IS NULL) AS GenreID_NULL,
    SUM(Genre IS NULL) AS Genre_NULL
FROM genre;

SELECT
    SUM(LanguageID IS NULL) AS LanguageID_NULL,
    SUM(Language IS NULL) AS Language_NULL
FROM language;


-- FINAL DATA CLEANING CHECK

#Step 1: Check trailing/leading spaces in boxoffice
SELECT * FROM boxoffice
WHERE Title <> TRIM(Title)
   OR Industry <> TRIM(Industry)
   OR Verdict <> TRIM(Verdict)
   OR OTT_Platform <> TRIM(OTT_Platform);


#Step 2: Check spaces in director
SELECT * FROM director
WHERE Director <> TRIM(Director);


#Step 3: Check spaces in genre
SELECT * FROM genre
WHERE Genre <> TRIM(Genre);


#Step 4: Check spaces in language
SELECT * FROM language
WHERE Language <> TRIM(Language);
