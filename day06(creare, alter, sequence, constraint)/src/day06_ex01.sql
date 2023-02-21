with person_pizzeria_counts as
         (select person_order.person_id,
                 pizzeria_id,
                 count(*) as num
          from person_order
                   join menu on person_order.menu_id = menu.id
          group by person_id, pizzeria_id)
insert into person_discounts
select row_number() over () as id,
       person_id,
       pizzeria_id,
       (select case
                   when ppc.num = 1 then 10.5
                   when ppc.num = 2 then 22
                   else 30
                   end)     as discount
from person_pizzeria_counts ppc;
