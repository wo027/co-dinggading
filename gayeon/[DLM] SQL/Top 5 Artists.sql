WITH top_10_global_song_artist_info AS (
  SELECT 
      artists.artist_name
    , DENSE_RANK() OVER(ORDER BY COUNT(songs.song_id) DESC) AS rank_artist
  FROM 
      artists
      INNER JOIN songs
        ON artists.artist_id = songs.artist_id
      INNER JOIN global_song_rank
        ON songs.song_id = global_song_rank.song_id
  WHERE
      global_song_rank.rank <= 10
  GROUP BY
      1
)


SELECT 
    artist_name
  , rank_artist
FROM 
    top_10_global_song_artist_info
WHERE 
    rank_artist <= 5
;