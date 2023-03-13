use sakila;


-- 1.How many distinct (different) actors' last names are there?
SELECT count(distinct(last_name)) as different_last_names from actor;

-- 2.In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT language_id) AS different_languages FROM film; -- 2

-- 3.How many movies were released with "PG-13" rating?
SELECT COUNT(*) AS num_pg13_movies FROM film WHERE rating = 'PG-13'; -- 3

-- 4.Get 10 the longest movies from 2006.
SELECT title, length FROM film WHERE release_year = 2006 ORDER BY length DESC LIMIT 10; -- 4

-- 5.How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating FROM rental;

-- 6.Show rental info with additional columns month and weekday. Get 20.
SELECT *, MONTH(rental_date) AS rental_month, DAYNAME(rental_date) AS rental_weekday FROM rental LIMIT 20;

-- 7.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, 
       MONTH(rental_date) AS rental_month, 
       DAYNAME(rental_date) AS rental_weekday, 
       CASE WHEN DAYOFWEEK(rental_date) IN (1,7) THEN 'weekend' ELSE 'workday' END AS day_type 
FROM rental;

-- 8.How many rentals were in the last month of activity?
SELECT COUNT(*) AS num_rentals_last_month FROM rental WHERE rental_date >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
