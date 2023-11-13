select count(distinct (last_name)) as different_last_name from sakila.actor;
select count(distinct (language_id)) as different_languages from sakila.film;
select count(distinct (film_id)) as "PG-13 films" from sakila.film where rating = 'PG-13';
select title, release_year, length from sakila.film where release_year >= 2006 order by length desc limit 10;
select datediff(max(rental_date),min(rental_date)) from sakila.rental;

select *, date_format(convert(rental_date, date),'%M') as month,
date_format(convert(rental_date, date),'%W') as weekday
from sakila.rental limit 20;

select *, 
case 
when weekday(convert(rental_date, date)) is null then 'Date is missing'
when weekday(convert(rental_date, date)) <= 4  then 'workday' 
else 'weekend' 
end as day_type
from sakila.rental;

#checking last month of activity
select max(convert(rental_date, date)) as datetype from sakila.rental;

select count(rental_id) from sakila.rental 
where (date_format(convert(rental_date, date),'%M')="February") 
and (date_format(convert(rental_date, date),'%Y')=2006);




