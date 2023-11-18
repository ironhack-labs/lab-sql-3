-- How many distinct (different) actors' last names are there?
 
 select last_name
 from sakila.actor;
 
SELECT COUNT(DISTINCT last_name) AS different_last_names_count
FROM sakila.actor;
 
 --  how many different languages where the films originally produced? (Use the column language_id from the film table)
 
 select language_id
from sakila.language;
 
 select count(distinct language_id) as number_of_languages
 from sakila.language;

-- How many movies were released with "PG-13" rating?

select *
from sakila.film;


select count(distinct release_year) as number_of_movies_released
from sakila.film;
where rating = 'PG-13'



-- Get 10 the longest movies from 2006.

select *
from sakila.film;
where rating

SELECT description, length, release_year
FROM sakila.film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;


-- How many days has been the company operating (check DATEDIFF() function)?

SELECT DATEDIFF(CURDATE(), start_date) AS days_operating
FROM last_update;

-- Show rental info with additional columns month and weekday. Get 20.

select *,
month(rental_date) as rental_month,
dayname(rental_date) as rental_weekday,
month(return_date) as return_month,
dayname(return_date) as return_weekday
from sakila.rental
limit 20;

-- Or like this: 
select *,
date_format(rental_date,'%M') as rental_date_month,
date_format(rental_date,'%W') as rental_date_weekday,
date_format(return_date,'%M') as return_date_month,
date_format(return_date,'%W') as return_date_weekday
from sakila.rental
limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
date_format(rental_date, '%M') as rental_date_month,
date_format(rental_date, '%W') as rental_date_weekday,
	case
		when rental_date is null then 'rental_day is missing / Null value'
		when dayname(rental_date) in ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') then 'workday'
		when dayname(rental_date) in ('Saturday', 'Sunday') then 'weekend'
	else 'No information'
	end as rental_date_grouped
from sakila.rental;

-- How many rentals were in the last month of activity?
-- 182 rentals occured 
select count(rental_date)
from sakila.rental
where date_format(rental_date,'%Y-%M') = (select max(date_format(rental_date,'%Y-%M')) from sakila.rental);

