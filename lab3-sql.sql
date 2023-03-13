 
-- How many distinct (different) actors' last names are there?
SELECT *
FROM sakila.actor;

SELECT
	COUNT(DISTINCT last_name)
FROM sakila.actor;


-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT *
FROM sakila.film;

SELECT
	COUNT(DISTINCT language_id)
FROM sakila.film;

-- How many movies were released with "PG-13" rating?
SELECT *
FROM sakila.film;

SELECT 
	Count(*)
FROM sakila.film
WHERE rating = 'PG-13';


-- Get 10 the longest movies from 2006.

SELECT *
FROM sakila.film;

SELECT *
FROM sakila.film 
WHERE release_year = '2006'
ORDER BY length  DESC
LIMIT 10;

-- How many days has been the company operating (check DATEDIFF() function)? 
SELECT *
FROM sakila.staff;

SELECT *
FROM sakila.store;

SELECT 
    DATEDIFF(max(last_update),min(rental_date))
FROM sakila.rental;


-- Show rental info with additional columns month and weekday. Get 20.
SELECT *,
	date_format(convert(rental_date,date),'%M') as Month,
	date_format(convert(rental_date,date),'%a') as Weekday
FROM sakila.rental
LIMIT 20;


-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. 
SELECT *,
	date_format(convert(rental_date,date),'%M') as Month,
	date_format(convert(rental_date,date),'%a') as Weekday,
    rental_date,
    case
		when 'Weekday' = 'Sat' OR 'Sun' then 'weekend'
        else 'workday'
        end as 'day_type' 
FROM sakila.rental
LIMIT 20;


-- How many rentals were in the last month of activity? 
SELECT 
	date_format(max(rental_date),'%Y-%M') as 'last_month'
FROM sakila.rental;

SELECT COUNT(rental_date)
FROM sakila.rental
WHERE date_format((rental_date),'%Y-%M') < 'last_month';

SELECT *
FROM sakila.rental










