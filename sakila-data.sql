-- LAB | SQL Basic Queries
-- To review for more: https://dev.mysql.com/doc/sakila/en/

-- Use the sakila database to do the following tasks:
-- 1. Display all available tables in the Sakila database.
-- 2. Retrieve all the data from the tables actor, film and customer.

USE `sakila`; 

-- Solved 1. Display all available tables in the Sakila database.
SHOW TABLES;

-- Solved 2. Retrieve all the data from the tables actor, film and customer.

SELECT *
FROM actor; 

SELECT *
FROM film; 

SELECT *
FROM customer; 

-- 3. Retrieve the following columns from their respective tables:
-- 3.1 Titles of all films from the film table
SELECT title FROM film;

-- 3.2 List of languages used in films, with the column aliased as language from the language table
SELECT name AS language FROM language;

-- 3.3 List of first names of all employees from the staff table
SELECT first_name FROM staff;

--  Retrieve unique release years.
SELECT DISTINCT release_year FROM film;

-- Counting records for database insights:
SELECT 'actor' AS table_name, COUNT(*) AS total_records FROM sakila.actor
UNION ALL
SELECT 'address', COUNT(*) FROM sakila.address
UNION ALL
SELECT 'category', COUNT(*) FROM sakila.category
UNION ALL
SELECT 'city', COUNT(*) FROM sakila.city
UNION ALL
SELECT 'country', COUNT(*) FROM sakila.country
UNION ALL
SELECT 'customer', COUNT(*) FROM sakila.customer
UNION ALL
SELECT 'film', COUNT(*) FROM sakila.film
UNION ALL
SELECT 'film_actor', COUNT(*) FROM sakila.film_actor
UNION ALL
SELECT 'film_category', COUNT(*) FROM sakila.film_category
UNION ALL
SELECT 'inventory', COUNT(*) FROM sakila.inventory
UNION ALL
SELECT 'language', COUNT(*) FROM sakila.language
UNION ALL
SELECT 'payment', COUNT(*) FROM sakila.payment
UNION ALL
SELECT 'rental', COUNT(*) FROM sakila.rental
UNION ALL
SELECT 'staff', COUNT(*) FROM sakila.staff
UNION ALL
SELECT 'store', COUNT(*) FROM sakila.store;

-- 5.1 Determine the number of stores that the company has.
SELECT COUNT(*) AS total_stores FROM sakila.store;

-- 5.2 Determine the number of employees that the company has.
SELECT COUNT(*) as total_employees FROM sakila.staff;

-- last_update5.3 Determine how many films are available for rent and how many have been rented.
-- SELECT last_update FROM sakila.inventory;
-- SHOW COLUMNS FROM sakila.inventory;
-- DESCRIBE sakila.inventory;

SELECT COUNT(*) AS films_available_for_rent
FROM sakila.inventory;

-- 5.4 Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name) AS distinct_last_name
FROM sakila.actor; 

-- Retrieve the 10 longest films.
SELECT title, length
FROM sakila.film
ORDER BY length DESC
LIMIT 10;


-- Use filtering techniques in order to:
-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT*
FROM sakila.actor
WHERE first_name = 'SCARLETT';

-- -------------------------BONUS:

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
-- Hint: use LIKE operator. More information here
SELECT title, length
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%'
	AND length > 100; 

--  7.3 Determine the number of films that include Behind the Scenes content
SELECT COUNT(*) AS films_with_behind_the_scenes
FROM sakila.film 
WHERE special_features LIKE '%Behind the Scenes%';
