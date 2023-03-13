-- How many distinct (different) actors' last names are there?

SELECT 
	COUNT(distinct(last_name)) as diff_Last_names
FROM sakila.actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)

SELECT
	COUNT(distinct(language_id)) as diff_languages
FROM sakila.film;

-- How many movies were released with "PG-13" rating?

SELECT
	COUNT(rating)
FROM sakila.film
WHERE rating = 'PG-13';

-- Get 10 the longest movies from 2006.

SELECT
    title,
	length
FROM sakila.film
WHERE release_year = '2006'
ORDER BY length desc
LIMIT 10;

-- How many days has been the company operating (check DATEDIFF() function)?

SELECT
max(rental_date),
min(rental_date),
DATEDIFF(max(rental_date), min(rental_date)) as Operation_Days
FROM sakila.rental;

-- Show rental info with additional columns month and weekday. Get 20.

SELECT
rental_date,
date_format(rental_date, '%M') as M,
date_format(rental_date, '%W') as Weekday
FROM sakila.rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT
	rental_date,
date_format(rental_date, '%M') as M,
date_format(rental_date, '%W') as Weekday,
    case
		when date_format(rental_date, '%W') = 'Saturday' or 'Sunday' then 'Weekend'
	else 'Workday'
    end as 'Day_Type'
FROM sakila.rental;

-- How many rentals were in the last month of activity?

SELECT
date_format(max(rental_date),"%M"),
date_format(max(rental_date),"%Y"),
count(rental_id) 
FROM sakila.rental
WHERE date_format(rental_date,'%Y-%M') = max(date_format(rental_date,'%Y-%M'))