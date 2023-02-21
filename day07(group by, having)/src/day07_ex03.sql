with vis_ord_pizzeria as (
(select p.name,
       count(*) as c,
       'order' as action_type
from person_order
join menu m on m.id = person_order.menu_id
join pizzeria p on p.id = m.pizzeria_id
group by p.name)

union

(select p2.name,
       count(*) as c,
       'visit' as action_type
from person_visits
join pizzeria p2 on p2.id = person_visits.pizzeria_id
group by p2.name)
)

select vop.name,
        sum(vop.c) as total_count
from vis_ord_pizzeria vop
group by name
order by 2 desc, 1