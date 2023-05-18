(SELECT name AS results      
FROM  Users   u
    INNER JOIN MovieRating  m
    ON u.user_id  = m.user_id    
GROUP BY u.name     
ORDER BY  count(m.movie_id) DESC , name 
LIMIT 1  )
UNION  ALL 
(
SELECT title AS results
FROM Movies mv
    INNER JOIN MovieRating mr
    ON mv.movie_id =mr.movie_id      
WHERE DATE_FORMAT(mr.created_at,'%Y-%m') = '2020-02'
GROUP BY title
ORDER BY AVG(mr.rating) DESC , title 
LIMIT 1  )