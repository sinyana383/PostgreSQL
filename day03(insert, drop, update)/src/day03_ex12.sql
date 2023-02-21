insert into person_order
select
    generate_series(max(person_order.id) + 1, max(person_order.id) + max(person.id)),
    generate_series(1, max(person.id)),
    (select menu.id from menu where pizza_name = 'greek pizza'),
    '2022-02-25'::date
from person_order, person;