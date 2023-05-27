SELECT ROUND(SUM(tiv_2016),2) tiv_2016
FROM Insurance i1 
WHERE tiv_2015 in  (SELECT  tiv_2015 FROM Insurance i2 WHERE i1.pid <> i2.pid )
AND (lat,lon) NOT in (SELECT  lat,lon FROM Insurance i2 WHERE i1.pid <> i2.pid )