select 	count(distinct(last_name)) as diff_Last_names
from sakila.actor;

select	count(distinct(language_id)) as diff_languages
from sakila.film;

select	count(rating)
from sakila.film
where rating = 'PG-13';

select title,length
from sakila.film
where release_year = '2006'
order by length desc
limit 10;

select max(rental_date), min(rental_date), datediff(max(rental_date), min(rental_date)) as Operation_Days
from sakila.rental;

select rental_date,
date_format(rental_date, '%M') as M,
date_format(rental_date, '%W') as Weekday
from sakila.rental
limit 20;

select 	rental_date, 
date_format(rental_date, '%M') as M,
date_format(rental_date, '%W') as Weekday,
    case
		when date_format(rental_date, '%W') = 'Saturday' or 'Sunday' then 'Weekend'
	else 'Workday'
    end as 'Day_Type'
    from sakila.rental;

select 
date_format(max(rental_date),"%M"),
date_format(max(rental_date),"%Y"),
count(rental_id) 
from sakila.rental
where date_format(rental_date,'%Y-%M') = max(date_format(rental_date,'%Y-%M'))