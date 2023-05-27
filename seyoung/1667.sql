SELECT 
    user_id
    , CONCAT(UPPER(LEFT(name,1)), LOWER(MID(name,2))) AS name
FROM 
    Users
ORDER BY user_id
;
