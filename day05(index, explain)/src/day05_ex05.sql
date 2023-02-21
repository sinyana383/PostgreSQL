set enable_seqscan = off;
create unique index idx_person_order_order_date
on person_order using btree (person_id, menu_id, order_date)
where order_date = '2022-01-01'::date;
EXPLAIN ANALYZE select order_date, menu_id
from person_order
where order_date = '2022-01-01'::date;
set enable_seqscan = on;