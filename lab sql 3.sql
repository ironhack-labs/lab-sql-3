8. How many rentals were in the last month of activity?


select * from sakila.film;
-- 1. How many distinct (different) actors' last names are there? 121
select count(distinct last_name) as distinct_last_name
from sakila.actor;

-- 2. In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table) 
select distinct(language_id)
from sakila.film; -- Just one language

-- 3. How many movies were released with `"PG-13"` rating? 
select count(rating)
from sakila.film
where rating = 'PG-13'; -- 223

-- 4. Get 10 the longest movies from 2006.
select *
from sakila.film
where release_year = 2006
order by length desc
limit 10; 

-- 5. How many days has been the company operating (check `DATEDIFF()` function)? 266 days
select datediff(max(rental_date),min(rental_date))
from sakila.rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.

-- select * from sakila.rental;

SELECT *,
	DATE_FORMAT(CONVERT(rental_date, date), '%M') AS rental_month,
	DATE_FORMAT(CONVERT(rental_date, date), '%W') AS rental_weekday
FROM sakila.rental
Limit 20;

-- 7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
    CASE
        WHEN DAYNAME(CONVERT(rental_date, date)) = 'Saturday' OR DAYNAME(CONVERT(rental_date, date)) = 'Sunday'
            THEN 'weekend'
        ELSE 'workday'
    END AS day_type
FROM sakila.rental;

-- 8. How many rentals were in the last month of activity?


SELECT *,
	DATE_FORMAT(CONVERT(rental_date, date), '%M') AS rental_month
FROM sakila.rental
order by rental_date desc;

-- February is the last month

SELECT count(*) as rental_count
FROM sakila.rental
WHERE DATE_FORMAT(CONVERT(rental_date, DATE), '%M') = 'February';



