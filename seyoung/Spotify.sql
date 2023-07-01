WITH rank_artist AS(
SELECT 
      artists.artist_name
      , DENSE_RANK() OVER(
      ORDER BY COUNT(songs.song_id) DESC) AS ranking
FROM artists
    INNER JOIN songs
    ON artists.artist_id = songs.artist_id
    INNER JOIN global_song_rank
    ON songs.song_id = global_song_rank.song_id
WHERE global_song_rank.rank <= 10
GROUP BY artists.artist_name
)

SELECT 
      artist_name
      , ranking AS arist_rank
FROM rank_artist
WHERE ranking <= 5
;    
