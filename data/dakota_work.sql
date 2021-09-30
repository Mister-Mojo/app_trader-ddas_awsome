-- Play store

-- Category types

-- SELECT category, COUNT(category)
-- FROM play_store_apps
-- GROUP BY category
-- ORDER BY COUNT(category) DESC;

-- Genre types

-- SELECT genres, COUNT(genres)
-- FROM play_store_apps
-- GROUP BY genres
-- ORDER BY COUNT(genres) DESC;

-- Type of app in terms of payment

-- SELECT type, COUNT(type)
-- FROM play_store_apps
-- GROUP BY type
-- ORDER BY COUNT(type);

-- Count of app ratings

-- SELECT CASE WHEN rating IS NULL THEN 'no_rating'
-- 	   		WHEN rating < 1 THEN '0-0.99'
-- 			WHEN rating BETWEEN 1 AND 1.99 THEN '1-1.99'
-- 			WHEN rating BETWEEN 2 AND 2.99 THEN '2-2.99'
-- 			WHEN rating BETWEEN 3 AND 3.99 THEN '3-3.99'
-- 			WHEN rating BETWEEN 4 AND 4.99 THEN '4-4.99'
-- 			ELSE '5+' END AS rating_group,
-- 		COUNT(CASE WHEN rating IS NULL THEN 'no_rating'
-- 			WHEN rating < 1 THEN '0-0.99'
-- 			WHEN rating BETWEEN 1 AND 1.99 THEN '1-1.99'
-- 			WHEN rating BETWEEN 2 AND 2.99 THEN '2-2.99'
-- 			WHEN rating BETWEEN 3 AND 3.99 THEN '3-3.99'
-- 			WHEN rating BETWEEN 4 AND 4.99 THEN '4-4.99'
-- 			ELSE '5+' END) AS count_rating_group
-- FROM play_store_apps
-- GROUP BY rating_group
-- ORDER BY rating_group DESC;

--Apps that share name among both

-- SELECT DISTINCT(name)
-- FROM app_store_apps INNER JOIN play_store_apps USING (name)
-- WHERE category ILIKE 'game';





	

