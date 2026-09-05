#(92)Write a stored procedure to get top 5 films based on India gross colelctions ?
DELIMITER //
 create procedure TOPfilmsIndianGross()
 BEGIN
     select
       Title,
       India_Gross_Collection
     from boxoffice
     order by India_Gross_Collection desc
     limit 5;
  END //
DELIMITER ;
 
 call TOPfilmsIndianGross();
 
 
#(93)Write a stored procdure to get industry Budget and Worldwide total collections? 
-- If we call any industry it will display industry,budget and wordwide total .
DELIMITER //
create procedure IndustryCollections(
          IN p_Industry varchar(50)
)
BEGIN
    select
        Industry,
        sum(Budget) as Total_Budget,
        sum(Worldwide_Collection_in_Crores) as Total_Worldwide_Collection
    from boxoffice
    where Industry = p_Industry
    group by Industry;
END //
DELIMITER ;

CALL IndustryCollections('Bollywood'); 
CALL IndustryCollections('Tollywood'); 
CALL IndustryCollections('Kollywood'); 
CALL IndustryCollections('Mollywood'); 
CALL IndustryCollections('Sandalwood'); 


#(97) Create a stored procedure to get Total films count, world wide total colelctions?
DELIMITER //
create procedure GetTotalfilmsandWorldwidecollection()
BEGIN
     select
          count(*) AS Total_films,
          ROUND(SUM(Worldwide_Collection_in_Crores), 2)
            AS Total_Worldwide_Collection
     from boxoffice;
END //
DELIMITER ;
          
CALL GetTotalfilmsandWorldwidecollection();
