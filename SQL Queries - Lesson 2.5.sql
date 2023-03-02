USE sakila;
-- 1.
SELECT * FROM actor
WHERE first_name = 'SCARLETT';

-- 2
SELECT COUNT(DISTINCT film_id) FROM film;    -- 1000 films on the inventory
SELECT COUNT(DISTINCT film_id) FROM inventory;     -- 958 films titles
-- so we habe 42 available films to rent

-- 3
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration
FROM film;     

-- 4
SELECT sec_to_time(AVG(length)*60) AS average_duration FROM film;

-- 5
SELECT COUNT(DISTINCT last_name) FROM actor;

-- 6
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS 'operating_days' FROM rental;

-- 7
SELECT *, date_format(rental_date, '%m') AS 'month', date_format(rental_date, '%w') AS 'weekday'
FROM rental
WHERE date_format(rental_date, '%w') BETWEEN 1 AND 5
LIMIT 20;

-- 8
SELECT *, 
CASE 
WHEN date_format(rental_date, '%W') = 'Saturday' OR date_format(rental_date, '%W') = 'Sunday'  then 'weekend'
ELSE 'workday'
END AS 'day_type'
FROM rental;

-- 9
SELECT DISTINCT release_year FROM film;

-- 10
SELECT title FROM film
WHERE title LIKE '%ARMAGEDDON%';

-- 11
SELECT title FROM film
WHERE title LIKE '%APOLLO';

-- 12
SELECT title FROM film
ORDER BY LENGTH(title) DESC
LIMIT 10;

-- 13
SELECT COUNT(film_id) AS include_Behind_the_Scenes FROM film
WHERE special_features LIKE '%Behind the Scenes%';