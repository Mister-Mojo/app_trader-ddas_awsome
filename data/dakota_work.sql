-- App store list

-- with lifespan as (SELECT DISTINCT(name), (rating * 2)+1 AS expected_lifespan
-- 				  FROM app_store_apps)
-- SELECT DISTINCT(name), primary_genre, content_rating, review_count::numeric, expected_lifespan
-- FROM app_store_apps INNER JOIN lifespan USING (name)
-- WHERE rating IS NOT NULL AND review_count IS NOT NULL
-- AND price <= 1
-- ORDER BY expected_lifespan DESC, review_count DESC
-- LIMIT 10;



-- Play store list

-- with lifespan as (SELECT DISTINCT(name), (rating * 2)+1 AS expected_lifespan
-- 				  FROM play_store_apps)

-- SELECT DISTINCT(name), category, content_rating, review_count, expected_lifespan 
-- FROM play_store_apps INNER JOIN lifespan USING (name)
-- WHERE rating > 4.7
-- AND rating IS NOT NULL AND review_count IS NOT NULL
-- AND price IN ('0', '$0.99', '$1.00')
-- AND category IN ('GAME', 'FAMILY')
-- ORDER BY review_count DESC, expected_lifespan DESC
-- LIMIT 12;



-- In both list

-- WITH in_both AS (SELECT DISTINCT(name)
-- 			 FROM app_store_apps INNER JOIN play_store_apps USING (name))
			 
-- SELECT DISTINCT(name), primary_genre, review_count::numeric, (rating * 2)+1 AS expected_lifespan
-- FROM app_store_apps INNER JOIN in_both USING (name)
-- WHERE rating IS NOT NULL AND review_count IS NOT NULL
-- AND price <= 1
-- AND primary_genre IN ('Games')
-- ORDER BY expected_lifespan DESC, review_count DESC
-- LIMIT 10;


-- App store category count

-- SELECT primary_genre, COUNT(primary_genre)
-- FROM app_store_apps
-- GROUP BY primary_genre
-- ORDER BY COUNT(primary_genre) DESC;

-- Play store category count

-- SELECT category, COUNT(category)
-- FROM play_store_apps
-- GROUP BY category
-- ORDER BY COUNT(category) DESC;













	

