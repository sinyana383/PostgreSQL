set enable_seqscan = off;
create unique index idx_person_discounts_unique
on person_discounts using btree (person_id, pizzeria_id);
explain analyze select distinct person_id, pizzeria_id, discount from person_discounts;
set enable_seqscan = on;