SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM 
    (
        SELECT *
          , COUNT(*) OVER(PARTITION BY tiv_2015) AS cnt_tiv_2015
          , COUNT(*) OVER(PARTITION BY lat, lon) AS cnt_lat_lon
        FROM
            Insurance
    ) AS difference_insurance
WHERE 
      cnt_tiv_2015 >= 2
  AND cnt_lat_lon = 1
;

-- COUNT(*) : 단순 행을 세는 역할. 내부적으로 데이터를 읽지 않아 순서가 가장 빠름
-- COUNT(column) : 행의 값을 세는 역할. 데이터를 읽음
-- COUNT(PK)를 사용한다고 해도 COUNT(*)의 수행 속도가 더 빠름