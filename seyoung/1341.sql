(
SELECT 
    Users.name AS results
FROM   
    Users
    INNER JOIN 
    (   SELECT 
            user_id
            , COUNT(user_id) AS cnt_user_id
        FROM MovieRating 
        GROUP BY user_id ) AS Users_b
    ON Users.user_id = Users_b.user_id
ORDER BY cnt_user_id desc, name asc
LIMIT 1
)

UNION ALL

(
SELECT 
    Movies.title AS results
FROM   
    Movies
    INNER JOIN 
    (   SELECT 
            movie_id
            , AVG(rating) AS avg_rating
        FROM MovieRating 
        WHERE LEFT(created_at , 7) = '2020-02'   
        GROUP BY movie_id ) AS Movies_b
    ON Movies.movie_id = Movies_b.movie_id
ORDER BY avg_rating desc, title asc
LIMIT 1
)
;
