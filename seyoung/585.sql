WITH c_Insurance AS(
SELECT 
  *,
  COUNT(*) OVER(PARTITION BY TIV_2015) AS cnt_2015,
  COUNT(*) OVER(PARTITION BY LAT, LON) AS cnt_lat_lon
  FROM INSURANCE
)

SELECT 
    ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM c_Insurance
WHERE cnt_2015 <> 1 AND cnt_lat_lon = 1
;
