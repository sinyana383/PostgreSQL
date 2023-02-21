select
    pizza_name,
    p.name as pizzeria_name,
    price
from menu
full join pizzeria p on p.id = menu.pizzeria_id
where pizza_name in ('mushroom pizza', 'pepperoni pizza')
order by pizza_name, pizzeria_name