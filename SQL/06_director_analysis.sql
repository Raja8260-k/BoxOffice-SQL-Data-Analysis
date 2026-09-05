#(50)Write a query to get director wise number of films released in from year 2017 to 2019 ?
select 
    D.director,
    count(*) as Total_films
from boxoffice B  
join director D  
       on B.DirectorID = D.DirectorID
where B.Year between '2017' and '2019' 
group by D.director
order by Total_films desc;


#(51)Write a query to get director wise world wide collections ?
select 
    D.director,
    round(sum(B.Worldwide_Collection_in_Crores),2) as Worldwide_collection
from boxoffice B 
join director D 
       on B.DirectorID = D.DirectorID
group by D.Director
order by Worldwide_collection desc; 


#(52)Write a query to get director wise first day world wide collections ?
select
    d.director,
    round(sum(a.First_Day_Collection_Worldwide),2) as first_collect
from boxoffice a 
join director d 
      on a.DirectorID = d.DirectorID
group by d.Director
order by first_collect desc;
       

#(53)Write a query to get director wise India gross collections ?
select 
     d.director,
     round(sum(a.India_Gross_Collection),2) as India_collect
from boxoffice a
join director d 
      on a.DirectorID = d.DirectorID
group by d.director      
order by India_collect desc ;


#(54)Write a query to get director wise overseas collections ?
select 
    d.director,
    round(sum(b.Overseas_Collection),2) as overseas_collect
from boxoffice b 
join director d
       on b.DirectorID = d.DirectorID
group by d.director 
order by overseas_collect desc; 


#(55)Write a query to get director, lead actor/actress and number of films ?  
select
    d.director,
    b.Lead_Actor_Actress,
    count(*) as No_of_films
from boxoffice b 
join director d 
     on b.DirectorID = d.DirectorID
group by 
    d.director,
    b.Lead_Actor_Actress
order by No_of_films desc;  


#(56)Write a query to get films which is having budget on between 150 crores and 277 crores ?
select 
    Title,
    Budget
from boxoffice
where Budget between 150 and 277
order by Budget desc;


#(57)Write a query to get director, week name wise films released ?
select 
     d.director,
     b.Week_Name,
     count(*) as Total_film
from boxoffice b 
join director d 
      on b.DirectorID = d.DirectorID
group by
      d.director, 
      Week_Name
order by Total_film desc;     


#(58)Write a query to get OTT platoform and director wise films released ?
select 
     b.OTT_Platform,
     d.director,
     count(*) as Total_film
from boxoffice b 
join director d 
     on b.DirectorID = b.DirectorID
group by      
    b.OTT_Platform,
    d.director
order by      
    Total_film desc;


#(59)Write a query to get director wise films released on Friday only ?
select 
     d.director,
     b.Week_Name,
     b.Release_Date,
     b.Title
from boxoffice b 
join director d 
     on b.DirectorID = d.DirectorID
where b.Week_Name = 'Friday';   
     
     
#(60)Write a query to get films based on IMDb reating between 6.5 and 7.7 ?
select
     Title,
     IMDb_Rating
from boxoffice 
where IMDb_Rating between '6.5' and '7.7'
order by IMDb_Rating;
     
     
#(61)Write a query to get director,films and IMDb ratings ?
select 
     d.director,
     a.Title,
     a.IMDb_Rating
from boxoffice a 
join director d 
          on a.DirectorID = d.DirectorID
order by a.IMDb_Rating desc;      
       
       
#(62)Write a query to get films with highest budget based flop verdict ?
select
    Title,
    Budget,
    Verdict
from boxoffice
where Verdict = 'Flop'
order by Budget desc;    
          
          
#(63) Write a query to get total number of directors ?          
select 
    count(*) as total_Directors
from director;    


#(64) Write a query to get vedridct wise total films released ?
select 
    Verdict,
    count(*) as Total_films
from boxoffice
group by Verdict
order by Total_films desc;    


#(65) Write a query to get top 10 directors based number of films ?
select 
     d.director,
     count(*) as Total_films
from boxoffice b 
join director d 
        on b.DirectorID = d.DirectorID
group by d.director
order by Total_films desc
limit 10;
        

#(66)Write a query to get top 5 directors based on world wide collections and alsoindustry wise?
with Rankedfilm as (
  select 
    d.director,
    sum(a.Worldwide_Collection_in_Crores) as worldwide_collect,
    a.Industry,
    row_number() over(
    partition by a.Industry 
    order by sum(a.Worldwide_Collection_in_Crores) desc) as Industry_rank
  from boxoffice a 
  join director d 
      on a.DirectorID = d.DirectorID   
  group by d.director,a.Industry         
)
select
    director,
    Industry,
    worldwide_collect
from Rankedfilm
where Industry_rank <= 5;     


#(67)Write a query to get top 3 directors based on India gross collections in Bollowood industry ?
select
    d.director,
    a.Industry,
    sum(a.India_Gross_Collection) as India_gross
from boxoffice a 
join director d 
       on a.DirectorID = d.DirectorID
where a.Industry = 'Bollywood'       
group by d.director 
order by India_gross desc
limit 3;


#(68)Write a query to get top 3 directors based on India gross collections in Tollowood industry?
select
    d.director,
    a.Industry,
    sum(a.India_Gross_Collection) as India_gross
from boxoffice a 
join director d 
       on a.DirectorID = d.DirectorID
where a.Industry = 'Tollywood'       
group by d.director 
order by India_gross desc
limit 3;


#(69)Write a query to get top 3 directors based on India gross collections in Kollowood industry?
select
    d.director,
    a.Industry,
    sum(a.India_Gross_Collection) as India_gross
from boxoffice a 
join director d 
       on a.DirectorID = d.DirectorID
where a.Industry = 'Kollywood'       
group by d.director 
order by India_gross desc
limit 3;


#(70) Write a query to get top 3 directors based on India gross collections in Mollowood industry ?
select
    d.director,
    a.Industry,
    sum(a.India_Gross_Collection) as India_gross
from boxoffice a 
join director d 
       on a.DirectorID = d.DirectorID
where a.Industry = 'Mollywood'       
group by d.director 
order by India_gross desc
limit 3;


#(71)Write a query to get top 3 directors based on India gross collections in Sandalwood industry ?
select
    d.director,
    a.Industry,
    sum(a.India_Gross_Collection) as India_gross
from boxoffice a 
join director d 
       on a.DirectorID = d.DirectorID
where a.Industry = 'Sandalwood'       
group by d.director 
order by India_gross desc
limit 3;
