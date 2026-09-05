#(89) Write a query to get 5th rank movie based on Worldwide total collections ?
with Rankedmovie as (
	select
	    Title,
        Worldwide_Collection_in_Crores,
        row_number() over(
              order by Worldwide_Collection_in_Crores desc
	    ) as rnk_film
	from boxoffice
)
select
    Title,
    Worldwide_Collection_in_Crores,
    rnk_film
from  Rankedmovie
where rnk_film = 5;


#(90)Write a query to get 5th rank movie by industry wise based on First day worldwide collections?
with Rankfilms as (
   select
        Title,
        Industry,
        First_Day_Collection_Worldwide,
        row_number() over(partition by Industry
        order by First_Day_Collection_Worldwide desc
        ) as movie_rnk
    from boxoffice
)
 select
     Title,
	 Industry,
	 First_Day_Collection_Worldwide,
     movie_rnk
from  Rankfilms    
where movie_rnk = 5 
order by  First_Day_Collection_Worldwide desc ;


#(91) Write a query to get 3rd rank movie by industry wise based on IMDb Ratings ?
with rankfilms as (
   select 
      Title,
      Industry,
      IMDb_Rating,
      row_number() over(partition by Industry
      order by IMDb_Rating desc) as Industry_rnk
    from boxoffice
)
select 
     Title,
	 Industry,
	 IMDb_Rating,
     Industry_rnk
from rankfilms
where Industry_rnk = 3;
