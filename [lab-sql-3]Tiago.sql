# 1. How many distinct (different) actors' last names are there?
select count(distinct(actor.last_name))
from sakila.actor
;

# 2. In how many different languages where the films originally produced? 
#Use the column language_id from the film table#
select count(distinct(film.language_id))
from sakila.film
;

# 3. How many movies were released with "PG-13" rating?
select count(distinct(film.film_id))
from sakila.film
where film.rating = "PG-13"
;

# 4. Get 10 the longest movies from 2006.
select film.title, concat(film.length div 60 ,'h:', film.length  % 60,'min') as duration
from sakila.film
where release_year >= 2006 
order by film.length   desc
limit 10
;

# 5. How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental.rental_date), min(rental.rental_date)) as Days_operating
from sakila.rental 
;

# 6. Show rental info with additional columns month and weekday. Get 20.
select *, date_format(convert(rental.rental_date,date), "%M" )  as month, dayname(rental.rental_date) as weekday
from sakila.rental 
;
#or 
select *, date_format(convert(rental.rental_date,date), "%M" )  as month, date_format(convert(rental.rental_date,date), "%W " )  as weekday
from sakila.rental
order by rental_date asc
;

# 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, dayname(rental.rental_date) as weekday,
case
when dayname(rental.rental_date) is null then 'data is missing'
when dayname(rental.rental_date) in ('Saturday','Sunday') then 'Weekend'
else 'Workday'
end as data_type
from sakila.rental 
;

# 8. How many rentals were in the last month of activity?
select *, date_format(convert(rental.rental_date,date), "%M" )  as month , date_format(convert(rental.rental_date,date), "%Y" )  as year
from sakila.rental 

;

select count(*) as rentals_in_the_last_month
from(
select date_format(convert(rental.rental_date,date), "%M")   as month , date_format(convert(rental.rental_date,date), "%Y" )  as year
from sakila.rental
where (date_format(convert(rental.rental_date,date), "%Y" ) = '2006') and (date_format(convert(rental.rental_date,date), "%M" ) = 'February')) tabela
;


