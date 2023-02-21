set enable_seqscan = off;
create unique index idx_menu_unique
on menu using btree (pizzeria_id, pizza_name);
EXPLAIN ANALYZE select p.name, pizza_name from menu
join pizzeria p on p.id = menu.pizzeria_id
where pizza_name = 'cheese pizza';
set enable_seqscan = on;
