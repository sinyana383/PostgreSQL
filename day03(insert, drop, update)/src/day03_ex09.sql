insert into person_visits
values
    (
     (select max(person_visits.id) + 1 from person_visits),
     (select person.id from person
         where person.name = 'Denis'),
     (select pizzeria.id from pizzeria
         where pizzeria.name = 'Dominos'),
     '2022-02-24'::date
    ),
    (
     (select max(person_visits.id) + 2 from person_visits),
     (select person.id from person
     where person.name = 'Irina'),
     (select pizzeria.id from pizzeria
     where pizzeria.name = 'Dominos'),
     '2022-02-24'::date
    );