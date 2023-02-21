select
    m1.pizza_name,
    p1.name as pizzeria_name_1,
    p2.name as pizzeria_name_2,
    m1.price
from menu m1
join menu m2 on m1.price = m2.price and m1.pizza_name = m2.pizza_name
join pizzeria p1 on p1.id = m1.pizzeria_id
join pizzeria p2 on p2.id = m2.pizzeria_id
where m1.pizzeria_id != m2.pizzeria_id and p1.name < p2.name
order by 1;