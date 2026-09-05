#(21)Top7 movies by world wide collection in Bollywood ?
SELECT 
     Title,
     Worldwide_Collection_in_Crores
FROM boxoffice
WHERE Industry = 'Bollywood'
ORDER BY Worldwide_Collection_in_Crores DESC
LIMIT 7;

#(22)Top7 movies by world wide collection in Tollywood ?
SELECT 
     Title,
     Worldwide_Collection_in_Crores
FROM boxoffice
WHERE Industry = 'Tollywood'
ORDER BY Worldwide_Collection_in_Crores DESC
LIMIT 7;

#(23)Top7 movies by world wide collection in Kollywood ?
SELECT 
    Title,
    Worldwide_Collection_in_Crores
FROM boxoffice
WHERE Industry = 'Kollywood'
ORDER BY Worldwide_Collection_in_Crores DESC
LIMIT 7;

#(24)Top7 movies by world wide collection in Sandalwood ?
SELECT 
    Title,
    Worldwide_Collection_in_Crores
FROM boxoffice
WHERE Industry = 'Sandalwood'
ORDER BY Worldwide_Collection_in_Crores DESC
LIMIT 7;

#(25)Top7 movies by world wide collection in Mollywood ?
SELECT 
    Title,
    Worldwide_Collection_in_Crores
FROM boxoffice
WHERE Industry = 'Mollywood'
ORDER BY Worldwide_Collection_in_Crores DESC
LIMIT 7;

#(26)Write query to display industry and verdict wise films count ?
SELECT
     Industry,
     Verdict,
     COUNT(*) AS Total_Count
FROM boxoffice
GROUP BY Industry, Verdict
ORDER BY Industry, Total_Count DESC;

#(27)Write query to get films based on budget in Bollowood ?
SELECT
     Title,
     Budget
FROM boxoffice
WHERE Industry = 'Bollywood'
ORDER BY Budget DESC;

#(28)Write query to get films based on budget in Tollywood ?
SELECT
   Title,
   Budget
FROM boxoffice
WHERE Industry = 'Tollywood'
ORDER BY Budget DESC;

#(29)Write query to get films based on budget in Kollywood ?
SELECT
    Title,
    Budget
FROM boxoffice
WHERE Industry = 'Kollywood'
ORDER BY Budget DESC;

#(30)Write query to get films based on budget in Sandalwood ?
SELECT
    Title,
    Budget
FROM boxoffice
WHERE Industry = 'Sandalwood'
ORDER BY Budget DESC;

#(31)Write query to get films based on budget in Mollywood ?
SELECT
     Title,
     Budget
FROM boxoffice
WHERE Industry = 'Mollywood'
ORDER BY Budget DESC;

#(32)Top 5 movies by IMDb rating from Bollowood ?
SELECT
    Title,
    IMDb_Rating
FROM boxoffice
WHERE Industry = 'Bollywood'
ORDER BY IMDb_Rating DESC
LIMIT 5;

#(33)Top 5 movies by IMDb rating from Kollywood ?
SELECT
    Title,
    IMDb_Rating
FROM boxoffice
WHERE Industry = 'Kollywood'
ORDER BY IMDb_Rating DESC
LIMIT 5;

#(34)Top 5 movies by IMDb rating from Tollywood ?
SELECT 
    Title,
    IMDb_Rating
FROM boxoffice
WHERE Industry = 'Tollywood'
ORDER BY IMDb_Rating DESC
LIMIT 5;

#(35)Top 5 movies by IMDb rating from Sandalwood ?
SELECT
    Title,
    IMDb_Rating
FROM boxoffice
WHERE Industry = 'Sandalwood'
ORDER BY IMDb_Rating DESC
LIMIT 5;

#(36)Top 5 movies by IMDb rating from Mollywood ?
SELECT
    Title,
    IMDb_Rating
FROM boxoffice
WHERE Industry = 'Mollywood'
ORDER BY IMDb_Rating DESC
LIMIT 5;
