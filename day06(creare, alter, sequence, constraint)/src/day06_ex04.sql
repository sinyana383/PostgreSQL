alter table person_discounts
    add constraint ch_nn_person_id check (person_id IS NOT NULL), -- check not null - ch_nn
    add constraint ch_nn_pizzeria_id check (pizzeria_id IS NOT NULL),
    add constraint ch_nn_discount check (discount IS NOT NULL),
    alter column discount set default 0,
    add constraint ch_range_discount check (discount >= 0 and discount <= 100);