
-- 1. How many distinct (different) actors' last names are there?
select count(distinct(last_name), concat(first_name, ' ', last_name))
from sakila.actor;


-- 2. In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table)
select count(distinct(language_id))
from sakila.film;


-- 3. How many movies were released with `"PG-13"` rating?
select count(rating)
from sakila.film
where rating='PG-13';


-- 4. Get 10 the longest movies from 2006.
select max(length)
from sakila.film
limit 10;


-- 5. How many days has been the company operating (check `DATEDIFF()` function)? 
select datediff(max(rental_date), min(rental_date))
from sakila.rental;


-- 6. Show rental info with additional columns month and weekday. Get 20.
select *, rental_date
from sakila.rental;

select*, date_format(rental_date,'%M') as month, date_format(rental_date, '%a') as weekday
from sakila.rental
limit 20;

-- 7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.
select*,
case
when rental_date is null then 'Rental date is missing'
when  date_format(rental_date, '%a') = 'Mon' then 'workday'
when  date_format(rental_date, '%a') = 'Tue' then 'workday'
when  date_format(rental_date, '%a') = 'Wed' then 'workday'
when  date_format(rental_date, '%a') = 'Thu' then 'workday'
when  date_format(rental_date, '%a') = 'Fri' then 'workday'
when  date_format(rental_date, '%a') = 'Sat' then 'weekend'
when  date_format(rental_date, '%a') = 'Sun' then 'weekend'
else 'no info'
end as date_type
from sakila.rental;


-- 8. How many rentals were in the last month of activity?
select count(*) as last_month_rentals
from sakila.rental
where date_format(rental_date, '%Y - %M') = (Select max(date_format(rental_date, '%Y - %M'))from sakila.rental);