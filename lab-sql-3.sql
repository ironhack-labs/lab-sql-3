-- Instructions
-- How many distinct (different) actors' last names are there?

Select 
count(distinct last_name)
From sakila.actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)

Select
count(distinct language_id)
From sakila.film;

-- How many movies were released with "PG-13" rating?

Select
count(rating)
From sakila.film
where rating = 'PG-13';

-- Get 10 the longest movies from 2006.

Select
title,
length,
release_year
From sakila.film
where release_year = 2006
order by length Desc limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?

SELECT
    DATEDIFF(substring_index(last_update, ' ', 1), substring_index(rental_date, ' ', 1)) AS DateDiff
FROM sakila.rental;

-- Show rental info with additional columns month and weekday. Get 20.

Select
rental_id,
month(rental_date) as month_rental_date,
dayname(rental_date) as weekday_rental_date,
inventory_id,
customer_id,
return_date,
month(return_date) as month_return_date,
dayname(return_date) as weekday_return_date,
staff_id,
last_update,
month(last_update) as last_update_date,
dayname(last_update) as weekday_last_update
from sakila.rental;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select
*,
dayname(rental_date) as weekday_rental_date,
case
when dayname(rental_date) = 'Saturday' then 'weekend'
when dayname(rental_date) = 'Sunday' then 'weekend'
else 'workday'
end as 'day_type'
from sakila.rental;

-- How many rentals were in the last month of activity?

SELECT
    count(rental_date)
FROM sakila.rental
WHERE date_format(rental_date,'%Y-%M') = (SELECT max(date_format(rental_date,'%Y-%M')) FROM sakila.rental)


    
