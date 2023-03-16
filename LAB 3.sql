-- How many distinct (different) actors' last names are there?

SELECT
Count(Distinct(last_name))
FROM sakila.actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)

SELECT 
COUNT(DISTINCT(language_id))
FROM sakila.film;
-- How many movies were released with "PG-13" rating?
SELECT 
count(rating)
FROM sakila.film
WHERE rating = 'PG-13';
-- Get 10 the longest movies from 2006.
SELECT
title,
length,
release_year
FROM sakila.film
WHERE release_year = 2006
order by length Desc LIMIT 10;

-- How many days has been the company operating (check DATEDIFF() function)?
SELECT
DATEDIFF (last_update, min(rental_date)) AS DateDiff
FROM sakila.rental
GROUP BY last_update;


-- Show rental info with additional columns month and weekday. Get 20.
SELECT *,
	
	date_format(rental_date,'%M'),
    date_format(rental_date,'%W'),
	date_format(return_date,'%M'),
    date_format(return_date,'%W'),
	date_format(last_update,'%M'),
    date_format(last_update,'%W')
FROM sakila.rental;


-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
	rental_date,
    case
		when  date_format(rental_date,'%W') = 'Saturday' then 'Weekend'
        when  date_format(rental_date,'%W') = 'Sunday' then 'Weekend'
        else 'Workday'
        end as 'day_type'
FROM sakila.rental;

-- How many rentals were in the last month of activity?

SELECT
    count(rental_date)
FROM sakila.rental
WHERE date_format(rental_date,'%Y-%M') = (SELECT max(date_format(rental_date,'%Y-%M')) FROM sakila.rental)
