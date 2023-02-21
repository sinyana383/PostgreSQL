select p2.name,
       count(*) as count_of_visits
from  person_visits
join pizzeria p on p.id = person_visits.pizzeria_id
join person p2 on p2.id = person_visits.person_id
group by p2.name, person_id
order by 2 desc, 1
limit 4