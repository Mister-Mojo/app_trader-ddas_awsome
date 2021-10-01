SELECT count(name), primary_genre
FROM app_store_apps
GROUP BY primary_genre
ORDER BY count(name) DESC;




SELECT count(name), genres
FROM play_store_apps
GROUP BY genres
ORDER BY count(name) DESC