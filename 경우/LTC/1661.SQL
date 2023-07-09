
SELECT machine_id ,
       round(sum(minu) / count(distinct process_id),3) processing_time
FROM (
  SELECT machine_id,
  process_id,
  lead(timestamp,1) over(partition by machine_id ,process_id order by timestamp ) - timestamp as minu
  FROM Activity ) a
GROUP BY machine_id
