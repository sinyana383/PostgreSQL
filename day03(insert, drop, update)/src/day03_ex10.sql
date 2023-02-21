insert into person_order
values
    (
     (select max(person_order.id) + 1 from person_order),
     (select person.id from person
         where person.name = 'Denis'),
     (select menu.id from menu
         where menu.pizza_name = 'sicilian pizza'),
     '2022-02-24'::date
    ),
    (
     (select max(person_order.id) + 2 from person_order),
     (select person.id from person
     where person.name = 'Irina'),
     (select menu.id from menu
     where menu.pizza_name = 'sicilian pizza'),
     '2022-02-24'::date
    );