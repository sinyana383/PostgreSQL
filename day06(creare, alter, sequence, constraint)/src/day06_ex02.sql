select p.name, pizza_name, price,
       ((1 - pd.discount/100) * m.price) as discount_price, -- round?
       p2.name as pizzeria_name
from person_order
join menu m on person_order.menu_id = m.id
join person p on p.id = person_order.person_id
join pizzeria p2 on p2.id = m.pizzeria_id
join person_discounts pd on p.id = pd.person_id and p2.id = pd.pizzeria_id
order by 1,2