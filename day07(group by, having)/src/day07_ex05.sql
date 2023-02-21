select distinct name
from person_order
join person p on p.id = person_order.person_id
order by 1