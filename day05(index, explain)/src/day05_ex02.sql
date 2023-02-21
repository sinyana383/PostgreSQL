set enable_seqscan = off;
create index idx_person_name
on person using btree (upper(name));
explain analyze  select p.name, address from person p
where upper(p.name) = 'ANDREY';
set enable_seqscan = on;