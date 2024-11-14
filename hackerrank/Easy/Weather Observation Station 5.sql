-- Weather Observation Station 5

(SELECT city, LENGTH(city) AS len
FROM station
ORDER BY len ASC, city ASC
LIMIT 1)
 
UNION

(SELECT city, LENGTH(city) AS len
FROM station
ORDER BY len DESC, city ASC
LIMIT 1);