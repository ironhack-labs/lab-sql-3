use sakila;

# 1. How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from sakila.actor;

#2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct(language_id)) from sakila.film;

#3. How many movies were released with "PG-13" rating?
select count(rating) from sakila.film where rating="PG-13";

#4. Get the 10 longest movies from 2006.
select release_year from sakila.film;

select title, length from sakila.film 
	where release_year=2006
    order by length desc
    limit 10;

#5 How many days has been the company operating (check DATEDIFF() function)?
select rental_date from sakila.rental;
select max(rental_date) from sakila.rental;
select min(rental_date) from sakila.rental;

select datediff(max(rental_date),min(rental_date)) as dif from sakila.rental;

#6. Show rental info with additional columns month and weekday. Get 20.
select rental_date,date_format(rental_date,"%M") as mon, date_format(rental_date,"%W") as wkday from sakila.rental limit 20;

#7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select rental_date, case 
	when date_format(rental_date,"%W")="Saturday" then "weekend"
	when date_format(rental_date,"%W")="Sunday" then "weekend"
    else "workday"
    end as "day_type" from sakila.rental;
    
#8. How many rentals were in the last month of activity?
select date_format(max(rental_date),"%M") from sakila.rental;
select date_format(max(rental_date),"%Y") from sakila.rental;

select count(rental_id) from sakila.rental
	where date_format(rental_date,'%Y-%M') = (select max(date_format(rental_date,'%Y-%M')) from rental);

    
    





