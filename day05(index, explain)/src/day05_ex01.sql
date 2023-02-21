set enable_seqscan = off;
EXPLAIN analyze select
    pizza_name,
    name
from pizzeria, menu m
where m.pizzeria_id = pizzeria.id;
set enable_seqscan = on;
