select name from pizzeria
where pizzeria.id not in (select pizzeria_id from person_visits);
select name from pizzeria
where not exists
    (select pizzeria_id from person_visits where pizzeria_id = pizzeria.id);