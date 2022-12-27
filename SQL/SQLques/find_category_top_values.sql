-- har gener ka top movies ka naam do
-- corelated_query
SELECT gener, name, rating
FROM  
movies m1
where rating =
(SELECT max(rating)
FROM movies m2
WHERE m2.gener = m1.gener
GROUP BY genre);

-- tRY THIS
SELECT gener, name
FROM movies
GROUP BY gener 
HAVING max(rating);