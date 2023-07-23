SELECT yr
      , mth
      ,ROUND( (cnt - lag(cnt) OVER(  ORDER BY yr , mth)) / lag(cnt) OVER( ORDER BY yr ,mth) * 100 ,1)
FROM (
  SELECT EXTRACT('year' FROM  call_received ) as yr
        , EXTRACT('month' FROM  call_received ) as mth
        , count(policy_holder_id)::NUMERIC AS cnt
  FROM callers
  WHERE call_duration_secs > 300
  GROUP BY 1,2 
)a 