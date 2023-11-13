-- 1) How many distinct (different) actors' last names are there?
select count(distinct last_name) as number_of_different_last_names
from sakila.actor;

-- 2) In how many different languages where the films originally produced?
select count(distinct language_id) as number_of_different_languages
from sakila.film;

-- 3) How many movies were released with "PG-13" rating?
select count(*) as number_of_movies_released_with_PG_13
from sakila.film
where rating = "PG-13";

-- 4) Getting 10 the longest movies from 2006
select title as ten_longest_movies_from_2006
from sakila.film
where release_year = 2006
order by length desc
limit 10;

-- 5) How many days has been the company operating? ---------------------------------
select datediff(max(last_update), min(rental_date)) as days_operating
from sakila.rental;

-- 6) Show rental info with additional columns month and weekday. Get 20.
select *, date_format(rental_date, "%M") as month, date_format(rental_date, "%W") as weekday_
from sakila.rental
limit 20;

-- 7) Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
case
when weekday(rental_date) >= 5 then "weekend"
else "workday"
end as type_day
from sakila.rental;

-- 8) How many rentals were in the last month of activity?
select *
from sakila.rental
order by rental_date desc;

select count(*) as rentals_in_the_last_day
from sakila.rental
where (date_format(rental_date, "%Y") = date_format(rental_date, "%Y")) and (date_format(rental_date, "%M") = "February");