create materialized view mv_dmitriy_visits_and_eats as
select pizzeria.name
from person_visits
         join person p on p.id = person_visits.person_id
         join pizzeria on person_visits.pizzeria_id = pizzeria.id
         join menu m on pizzeria.id = m.pizzeria_id
where p.name = 'Dmitriy'
  and visit_date = '2022-01-08'
  and price < 800