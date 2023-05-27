(SELECT
    name AS results
FROM
    MovieRating
    INNER JOIN Users 
        ON MovieRating.user_id = Users.user_id
GROUP BY MovieRating.user_id
ORDER BY 
    COUNT(movie_id) DESC
  , 1
LIMIT 1)

UNION ALL

(SELECT
    title AS results
FROM
    MovieRating
    INNER JOIN Movies 
        ON MovieRating.movie_id = Movies.movie_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-28'
GROUP BY 1
ORDER BY 
    AVG(rating) DESC
  , 1
LIMIT 1)
;