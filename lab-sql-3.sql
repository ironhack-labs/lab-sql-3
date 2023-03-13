use sakila;

-- 1
SELECT count(DISTINCT last_name) FROM ACTOR;

-- 2

SELECT count(DISTINCT language_id) FROM FILM;

-- 3
SELECT count(RATING) FROM FILM WHERE rating = 'PG-13';

-- 4
Select * FROM FILM WHERE release_year = '2006' order by length desc limit 10;

-- 5
WITH startdate AS (
  SELECT rental_date FROM rental ORDER BY rental_date ASC LIMIT 1
)
SELECT DATEDIFF(NOW(), startdate.rental_date) AS days_diff
FROM startdate;

-- 6
SELECT *, MONTH(rental_date) as 'month', weekday(rental_date) as 'weekday' FROM rental LIMIT 20;

-- 7
SELECT *, case
			when weekday(rental_date) <= '5' then 'workday'
            else 'weekend'
            end as 'day_type'
            FROM rental;
            
-- 8
WITH lastdate AS (
  SELECT rental_date FROM rental ORDER BY rental_date DESC LIMIT 1
)
SELECT COUNT(*) FROM rental 
JOIN lastdate ON rental.rental_date BETWEEN DATE_SUB(lastdate.rental_date, INTERVAL 1 MONTH) AND lastdate.rental_date;
