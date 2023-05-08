SELECT calc_weather.id
FROM Weather
    LEFT JOIN Weather AS calc_weather ON Weather.recordDate = DATE_ADD(calc_weather.recordDate, INTERVAL -1 DAY)
WHERE Weather.temperature < calc_weather.temperature
;