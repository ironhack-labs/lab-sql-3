USE sakila;

-- 1
SELECT count(DISTINCT last_name)
FROM actor;

-- 2
SELECT count(DISTINCT language_id)
FROM film;

-- 3
SELECT
	count(rating)
FROM film
WHERE rating = 'PG-13';

-- 4
SELECT
	title,
    length
FROM film
WHERE release_year = 2006
ORDER by length DESC
LIMIT 10;

-- 5
SELECT
	datediff(max(rental_date),min(rental_date))
FROM rental;

-- 6
SELECT
	*,
    date_format(rental_date,'%M') as rental_date_month,
    date_format(rental_date,'%W') as rental_date_weekday,
    date_format(return_date,'%M') as return_date_month,
    date_format(return_date,'%W') as return_date_weekday
FROM rental;

-- 7
SELECT
	*,
    date_format(rental_date,'%M') as rental_date_month,
    date_format(rental_date,'%W') as rental_date_weekday,
    case
		when date_format(rental_date,'%W') in ('Saturday','Sunday') then 'Weekend'
        else 'Workday'
        end as 'rental_date_daytype',
    date_format(return_date,'%M') as return_date_month,
    date_format(return_date,'%W') as return_date_weekday,
    case
		when date_format(return_date,'%W') in ('Saturday','Sunday') then 'Weekend'
        else 'Workday'
        end as 'rental_date_daytype'
FROM rental;

-- 8
SELECT
	count(rental_date)
FROM rental
WHERE date_format(rental_date,'%Y-%M') = (SELECT max(date_format(rental_date,'%Y-%M')) FROM rental);
