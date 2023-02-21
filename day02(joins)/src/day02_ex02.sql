select
    COALESCE(pv_p.name, '-') as person_name,
    visit_date,
    COALESCE(piz.name, '-') as pizzeria_name
from pizzeria piz
full join
    (select visit_date, pizzeria_id, name from
        (select pizzeria_id, person_id, visit_date from person_visits
        where visit_date between '2022-01-01' and '2022-01-03') as pv
    full join
        person p on p.id = pv.person_id) as pv_p
    on piz.id = pv_p.pizzeria_id
order by person_name, visit_date, pizzeria_name;