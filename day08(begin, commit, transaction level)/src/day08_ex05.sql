-- s1,s2
begin;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
select sum(rating) from pizzeria;
-- s2
update pizzeria set rating = 1 where name = 'Pizza Hut';
commit;
-- s1
select sum(rating) from pizzeria;
commit;
-- s1,s2
select sum(rating) from pizzeria;