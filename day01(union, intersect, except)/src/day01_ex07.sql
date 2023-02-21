select po.order_date, concat(name,' (age:', age, ')') as person_information
from person join person_order po on person.id = po.person_id
order by  po.order_date, person_information