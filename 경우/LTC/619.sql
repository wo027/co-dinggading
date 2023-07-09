SELECT max(num) as num
FROM (
	 SELECT num , count(num) as co
	  FROM MyNumbers
	  GROUP BY num
	  having co =1
) a
