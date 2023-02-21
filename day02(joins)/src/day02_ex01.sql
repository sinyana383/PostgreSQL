select
    missing_date::date
from generate_series(date '2022-01-01','2022-01-10', '1 day') AS missing_date
left join
    ( select visit_date from person_visits where person_id = 1 or person_id = 2) as vd
    on vd.visit_date = missing_date
where vd.visit_date is null
order by 1