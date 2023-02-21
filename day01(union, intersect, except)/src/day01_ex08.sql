select po.order_date, concat(p.name,' (age:', p.age, ')') as person_information
from person_order as po natural join (select id as person_id, name, age from person) as p
order by  po.order_date, person_information