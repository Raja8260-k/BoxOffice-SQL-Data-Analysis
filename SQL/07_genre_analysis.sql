#(72)Write to get total number of generes?
select
    count(*) as Total_Genres
from genre;


#(73)Write query to get director,language,genere films count?
select
    d.Director,
    l.Language,
    g.Genre,
    count(*) as Total_Films
from boxoffice b
join director d
    on b.DirectorID = d.DirectorID
join language l
    on b.LanguageID = l.LanguageID
join genre g
    on b.GenreID = g.GenreID
group by
    d.Director,
    l.Language,
    g.Genre
order by Total_Films desc;


#(74)Write a query to genere wise budget?
select
    g.Genre,
    sum(b.Budget) as Total_Budget
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
group by g.Genre
order by Total_Budget desc;


#(75)Write a query to get genere wise first day worldwide collections?
select
    g.Genre,
    sum(b.First_Day_Collection_Worldwide) as First_Day_Collection
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
group by g.Genre
order by First_Day_Collection desc;


#(76)Write a query to get genere wise overseas collections?
select
    g.Genre,
    sum(b.Overseas_Collection) as Overseas_Collection
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
group by g.Genre
order by Overseas_Collection desc;


#(77)Write a query to get genere wise India gross collections?
select
    g.Genre,
    sum(b.India_Gross_Collection) as India_Gross_Collection
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
group by g.Genre
order by India_Gross_Collection desc;


#(78)Write a query to get genere wise top 2 longest run time movies?
with RankedMovies as (
    select
        b.Title,
        g.Genre,
        b.Runtime_mins,
        row_number() over(
            partition by g.Genre
            order by b.Runtime_mins desc
        ) as Runtime_Rank
    from boxoffice b
    join genre g
        on b.GenreID = g.GenreID
)
select
    Genre,
    Title,
    Runtime_mins
from RankedMovies
where Runtime_Rank <= 2
order by Genre, Runtime_mins desc;


#(79)Write a query to get genere wise bottom shortest runtime movies?
with RankedMovies as (
    select
        b.Title,
        g.Genre,
        b.Runtime_mins,
        row_number() over(
            partition by g.Genre
            order by b.Runtime_mins asc
        ) as Runtime_Rank
    from boxoffice b
    join genre g
        on b.GenreID = g.GenreID
)
select
    Genre,
    Title,
    Runtime_mins
from RankedMovies
where Runtime_Rank = 1
order by Genre, Runtime_mins;


#(80)Write a query to get verdict, genere wise films released?
select
    b.Verdict,
    g.Genre,
    count(*) as Total_Films
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
group by
    b.Verdict,
    g.Genre
order by Total_Films desc;


#(81)Write a query to get genere, OTT platform wise films count?
select
    g.Genre,
    b.OTT_Platform,
    count(*) as Total_Films
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
group by
    g.Genre,
    b.OTT_Platform
order by Total_Films desc;


#(82)Write a query to get genere wise films count?
select
    g.Genre,
    count(*) as Total_Films
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
group by g.Genre
order by Total_Films desc;


#(83)Write a query to get genere wise films count in Tollowood Industry?
select
    g.Genre,
    count(*) as Total_Films
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
where b.Industry = 'Tollywood'
group by g.Genre
order by Total_Films desc;


#(84)Write a query to get genere wise films count in Kollowood Industry?
select
    g.Genre,
    count(*) as Total_Films
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
where b.Industry = 'Kollywood'
group by g.Genre
order by Total_Films desc;


#(85)Write a query to get genere wise films count in Mollowood Industry?
select
    g.Genre,
    count(*) as Total_Films
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
where b.Industry = 'Mollywood'
group by g.Genre
order by Total_Films desc;


#(86)Write a query to get genere wise films count in Bollowood Industry?
select
    g.Genre,
    count(*) as Total_Films
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
where b.Industry = 'Bollywood'
group by g.Genre
order by Total_Films desc;


#(87)Write a query to get genere wise films count in Sandalwood Industry?
select
    g.Genre,
    count(*) as Total_Films
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
where b.Industry = 'Sandalwood'
group by g.Genre
order by Total_Films desc;


#(88)Write a query to get lead actors/actress wise,genere and films count?
select
    b.Lead_Actor_Actress,
    g.Genre,
    count(*) as Total_Films
from boxoffice b
join genre g
    on b.GenreID = g.GenreID
group by
    b.Lead_Actor_Actress,
    g.Genre
order by Total_Films desc;
