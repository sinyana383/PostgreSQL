set enable_seqscan = off;
create index idx_person_order_multi
on person_order using btree (person_id,menu_id,order_date);
explain analyze SELECT person_id, menu_id,order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;
explain analyze SELECT person_id, menu_id
FROM person_order
where person_id = 9;
set enable_seqscan = on;