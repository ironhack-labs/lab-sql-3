select count(distinct last_name)
from sakila.actor;

select count(distinct language_id)
from sakila.film;

select
count(rating)
from sakila.film
where rating = 'PG-13';

select
	length, release_year, title
from sakila.film
where release_year = 2006
order by length desc
limit 10;

select datediff(now(), last_update) as days_operating
from sakila.store;

select *, month(rental_date) as month, dayname(rental_date) as weekday,
month(return_date) as month, dayname(return_date) as weekday,
month(last_update) as month, dayname(last_update) as weekday
from sakila.rental
limit 20;

select *,
dayname(rental_date) as weekday_rental_date,
case
when dayname(rental_date) = 'Saturday' then 'weekend'
when dayname(rental_date) = 'Sunday' then 'weekend'
else 'workday'
end as 'day_type'
from sakila.rental;


select count(*) as last_month_of_activity
from sakila.rental
where return_date >= date_sub(NOW(), interval 1 month);