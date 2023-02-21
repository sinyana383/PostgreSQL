select person_id,
       count(*) as count_of_visits
from  person_visits
join pizzeria p on p.id = person_visits.pizzeria_id
group by person_id
order by 2 desc, 1