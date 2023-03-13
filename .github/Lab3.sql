use sakila;
-- How many distinct (different) actors' last names are there? - 121

select 
	*
from sakila.actor;

select 
	count(distinct(last_name))
from sakila.actor;
-- In how many different languages where the films originally produced? (Use the column language_id from the film table) - 1
select 
	count(distinct(language_id))
from sakila.film;
-- How many movies were released with "PG-13" rating? - 223
select 
	*
from sakila.rental;

select 
	count(rating)
from sakila.film
where rating = 'PG-13';
    
-- Get 10 the longest movies from 2006.
SELECT title, length
FROM sakila.film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;

-- How many days has been the company operating (check DATEDIFF() function)? -6502 if it is still operating like the question suggests
SELECT DATEDIFF(CURDATE(), MIN(rental_date)) AS days_since_first_rental
FROM sakila.rental;

-- Show rental info with additional columns month and weekday. Get 20.
SELECT rental_date, DATE_FORMAT(rental_date, '%M') AS month, DATE_FORMAT(rental_date, '%W') AS weekday
FROM sakila.rental
LIMIT 20;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT rental_date, DATE_FORMAT(rental_date, '%M') AS month, DATE_FORMAT(rental_date, '%W') AS weekday,
       CASE 
       WHEN DAYOFWEEK(rental_date) IN (1,7) 
       THEN 'weekend' 
       ELSE 'workday' 
       END AS day_type
FROM sakila.rental
LIMIT 20;

-- How many rentals were in the last month of activity? 182
SELECT MAX(rental_date) AS max_rental_date
FROM sakila.rental;

SELECT COUNT(*) AS num_rentals
FROM sakila.rental
WHERE YEAR(rental_date) = 2006 AND MONTH(rental_date) = 2;