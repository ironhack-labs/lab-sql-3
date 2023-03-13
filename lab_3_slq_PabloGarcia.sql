-- Instructions
-- 1.How many distinct (different) actors' last names are there?
SELECT 
    COUNT(DISTINCT last_name)
FROM
    sakila.actor;

-- 2.In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT 
    COUNT(DISTINCT language_id)
FROM
    `sakila`.`film`;
    
-- 3. How many movies were released with "PG-13" rating?
SELECT 
    COUNT(rating)
FROM
    `sakila`.`film`
WHERE
    rating = 'PG-13';

-- 4. Get 10 the longest movies from 2006.
SELECT 
    length, title
FROM
    sakila.film
WHERE
    release_year = '2006'
ORDER BY length DESC
LIMIT 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?
SELECT 
    DATEDIFF(MAX(rental_date),MIN(rental_date)) AS DateDiff
FROM
    sakila.rental;
    
-- 6. Show rental info with additional columns month and weekday. Get 20.
SELECT rental_date, date_format(rental_date, '%M') AS 'Month', date_format(rental_date, '%W') AS 'Week Day' FROM sakila.rental;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT 
    rental_date,
    CASE
        WHEN
            DATE_FORMAT(rental_date, '%W') = 'Saturday'
                OR 'Sunday'
        THEN
            'Weekend'
        ELSE 'Weekday'
    END AS 'day_type'
FROM
    sakila.rental;


-- 8. How many rentals were in the last month of activity?
SELECT * from sakila.rental;
SELECT max(rental_date) AS 'Last Month'FROM sakila.rental;
SELECT COUNT(rental_date) FROM sakila.rental WHERE MONTH(rental_date) = 2 and YEAR(rental_date) = 2006;
 

