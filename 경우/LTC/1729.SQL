SELECT user_id
				, count(distinct follower_id ) followers_count
FROM Followers f1
GROUP BY user_id
