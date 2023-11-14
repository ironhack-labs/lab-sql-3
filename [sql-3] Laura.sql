-- 1. How many distinct (different) actors' last names are there?
 select count(distinct last_name)
 from sakila.actor
 ;
 -- There are 121 distinct last names of actors
 
 -- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
 select count(distinct language_id)
 from sakila.film
 ;
 -- There is only 1 language in what the movies where produced in
 
 -- 3. How many movies were released with "PG-13" rating?
 select count(*) as number_of_PG13_movies
 from sakila.film
 where rating = 'PG-13'
 ;
 -- There are 223 movies with the rating PG-13
 
 -- 4. Get 10 the longest movies from 2006.
 select *
 from sakila.film
 order by length desc
 limit 10
;

-- 5. How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) 
from sakila.rental
;
-- The company is operating since 266 days

-- 6. Show rental info with additional columns month and weekday. Get 20.
select *, date_format(rental_date, '%W') as rental_day, 
		  date_format(rental_date, '%M') as rental_month, 
          date_format(return_date, '%W') as return_day, 
          date_format(return_date, '%M') as renturn_month 
from sakila.rental
Limit 20
;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select 
    *,
    date_format(rental_date, '%W') as rental_day, 
    date_format(rental_date, '%M') as rental_month,
    case
        when date_format(rental_date, '%W') in ('Saturday', 'Sunday') then 'Weekend'
        else 'Workday'
    end as day_type_rental,
    
    date_format(return_date, '%W') as return_day, 
    date_format(return_date, '%M') as return_month,
    case
        when date_format(return_date, '%W') in ('Saturday', 'Sunday') then 'Weekend'
        else 'Workday'
    end as day_type_return
from sakila.rental
limit 20
;

-- 8. How many rentals were in the last month of activity?
select count(*) as active_rentals_Sep_2005
from sakila.rental
where return_date is null
;
-- There are/were 183 active rentals during the last month of activity.


