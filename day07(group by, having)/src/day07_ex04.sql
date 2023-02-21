select name,
       count(name) as count_of_visits
from person_visits
join person p on p.id = person_visits.person_id
group by name
having (count(name) > 3)