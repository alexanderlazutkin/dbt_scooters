select
 date(started_at) as date --— дата начала поездки (день).
,count(*) as trips --— количество поездок за этот день.
,max(price)/100 --— максимальная стоимость поездки за день в рублях.
,avg(distance)/1000 as avg_distance_km --— средняя дальность поездки за день в километрах.
from
    scooters_raw.trips
group by date(started_at)
having count(*) <1000
order by date