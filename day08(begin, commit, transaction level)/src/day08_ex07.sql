-- s1,s2
begin;
SET TRANSACTION ISOLATION LEVEL read committed ;
-- s1
update pizzeria set rating = 1
where id = 1;
-- s2
update pizzeria set rating = 1
where id = 2;
-- s1
update pizzeria set rating = 1
where id = 2;
-- s2
update pizzeria set rating = 1
where id = 1;
-- s1,s2
commit