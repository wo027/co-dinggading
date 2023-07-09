WITH rolling_retention_info AS (
  SELECT 
      tweets.user_id
    , tweets.tweet_date
    , ROUND(SUM(for_calc_tweets.tweet_count), 2)  AS sum_tweet_count
    , ROUND(COUNT(for_calc_tweets.tweet_date), 2) AS cnt_tweet_date
  FROM 
      tweets
      INNER JOIN tweets AS for_calc_tweets
          ON tweets.user_id = for_calc_tweets.user_id
          AND for_calc_tweets.tweet_date BETWEEN tweets.tweet_date - INTERVAL '2 days' AND tweets.tweet_date
  GROUP BY 
      1
    , 2
)

SELECT
    user_id
  , tweet_date
  , ROUND(sum_tweet_count / cnt_tweet_date, 2) AS rolling_avg_3d
FROM
    rolling_retention_info
ORDER BY
    1
  , 2
;