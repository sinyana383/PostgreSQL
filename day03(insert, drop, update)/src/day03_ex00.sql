select
    m.pizza_name as pizza_name,
    price,
    pizzeria.name as pizzeria_name,
    visit_date
from person_visits
join person on person.id = person_visits.person_id
join pizzeria on person_visits.pizzeria_id = pizzeria.id
join menu m on pizzeria.id = m.pizzeria_id
where person.name = 'Kate' and price between 800 and 1000
order by 1, 2, 3;