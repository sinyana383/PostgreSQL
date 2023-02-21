with not_ordered_piz as
    (   select id as menu_id from menu
        except
        select menu_id from person_order
        order by menu_id)

select
    pizza_name,
    price,
    p.name as pizzeria_name
from not_ordered_piz
join menu on menu.id = not_ordered_piz.menu_id
join pizzeria p on p.id = menu.pizzeria_id
order by 1, 2;