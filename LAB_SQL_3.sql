# 1. How many distinct (different) actors' last names are there?

use sakila;
select count(distinct LAST_NAME)
from ACTOR;

#2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct LANGUAGE_ID)
from FILM;

#3. How many movies were released with "PG-13" rating?
select count(RATING)
    from sakila.FILM
    where RATING = 'PG-13';
    
# 4. Get 10 the longest movies from 2006.

select
	TITLE,
    LENGTH
from FILM
where RELEASE_YEAR = 2006
order by length DESC
limit  10;

# 5 How many days has been the company operating (check DATEDIFF() function)?
SELECT
datediff(max(rental_date), min(rental_date)) as days from RENTAL;

#6 Show rental info with additional columns month and weekday. Get 20.
SELECT
	*,
	date_format(convert(rental_date,date),'%M') as month_column,
    date_format(convert(rental_date,date),'%W') as weekday_column
	from RENTAL;
    
# 7 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT
	*,
    case
		when date_format(convert(rental_date,date),'%W') in ('Saturday', 'Sunday') then 'Weekend'
        else 'Workday'
        end as 'Day_type'
from RENTAL;

# 8 How many rentals were in the last month of activity?

SELECT
max(date_format(convert(rental_date,date),'%Y-%M'))
from RENTAL;

SELECT
	count(rental_date)
from RENTAL
where date_format(convert(rental_date,date),'%Y-%M') = (SELECT max(date_format(convert(rental_date,date),'%Y-%M')) from RENTAL)
;

