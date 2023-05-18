SELECT user_id , CONCAT(upper(substr(name,1,1)) , lower(substr(name,2))) name
FROM users
ORDER BY 1