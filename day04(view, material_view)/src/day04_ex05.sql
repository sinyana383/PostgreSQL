create view v_price_with_discount as
select p.name,
       m.pizza_name,
       m.price,
       round(m.price - price * 0.1) as discount_price
from person_order
         join person p on p.id = person_order.person_id
         join menu m on m.id = person_order.menu_id
order by 1, 2;