-- 1. How many distinct (different) actors' last names are there?

select count(distinct last_name)
from sakila.actor
;

-- There are 121 different actor's last names

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)

select count(distinct language_id)
from sakila.film
;

-- One language

-- 3. How many movies were released with "PG-13" rating?

select count(rating)
from sakila.film
where rating = 'PG-13'
;

-- 223 films were released with PG-13 rating

-- 4. Get 10 the longest movies from 2006.

select length
from sakila.film
where release_year = 2006
order by length desc
limit 10
;

-- the 10 longest films are 185 minutes long.

-- 5. How many days has been the company operating (check DATEDIFF() function)?

select datediff(max(rental_date), min(rental_date))
from sakila.rental
;

-- The company has been operating for 266 days.


-- 6. Show rental info with additional columns month and weekday. Get 20.

select *, date_format(rental_date, '%M') as rental_date_month, 
          date_format(rental_date, '%W') as rental_date_weekday,
          date_format(return_date, '%M') as return_date_month,
          date_format(return_date, '%W') as return_date_weekday
from sakila.rental
limit 20
;


-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *, 
case
when rental_date is null then 'null value'
when date_format(rental_date, '%W') = 'Saturday' then 'weekend'
when date_format(rental_date, '%W') = 'Sunday' then 'weekend'
else 'weekday'
end as day_type_rental_date
from sakila.rental
;



-- 8. How many rentals were in the last month of activity?

select max(convert(rental_date, date)) as datetype from sakila.rental;

select count(rental_id) from sakila.rental 
where (date_format(convert(rental_date, date),'%M')="February") 
and (date_format(convert(rental_date, date),'%Y')=2006)

-- There were 182 rentals in the last month of activity
