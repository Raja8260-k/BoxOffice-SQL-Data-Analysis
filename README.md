# BoxOffice SQL Data Analysis

This project is a SQL-based analysis of Indian movie box office data using MySQL.
The project contains 97 SQL questions covering different areas of movie and box office analysis. I worked with raw movie datasets, performed data cleaning and validation, and used SQL queries to extract useful insights from the data.

### Project Overview
# The analysis covers:
- Movie and box office performance
- Industry-wise analysis
- Language-wise analysis
- Director-wise analysis
- Genre-wise analysis
- Ranking and window functions
- Stored procedures
- Year-over-Year (YoY) growth analysis

## Dataset
# The project uses four raw datasets:
- boxoffice.csv – Movie details, collections, budget, ratings, verdict, runtime and other movie information
- director.csv – Director details
- genre.csv – Genre details
- language.csv – Language details

The raw dataset contains information such as Film ID, title, release date, industry, budget, first-day collection, worldwide collection, overseas collection, India gross collection, verdict, IMDb rating, runtime and OTT platform.

## Data Cleaning
Before performing the analysis, I checked and prepared the data using SQL.

# The cleaning and validation steps include:
- Checking NULL values
- Checking duplicate Film IDs
- Checking duplicate movie titles
- Checking minimum and maximum values
- Checking zero and invalid values
- Checking missing director, genre and language information
- Checking leading and trailing spaces
- Validating the data before analysis

## SQL Analysis
The 97 questions are divided into different sections:

### Basic Analysis
Questions 1–20
# Covered topics such as:
- Movie counts
- Budget analysis
- Worldwide collections
- India gross collections
- First-day collections
- Movie ratings
- Runtime
- OTT platforms

### Industry Analysis
Questions 21–36
# Analysis based on:
- Bollywood
- Tollywood
- Kollywood
- Mollywood
- Sandalwood
- Industry-wise budgets and collections
- Industry-wise movie performance

### Language Analysis
Questions 37–49
# Analysis of:
- Movies by language
- Language-wise collections
- Language and industry combinations
- Language-wise movie performance

### Director Analysis
Questions 50–71
# Analysis including:
- Movies directed by each director
- Director-wise budgets
- Director-wise collections
- Director and industry analysis
- Director and language analysis
- Director performance

### Genre Analysis
Questions 72–88
# Analysis including:
- Movies by genre
- Genre-wise budgets and collections
- Genre and industry analysis
- Genre and OTT platform analysis
- Genre-wise runtime
- Genre and verdict analysis

### Window Functions
Questions 89–91
# Used SQL window functions for:
- Movie ranking
- Industry-wise ranking
- IMDb rating ranking
# Functions used include:
- ROW_NUMBER()
- RANK()
- LAG()

### Stored Procedures
Questions 92, 93 and 97
# Created stored procedures for:
- Top 5 movies based on India gross collections
- Industry-wise budget and worldwide collections
- Total number of films and worldwide collections

### Year-over-Year Analysis
Questions 94–96
# Calculated YoY growth for:
- Budget
- Worldwide collections
- India gross collections

### SQL Concepts Used
# Throughout the project, I practiced and used:
-> SELECT
-> WHERE
-> GROUP BY
-> HAVING
-> ORDER BY
-> Aggregate functions
-> JOINS
-> CTEs
-> CASE statements
-> Window functions
-> ROW_NUMBER()
-> RANK()
-> LAG()
-> Stored procedures
-> Data validation and cleaning

# Tools Used
1.MySQL
2.MySQL Workbench

# What I Learned
  Through this project, I practiced working with raw datasets and converting them into structured SQL analysis.
  I also improved my understanding of joins, aggregations, CTEs, window functions, stored procedures and Year-over-Year calculations.
