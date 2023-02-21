select
    pizza_name,
    (p.name) as pizzeria_name
from menu
join (select name, po.menu_id from person
        join person_order po on person.id = po.person_id
        where name in ('Denis','Anna')) as den_ann
on den_ann.menu_id = menu.id
join pizzeria p on p.id = menu.pizzeria_id
order by pizza_name, pizzeria_name