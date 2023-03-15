use sakila;

-- 1. How many distinct (different) actors' last names are there?

select count(distinct last_name) as distinct_surname
FROM sakila.actor;

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)

select count(distinct language_id) as number_of_languages
FROM sakila.film;

-- 3. How many movies were released with "PG-13" rating?

select count(rating)
from sakila.film
where rating = 'PG-13';

-- 4. Get 10 the longest movies from 2006

SELECT length, title
from sakila.film
where release_year = '2006'
order by length desc
limit 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?
 select max(datediff(curdate(), rental_date)) as operating_days
 from sakila.rental;
 
 select datediff(max(rental_date),min(rental_date))
 from sakila.rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.

select 
	rental_date,
    date_format(convert(rental_date,date),'%M') as Month,
    date_format(convert(rental_date,date),'%W') as Days
from sakila.rental;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week

select rental_date,
	case 
		when date_format(rental_date,'%W') in ('Saturday','Sunday') then 'Weekend'
		else "Weekday"
	end as "What the day is?"
from sakila.rental
limit 20;

-- 8. How many rentals were in the last month of activity?last_update

SELECT MAX(rental_date) AS max_rental_date
FROM sakila.rental;

SELECT COUNT(*) AS num_rentals
FROM sakila.rental
WHERE YEAR(rental_date) = 2006 AND MONTH(rental_date) = 2;









