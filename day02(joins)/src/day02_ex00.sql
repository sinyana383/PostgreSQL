select p.name, p.rating from pizzeria p
left join person_visits pv on p.id = pv.pizzeria_id
where person_id is null