create sequence seq_person_discounts start 1;
SELECT setval('seq_person_discounts', count(id) + 1, false) from person_discounts;
alter table person_discounts alter column id set default nextval('seq_person_discounts');
select * from seq_person_discounts;
insert into person_discounts (person_id, pizzeria_id, discount)
values (3, 3, 10.5)