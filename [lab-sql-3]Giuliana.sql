-- How many distinct (different) actors' last names are there? 121
select count(distinct last_name) as amount_last_names
from sakila.actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id) as amount_languages # only 1
from sakila.film;

-- How many movies were released with "PG-13" rating?
select count(*)
from sakila.film
where rating = 'PG-13'; 

-- Get 10 the longest movies from 2006
select title
from sakila.film
where release_year = '2006'
order by length desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)? 266 days

select datediff(max(rental_date), min(rental_date)) as days_operating
from sakila.rental;

-- Show rental info with additional columns month and weekday. Get 20.
select *,  date_format(convert(rental_date, date), '%M') as rental_month, date_format(convert(rental_date, date), '%W') as week_day
from sakila.rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week
select *,  
case
when date_format(convert(rental_date, date), '%W') = 'Saturday' then 'weekend'
when date_format(convert(rental_date, date), '%W') = 'Sunday' then 'weekend'
else 'weekday'
end as day_type
from sakila.rental;


-- How many rentals were in the last month of activity?
-- I first identify the last month of activity
select rental_date 
from sakila.rental
order by rental_date desc
limit 1;

-- Now I select and count the results of February 2006. I used the rental_date column because some of the clients might not have returned
-- their films
select count(rental_date) as total_rentals
from sakila.rental
where extract(year_month from rental_date) = 200602;