SELECT DISTINCT viewer_id as id
FROM Views
WHERE viewer_id = author_id
ORDER BY id 
