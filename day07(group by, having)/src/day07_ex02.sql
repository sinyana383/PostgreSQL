(select p.name,
       count(*),
       'order' as action_type
from person_order
join menu m on m.id = person_order.menu_id
join pizzeria p on p.id = m.pizzeria_id
group by p.name
order by 2 desc
fetch first 3 rows only)

union

(select p2.name,
       count(*),
       'visit' as action_type
from person_visits
join pizzeria p2 on p2.id = person_visits.pizzeria_id
group by p2.name
order by 2 desc
fetch first 3 rows only)

order by 3, 2 desc