select
    person.name
from person
join person_order po on person.id = po.person_id
join menu m on po.menu_id = m.id
where gender = 'male' and
      address in ('Moscow', 'Samara') and pizza_name in ('mushroom pizza', 'pepperoni pizza')
order by person.name desc;