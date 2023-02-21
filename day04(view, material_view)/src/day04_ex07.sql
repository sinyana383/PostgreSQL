insert into person_visits
values ((select max(person_visits.id) + 1 from person_visits),
        (select person.id
         from person
         where person.name = 'Dmitriy'),
        (select pizzeria.id
         from pizzeria
         where pizzeria.name = 'DoDo Pizza'),
        '2022-01-8'::date);
refresh materialized view mv_dmitriy_visits_and_eats;