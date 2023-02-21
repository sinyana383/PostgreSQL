comment on table person_discounts is 'get person discount by their id or help pizzeria find out people with discount';
comment on column person_discounts.id is 'unique id to recognize discount';
comment on column person_discounts.person_id is 'person id which leads to person info';
comment on column person_discounts.pizzeria_id is 'pizzeria id which leads to pizzeria info';
comment on column person_discounts.discount is 'discount in %';