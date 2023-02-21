-- s1,s2
begin;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
select rating from pizzeria where name = 'Pizza Hut';
-- s2
update pizzeria set rating = 3.0 where name = 'Pizza Hut';
commit;
-- s1
select rating from pizzeria where name = 'Pizza Hut';
commit;
-- s1,s2
select rating from pizzeria where name = 'Pizza Hut';