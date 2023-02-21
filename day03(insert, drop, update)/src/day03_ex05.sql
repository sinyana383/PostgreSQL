select
    pizzeria.name as pizzeria_name
    from person_visits
    join person on person.id = person_visits.person_id
    join pizzeria on person_visits.pizzeria_id = pizzeria.id
    where person.name = 'Andrey'
except
select
    pizzeria.name as pizzeria_name
    from person_order
    join person on person.id = person_order.person_id
    join menu on person_order.menu_id = menu.id
    join pizzeria on menu.pizzeria_id = pizzeria.id
    where person.name = 'Andrey'
order by 1;