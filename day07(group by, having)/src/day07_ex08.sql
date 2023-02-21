select address, p.name,
       count(*) as count_of_orders
from person_order
join menu m on m.id = person_order.menu_id
join pizzeria p on p.id = m.pizzeria_id
join person p2 on p2.id = person_order.person_id
group by (address, p.name)
order by 1, 2