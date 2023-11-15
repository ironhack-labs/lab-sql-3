-- How many distinct (different) actors' last names are there?

select*
from sakila.actor;
-- selecting only unique last name 
select DISTINCT(last_name)
from sakila.actor;

-- now count it with function count 
-- there is 121 last_name
select count(distinct(last_name)) as last_name
from sakila.actor
;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
-- selecting only unique language , and there is only one language for the film tagged as 1 

select *
from sakila.film;


select DISTINCT(language_id)
from sakila.film;

-- How many movies were released with "PG-13" rating?
-- selecting the rows with "PG-13'

select *
from sakila.film
where rating = 'PG-13';

-- selecting the unique values to see if some PG 13 have been mispelled 
select DISTINCT(rating)
from sakila.film;

-- counting the number of rows 
-- number of movies with PG 13 , 223

select count(*)
from sakila.film
where rating = 'PG-13';

-- Get 10 of the longest movies from 2006
select *
from sakila.film ;

-- only the year 2006 in the data base 
select DISTINCT(release_year)
from sakila.film;

-- will order by lenth and select the 10 longers one 
-- here are the names
 
/* SOLDIERS EVOLUTION
SWEET BROTHERHOOD
CHICAGO NORTH
WORST BANGER
GANGS PRIDE
DARN FORRESTER
HOME PITY
MUSCLE BRIGHT
CONTROL ANTHEM
POND SEATTLE 
*/

SELECT *
FROM sakila.film
ORDER BY length desc
LIMIT 10;


-- How many days has been the company operating (check DATEDIFF() function)?

-- first checking where can we found the good date 

select *
FROM sakila.rental ;

select *
FROM sakila.payment ;


-- lots of date maybe can help to find how many days
-- converting date 
select *,
convert(rental_date,date) as first_date, 
date_format(convert(rental_date,date),'%D-%M' ) as day,
convert(last_update,date) as last_date, 
date_format(convert(last_update,date),'%D-%M' ) as day,
DATEDIFF(last_update, rental_date) AS date_difference
from sakila.rental
; 

-- Number of days , is the first row of Date_difference 267 days 

-- Show rental info with additional columns month and weekday. Get 20.
-- converts each columns rental/return/last Update, by month and day  with a limit of 20 rows
select *,
convert(rental_date,date) as Rent_date_pr, 
date_format(convert(rental_date,date),'%D' ) as day,
date_format(convert(rental_date,date),'%M' ) as Month,

convert(return_date,date) as Return_date_pr, 
date_format(convert(return_date,date),'%D' ) as day,
date_format(convert(return_date,date),'%M' ) as Month,
convert(last_update,date) as last_update_pr, 
date_format(convert(last_update,date),'%D' ) as day,
date_format(convert(last_update,date),'%M' ) as Month,

-- Converting with formula weekday the rental/return/last Update with a limit of 20 rows, naming date with days of the week
case 
when weekday(rental_date) = '0' then 'Monday'
when weekday(rental_date) = '1' then 'Tuesday'
when weekday(rental_date) = '2' then 'Wednesday'
when weekday(rental_date) = '3' then 'Thursday'
when weekday(rental_date) = '4' then 'Friday'
when weekday(rental_date) = '5' then 'Saturday'
when weekday(rental_date) = '6' then 'Sunday'
end as Week_day_rental,
case 
when weekday(return_date) = '0' then 'Monday'
when weekday(return_date) = '1' then 'Tuesday'
when weekday(return_date) = '2' then 'Wednesday'
when weekday(return_date) = '3' then 'Thursday'
when weekday(return_date) = '4' then 'Friday'
when weekday(return_date) = '5' then 'Saturday'
when weekday(return_date) = '6' then 'Sunday'
end as Week_day_return,
case 
when weekday(last_update) = '0' then 'Monday'
when weekday(last_update) = '1' then 'Tuesday'
when weekday(last_update) = '2' then 'Wednesday'
when weekday(last_update) = '3' then 'Thursday'
when weekday(last_update) = '4' then 'Friday'
when weekday(last_update) = '5' then 'Saturday'
when weekday(last_update) = '6' then 'Sunday'
end as Week_day_last_update
from sakila.rental
LIMIT 20;



-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *, 
case 
when weekday(rental_date) = '0' then 'Monday'
when weekday(rental_date) = '1' then 'Tuesday'
when weekday(rental_date) = '2' then 'Wednesday'
when weekday(rental_date) = '3' then 'Thursday'
when weekday(rental_date) = '4' then 'Friday'
when weekday(rental_date) = '5' then 'Saturday'
when weekday(rental_date) = '6' then 'Sunday'
end as Week_day_rental,

case 
when weekday(rental_date) in (0, 1, 2, 3, 4) then 'Workday'
when weekday(rental_date) in (5,6) then 'Weekend'
end as day_type_rental_date,

case 
when weekday(return_date) = '0' then 'Monday'
when weekday(return_date) = '1' then 'Tuesday'
when weekday(return_date) = '2' then 'Wednesday'
when weekday(return_date) = '3' then 'Thursday'
when weekday(return_date) = '4' then 'Friday'
when weekday(return_date) = '5' then 'Saturday'
when weekday(return_date) = '6' then 'Sunday'
end as Week_day_return,

case 
when weekday(return_date) in (0,1,2,3,4) then 'Workday'
when weekday(return_date) in (5,6) then 'Weekend'
end as day_type_return_date,
case 
when weekday(last_update) = '0' then 'Monday'
when weekday(last_update) = '1' then 'Tuesday'
when weekday(last_update) = '2' then 'Wednesday'
when weekday(last_update) = '3' then 'Thursday'
when weekday(last_update) = '4' then 'Friday'
when weekday(last_update) = '5' then 'Saturday'
when weekday(last_update) = '6' then 'Sunday'
end as Week_day_last_update,

case 
when weekday(last_update) in (0,1,2,3,4) then 'Workday'
when weekday(last_update) in (5,6) then 'Weekend'
end as day_type_last_update

from sakila.rental
;

-- How many rentals were in the last month of activity?
-- first lets order by desc rental date to check last month of activity
SELECT *
FROM sakila.rental
ORDER BY rental_date desc
;

SELECT COUNT(*) AS rental_count
FROM sakila.rental
WHERE MONTH(rental_date) = MONTH((SELECT MAX(rental_date) FROM sakila.rental))
      AND YEAR(rental_date) = YEAR((SELECT MAX(rental_date) FROM sakila.rental));

-- There is 182 movies who have been rented on the last month february 2006-02-14

