-- DA PT 2023 
-- Sara Ferreira da Silva

-- 1. How many distinct (different) actors' last names are there?
-- ANS: 121
select count(distinct last_name)
from sakila.actor;

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
-- ANS: 1
select count(distinct language_id)
from sakila.film;

-- 3. How many movies were released with "PG-13" rating?
-- ANS: 223
select count(rating)
from sakila.film
where rating = 'PG-13';

-- 4. Get 10 the longest movies from 2006.
select title, length
from sakila.film
where release_year = 2006
order by length DESC
limit 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?
-- 266 days
select datediff(max(rental_date), min(rental_date)) as operating_period
from sakila.rental;
select min(rental_date)
from sakila.rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.
select *,
month(rental_date) as rental_month,
dayname(rental_date) as rental_weekday,
month(return_date) as return_month,
dayname(return_date) as return_weekday
from sakila.rental
limit 20;

-- Or like this: 
select *,
date_format(rental_date,'%M') as rental_date_month,
date_format(rental_date,'%W') as rental_date_weekday,
date_format(return_date,'%M') as return_date_month,
date_format(return_date,'%W') as return_date_weekday
from sakila.rental
limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
date_format(rental_date, '%M') as rental_date_month,
date_format(rental_date, '%W') as rental_date_weekday,
	case
		when rental_date is null then 'rental_day is missing / Null value'
		when dayname(rental_date) in ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') then 'workday'
		when dayname(rental_date) in ('Saturday', 'Sunday') then 'weekend'
	else 'No information'
	end as rental_date_grouped
from sakila.rental;

-- 8. How many rentals were in the last month of activity?
-- 182 rentals occured 
select count(rental_date)
from sakila.rental
where date_format(rental_date,'%Y-%M') = (select max(date_format(rental_date,'%Y-%M')) from sakila.rental);

    