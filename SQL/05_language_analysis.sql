#(37)Write a query to get language wise budget ? 
select
    a.language,
    round(sum(b.Budget)) as Total_Budget
from boxoffice b
join language a
      on b.LanguageID = a.LanguageID 
group by a.language
order by Total_Budget desc;


#(38)Write a query to get language wise how many directors are there ?
select 
     a.language,
     count(distinct b.DirectorID) as Total_Director
from language a
join boxoffice b     
       on a.LanguageID = b.LanguageID
group by a.Language
order by Total_Director desc;


#(39)Write a query to get language wise worldwide total collection ?
select
    l.language,
    round(sum(b.Worldwide_Collection_in_Crores)) as Total_worldwide_collection
from boxoffice b 
join language l 
    on b.LanguageID = l.LanguageID
group by l.Language
order by Total_worldwide_collection desc;


#(40)Write a query to get language, lead actor/actress wise films they acted ?
select 
     count(*) as Total_Films,
     a.language,
     b.Lead_Actor_Actress
from boxoffice b 
join language a 
    on a.LanguageID = b.LanguageID
group by 
     a.language,
     b.Lead_Actor_Actress
order by  
     a.language,
     Total_Films desc;


#(41)Write a query to get language, year wise films released ?
select 
       count(*) as Total_Films,
       a.language,
       b.Year
from boxoffice b 
join language a 
     on a.LanguageID = b.LanguageID
group by
       a.language,
       b.Year
order by  
       a.language,
       b.Year;


#(42)Write a query to get films which was not released on overseas ?
select 
    Title,
    Industry,
    Overseas_Collection
from boxoffice
where Overseas_Collection = 0;


#(43)Write a query to get language wise top 3 longest runtime movies ?
with RankedMovies as (
   select
     b.Title,
     a.language,
     b.Runtime_mins,
     row_number() over(partition by a.language
     order by b.Runtime_mins desc) as Runtime_rank
from boxoffice b 
join language a 
     on a.LanguageID = b.LanguageID
)

select
    language,
    Title,
    Runtime_mins
from RankedMovies
where Runtime_rank <= 3
order by language, Runtime_mins desc;


#(44)Write a query to get language wise bottom 5 shortest runtime moves ?
with RankedMovies as (
    select 
        a.Title,
        a.Runtime_mins,
        l.language,
        row_number() over(partition by l.language
        order by a.Runtime_mins asc) As Runtime_Rank
    from boxoffice a 
    join language l 
         on a.LanguageID = l.LanguageID
)

select 
    Title,
    language,
    Runtime_mins
from RankedMovies 
where Runtime_Rank <= 5;


#(45)Write a query to get language wise top 5 films based first day collections ?
with RankedFilms as (
    select
        a.Title,
        l.language,
        a.First_Day_Collection_Worldwide,
        row_number() over(partition by l.language 
        order by a.First_Day_Collection_Worldwide desc) as Collection_rank
    from boxoffice a 
    join language l 
         on a.LanguageID = l.LanguageID
)

select 
    Title,
    language,
    First_Day_Collection_Worldwide
from RankedFilms
where Collection_rank <= 5
order by language, First_Day_Collection_Worldwide desc;


#(46)Write a query to get language wise top 5 films based India gross collections ?
with RankedFilm as (
   select 
       a.Title,
       l.language,
       a.India_Gross_Collection,
       row_number() over(partition by l.language
       order by a.India_Gross_Collection desc) as Indian_rank
   from boxoffice a 
   join language l 
        on a.LanguageID = l.LanguageID
)
select
    Title,
    language,
    India_Gross_Collection
from RankedFilm
where Indian_rank <= 5
order by language, India_Gross_Collection desc;


#(47)Write a query to get language, Director wise films count ?
select
    count(*) as Total_films, 
    L.language,
    D.director
from boxoffice B 
join language L    
      on B.LanguageID = L.LanguageID
join director D 
      on B.DirectorID = D.DirectorID
group by
       D.director,
       L.Language
order by
       L.Language,
       Total_films desc;

#(48)Write a query to get language wise OTT platofrm wise fims count ?
select 
     b.OTT_Platform,
     l.language,
     count(*) as Total_films
from boxoffice b 
join language l 
     on b.LanguageID = l.LanguageID
group by 
       l.Language,
       b.OTT_Platform
order by 
       l.Language,
       Total_films desc;

#(49)What are top 10 films based on language and first day collection ?
select 
    a.Title,
    l.language,
    a.First_Day_Collection_Worldwide
from boxoffice a 
join language l 
       on a.LanguageID = l.LanguageID
order by a.First_Day_Collection_Worldwide desc
limit 10;
