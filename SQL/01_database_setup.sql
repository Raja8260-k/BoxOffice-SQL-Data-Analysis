--STEP 1: Create the Database
CREATE DATABASE boxoffice_analysis;
USE boxoffice_analysis;
SELECT DATABASE();

-- STEP 2: Understanding Our Tables
-- STEP 3: Create Tables

#Director table
CREATE TABLE DIRECTOR (
    DirectorID INT PRIMARY KEY,
    Director VARCHAR(100)
);

#Genre Table
CREATE TABLE genre (
    GenreID INT PRIMARY KEY,
    Genre VARCHAR(100)
);

#Language Table
CREATE TABLE language (
    LanguageID INT PRIMARY KEY,
    Language VARCHAR(50)
);

#Box office table
CREATE TABLE boxoffice (
    FilmID INT PRIMARY KEY,
    Title VARCHAR(255),
    Release_Date VARCHAR(20),
    DirectorID INT,
    Lead_Actor_Actress VARCHAR(255),
    LanguageID INT,
    Industry VARCHAR(100),
    GenreID INT,
    Budget DECIMAL(10,2),
    First_Day_Collection_Worldwide DECIMAL(10,2),
    Worldwide_Collection_in_Crores DECIMAL(10,2),
    Overseas_Collection DECIMAL(10,2),
    India_Gross_Collection DECIMAL(10,2),
    Verdict VARCHAR(50),
    IMDb_Rating DECIMAL(3,1),
    Runtime_mins INT,
    OTT_Platform VARCHAR(100),
    Year INT,
    Month INT,
    Month_Name VARCHAR(20),
    Week_Name VARCHAR(20),

    FOREIGN KEY (DirectorID)
        REFERENCES director(DirectorID),

    FOREIGN KEY (LanguageID)
        REFERENCES language(LanguageID),

    FOREIGN KEY (GenreID)
        REFERENCES genre(GenreID)
);

SHOW TABLES;

DESCRIBE director;
DESCRIBE genre;
DESCRIBE language;
DESCRIBE boxoffice;
