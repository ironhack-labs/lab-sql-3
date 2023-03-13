SELECT 
	count(DISTINCT(last_name))
FROM sakila.actor;

SELECT 
      count(DISTINCT(language_id))
FROM sakila.film;

SELECT
     count(rating)
FROM sakila.film
WHERE rating = 'PG-13';

SELECT title
FROM sakila.film
GROUP BY title
ORDER BY MAX(LENGTH(title)) DESC
LIMIT 10;

SELECT 
     sum(DATEDIFF(return_date,rental_date)) AS total_days
FROM sakila.rental;

SELECT 
      rental_id, rental_date, return_date, 
      MONTH(rental_date) AS rental_month, 
      WEEKDAY(rental_date) AS rental_weekday
FROM sakila.rental
LIMIT 20;

SELECT 
       rental_id, rental_date, return_date,  
       CASE 
	   WHEN WEEKDAY(rental_date) IN (5) THEN 'Weekend' 
	   ELSE 'Workday'
       END AS day_type
FROM sakila.rental
LIMIT 20;

SELECT 
      date_format(max(rental_date),"%M") 
FROM sakila.rental;

SELECT 
      date_format(max(rental_date),"%Y") 
FROM sakila.rental;

SELECT 
     count(rental_id) 
FROM sakila.rental
WHERE date_format(rental_date,'%Y-%M') = (SELECT max(date_format(rental_date,'%Y-%M')) FROM sakila.rental);
