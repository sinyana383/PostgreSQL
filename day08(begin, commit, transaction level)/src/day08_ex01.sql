-- s1
SHOW TRANSACTION ISOLATION LEVEL;
begin;
select rating from pizzeria where name = 'Pizza Hut';
update pizzeria set rating = 4 where name = 'Pizza Hut'; -- а
commit;
select rating from pizzeria where name = 'Pizza Hut';

-- s2
-- то же, что и в s1, но вместо "a":
update pizzeria set rating = 3.6 where name = 'Pizza Hut';