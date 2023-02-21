with day_gen as (
    select generate_series(date '2022-01-01','2022-01-10', '1 day') as gen_date
)
select
    gen_date::date as missing_date
from day_gen as missing_date
left join
    ( select visit_date from person_visits where person_id = 1 or person_id = 2) as vd
    on vd.visit_date = gen_date
where vd.visit_date is null
order by 1;