-- APP STORE

-- Genre Types
SELECT primary_genre, count(primary_genre)
FROM app_store_apps
GROUP BY primary_genre
ORDER BY count(primary_genre) DESC;

-- Count of Ratings
SELECT CASE WHEN rating IS NULL THEN 'no_rating'
		WHEN rating < 1 THEN '0-0.99'
		WHEN rating BETWEEN 1 AND 1.99 THEN '1-1.99'
		WHEN rating BETWEEN 2 AND 2.99 THEN '2-2.99'
		WHEN rating BETWEEN 3 AND 3.99 THEN '3-3.99'
		WHEN rating BETWEEN 4 AND 4.99 THEN '4-4.99'
		ELSE '5+' END AS rating_group,
	COUNT(CASE WHEN rating IS NULL THEN 'no_rating'
		 WHEN rating < 1 THEN '0-0.99'
		 WHEN rating BETWEEN 1 AND 1.99 THEN '1-1.99'
		 WHEN rating BETWEEN 2 AND 2.99 THEN '2-2.99'
		 WHEN rating BETWEEN 3 AND 3.99 THEN '3-3.99'
		 WHEN rating BETWEEN 4 AND 4.99 THEN '4-4.99'
		 ELSE '5+' END) AS count_rating_group
FROM app_store_apps
GROUP BY rating_group
ORDER BY rating_group DESC;


-- PLAY STORE

-- Category Types
SELECT category, count(category)
FROM play_store_apps
GROUP BY category
ORDER BY count(category) DESC;

-- Genre Types

SELECT genres, count(genres)
FROM play_store_apps
GROUP BY genres
ORDER BY count(genres) DESC;

-- Type of app whether free or $$$

SELECT type, COUNT(type)
FROM play_store_apps
GROUP BY type
ORDER BY COUNT(type);

-- Count of Ratings

SELECT CASE WHEN rating IS NULL THEN 'no_rating'
		WHEN rating < 1 THEN '0-0.99'
		WHEN rating BETWEEN 1 AND 1.99 THEN '1-1.99'
		WHEN rating BETWEEN 2 AND 2.99 THEN '2-2.99'
		WHEN rating BETWEEN 3 AND 3.99 THEN '3-3.99'
		WHEN rating BETWEEN 4 AND 4.99 THEN '4-4.99'
		ELSE '5+' END AS rating_group,
	COUNT(CASE WHEN rating IS NULL THEN 'no_rating'
		 WHEN rating < 1 THEN '0-0.99'
		 WHEN rating BETWEEN 1 AND 1.99 THEN '1-1.99'
		 WHEN rating BETWEEN 2 AND 2.99 THEN '2-2.99'
		 WHEN rating BETWEEN 3 AND 3.99 THEN '3-3.99'
		 WHEN rating BETWEEN 4 AND 4.99 THEN '4-4.99'
		 ELSE '5+' END) AS count_rating_group
FROM play_store_apps
GROUP BY rating_group
ORDER BY rating_group DESC;

