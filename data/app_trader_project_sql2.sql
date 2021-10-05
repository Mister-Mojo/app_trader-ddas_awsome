--APP Trader Project
-- APP STORE

-- Genre Types
SELECT primary_genre, count(primary_genre)
FROM app_store_apps
GROUP BY primary_genre
ORDER BY count(primary_genre) DESC;


-- Content Ratings
SELECT count(content_rating), content_rating, 
FROM app_store_apps
GROUP BY content_rating


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


--review count
SELECT *
FROM app_store_apps
WHERE rating > 4.0
AND review_count::numeric > 1000000
ORDER BY review_count DESC;


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


--review count
SELECT *
FROM play_store_apps
WHERE rating > 4.0
AND review_count::numeric > 1000000
ORDER BY review_count DESC;


--Lifespan and lifespan income
SELECT ROUND((( rating/.5)+1), 1) AS lifespan_years,
		ROUND(((rating / 0.5) + 1), 1) * 30000::money AS lifespan_income
FROM play_store_apps;


-- Play Store income
SELECT name, ROUND(((rating / 0.5) + 1), 1) AS lifespan_years,
			ROUND(((rating / 0.5) + 1), 1) * 30000::money AS lifespan_income
FROM play_store_apps
WHERE ROUND(((rating / .5) +1), 1) * 30000::money IS NOT NULL
ORDER BY ROUND(((rating / .5) +1), 1) * 30000::money DESC, review_count::numeric DESC
LIMIT 10;


-- APP Store Top 10 Income
SELECT name, review_count, ROUND(((rating / 0.5) + 1), 1) AS lifespan_years,
			ROUND(((rating / 0.5) + 1), 1) * 30000::money AS lifespan_income
FROM app_store_apps
WHERE ROUND(((rating / .5) +1), 1) * 30000::money IS NOT NULL
AND price BETWEEN 0 AND 1
ORDER BY ROUND(((rating / .5) +1), 1) * 30000::money DESC, review_count::numeric DESC
LIMIT 10;


--PLAY Store Top 10 Income
SELECT name, review_count, ROUND(((rating / 0.5) + 1), 1) AS lifespan_years,
			ROUND(((rating / 0.5) + 1), 1) * 30000::money AS lifespan_income
FROM play_store_apps
WHERE ROUND(((rating / 0.5) +1), 1) * 30000::money IS NOT NULL
AND price IN ('0', '$0.99', '$1.00')
AND rating >= 4.5
ORDER BY ROUND(((rating / .5) +1), 1) * 30000::money DESC, review_count::numeric DESC
LIMIT 10;


--Play Store ratings
SELECT DISTINCT(rating)
FROM play_store_apps


--TOP 10 App_STORE_Apps
WITH lifespan as (SELECT DISTINCT(name), (rating * 2)+1 AS expected_lifespan
				  FROM app_store_apps)
SELECT DISTINCT (name), primary_genre, content_rating, review_count::numeric, expected_lifespan
FROM app_store_apps INNER JOIN lifespan USING (name)
WHERE rating IS NOT NULL AND review_count IS NOT NULL
AND price <= 1
ORDER BY expected_lifespan DESC, review_count DESC
LIMIT 10;


--TOP 10 APP Store With CASE Statement
WITH lifespan as (SELECT DISTINCT(name), (rating * 2)+1 AS expected_lifespan
				  FROM app_store_apps)
SELECT DISTINCT(name), expected_lifespan, price, review_count::numeric,
       CASE WHEN price BETWEEN 0 AND 1 THEN '10000'
			WHEN price > 1 THEN price * 10000 END AS cost_Purchase
FROM app_store_apps INNER JOIN lifespan USING (name)
WHERE rating IS NOT NULL AND review_count IS NOT NULL
AND price <= 1
ORDER BY expected_lifespan DESC, review_count DESC
LIMIT 10;


--Top 10 Play Store Apps
WITH lifespan AS (SELECT DISTINCT(name), (rating * 2)+1 AS expected_lifespan
				  FROM play_store_apps)			  
SELECT DISTINCT(name), rating, category, review_count, expected_lifespan
FROM play_store_apps INNER JOIN lifespan USING (name)
WHERE rating > 4.7    
AND rating IS NOT NULL AND review_count IS NOT NULL
AND price IN ('0', '$0.99', '$1.00')
AND category IN ('GAME', 'FAMILY' )
ORDER BY review_count DESC, expected_lifespan DESC
LIMIT 20;


--In BOTH APPS List
WITH IN_BOTH AS (SELECT DISTINCT(name)
				  FROM app_store_apps INNER JOIN play_store_apps USING (name))  

SELECT DISTINCT(name), primary_genre, review_count::numeric, (rating * 2)+1 AS expected_lifespan	
FROM app_store_apps INNER JOIN IN_BOTH USING (name)    
WHERE rating IS NOT NULL AND review_count IS NOT NULL
AND price <=1 
AND primary_genre IN ('Games')
ORDER BY expected_lifespan DESC,review_count DESC
LIMIT 15;




--CAST(price as numeric (4,4))
--CASE WHEN price BETWEEN 0 AND 1 THEN '10000'
			--WHEN price > 1 THEN price * 10000 END AS cost_Purchase