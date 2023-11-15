select *from sakila.actor;
-- 1. How many distinct (different) actors' last names are there? 121
-- select count(distinct(concat(trim(first_name),trim(last_name)))) as distint_actors from sakila.actor; 199 diff actors

select count(distinct (trim(last_name))) as count_surname from sakila.actor;


-- 2. In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table) 1

select count(distinct(language_id)) as n_language from sakila.film;


-- 3. How many movies were released with `"PG-13"` rating? 223

select count(rating) as 'count_PG-13' from sakila.film
where rating = 'PG-13';


-- 4. Get 10 the longest movies from 2006.

select * from sakila.film
order by length desc
limit 10;

-- 5. How many days has been the company operating (check `DATEDIFF()` function)? 267

select  max(datediff(last_update,rental_date)) as operating_day from sakila.rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.

select *, weekday(rental_date)as date_name from sakila.rental
order by rental_date asc
limit 20;

-- 7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.

select *, weekday(rental_date)as date_name,
case
when weekday(rental_date) = 5 then 'Weekend'
when weekday(rental_date) = 6 then 'Weekend'
else 'Workday'
end as 'day_type'
from sakila.rental;

-- 8. How many rentals were in the last month of activity? 182
select max(date_format(rental_date, '%m-%Y')) from sakila.rental; -- ='02-2006'
select count(rental_id) as last_month_sells_count from sakila.rental where date_format(rental_date, '%m-%Y') = '02-2006';