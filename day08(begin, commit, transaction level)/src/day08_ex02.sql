-- s1,s2
begin;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
select rating from pizzeria where name = 'Pizza Hut';
-- s1
update pizzeria set rating = 4 where name = 'Pizza Hut';
-- s2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
-- s1,s2
commit;
select rating from pizzeria where name = 'Pizza Hut';
