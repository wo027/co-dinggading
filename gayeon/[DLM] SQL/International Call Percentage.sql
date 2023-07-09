WITH phone_calls_info AS (
    SELECT 
        phone_calls.caller_id
      , phone_info.country_id
      , phone_calls.receiver_id
    FROM
        phone_calls
        INNER JOIN phone_info
          ON phone_calls.caller_id = phone_info.caller_id
)

SELECT 
    ROUND(
        SUM(
            CASE WHEN phone_calls_info.country_id != phone_info.country_id
            THEN 1 END
        )::DECIMAL / COUNT(phone_calls_info.caller_id) * 100, 1
    ) AS international_calls_pct
FROM 
    phone_calls_info
    INNER JOIN phone_info
      ON phone_calls_info.receiver_id = phone_info.caller_id
;
