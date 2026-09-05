#(1)Write a query to get Total films released ?
SELECT 
    COUNT(*) AS Total_Films
FROM boxoffice ;

#(2)Write a query to get Total budget ? 
SELECT 
    SUM(Budget) as Total_Budget
FROM boxoffice;

#(3)Write a query to get Total worldwide collection ?
SELECT 
    SUM(Worldwide_Collection_in_Crores) as Total_Worldwide_Collection
FROM boxoffice;

#(4)Write a query to get Total First day collection worldwide ?
SELECT 
    SUM(First_Day_Collection_Worldwide) AS total_First_Day_Collection
FROM boxoffice;    

#(5)Write a query to get Total Overseas collection ? 
SELECT
	SUM(Overseas_Collection) AS Total_Overseas_Collection
FROM boxoffice; 

#(6)Write a query to get Total India Gross collection ?
SELECT 
    SUM(India_Gross_Collection) AS Total_India_Gross_Collection
FROM boxoffice;    

#(7)Top 10 filmsbased on world wide collections. Display films,collections ?
SELECT
     Title,
     Worldwide_Collection_in_Crores
FROM boxoffice
order by Worldwide_Collection_in_Crores DESC
LIMIT 10;

#(8)Total Number of films released by year ?
SELECT 
     Year,
     COUNT(*) AS Total_Films
FROM boxoffice
GROUP BY Year
ORDER BY Year;    

#(9)Top 10 filmsbased on india collections.Display films,collections ?
SELECT
     Title,
     India_Gross_Collection
FROM boxoffice
ORDER BY India_Gross_Collection DESC
LIMIT 10 ;

#(10)Top 10 filmsbased on overses collections.Display films,collections ?
SELECT
     Title,
     Overseas_Collection
FROM boxoffice
ORDER BY Overseas_Collection DESC
LIMIT 10;     
     
#(11)Top 10 filmsbased on firstday collections.Display films,collections ?
SELECT
     Title,
     First_Day_Collection_Worldwide
FROM boxoffice
ORDER BY First_Day_Collection_Worldwide DESC
LIMIT 10;   

#(12)Weekday wise films released,Display week name and no of films released ?
SELECT
     Week_Name,
     COUNT(*) AS Total_fIlms
FROM boxoffice
GROUP BY Week_Name
ORDER BY Total_films DESC;    

#(13)Write a query to get OTT platofrm wise movies count ?
SELECT 
     OTT_Platform,
     COUNT(*) AS Total_Films
FROM boxoffice
GROUP BY OTT_Platform
ORDER BY Total_Films desc;   

#(14)Top 10 Directors by films released ?
SELECT 
	 d.Director,
     COUNT(*) AS Total_Films
FROM boxoffice b
JOIN director d
    ON b.DirectorID = d.DirectorID
GROUP BY d.director    
ORDER BY Total_Films desc
limit 10;

#(15)Top 10 directors by world wide collection ?
SELECT
     d.director,
     ROUND(SUM(Worldwide_Collection_in_Crores)) AS Total_Worldwide_Collection
FROM boxoffice b 
JOIN director d
     ON b.DirectorID = d.DirectorID
GROUP BY d.director     
ORDER BY Total_Worldwide_Collection DESC
LIMIT 10;

#(16)Top10 lead actors by world wide collection ?
SELECT
      Lead_Actor_Actress,
      ROUND(SUM(Worldwide_Collection_in_Crores)) AS Total_Worldwide_Collection
FROM boxoffice
GROUP BY Lead_Actor_Actress
ORDER BY Total_Worldwide_Collection DESC
LIMIT 10;      

#(17)Top 10 movies by IMDb rating ?
SELECT
     IMDb_Rating,
     Title
FROM boxoffice
ORDER BY IMDb_Rating DESC
LIMIT 10;     

#(18)Bottom 10 movies by IMDb rating ?
SELECT
     IMDb_Rating,
     Title
FROM boxoffice
ORDER BY IMDb_Rating ASC
LIMIT 10;   

#(19)Write a query to get 5 longest runtime movies ?
SELECT 
	TitlE,
    Runtime_mins
FROM boxoffice
ORDER BY Runtime_mins DESC
LIMIT 5;    

#(20)Write a query to get 5 shortest run time movies ?
SELECT 
     Title,
     Runtime_mins
FROM boxoffice
ORDER BY Runtime_mins ASC
LIMIT 5;
