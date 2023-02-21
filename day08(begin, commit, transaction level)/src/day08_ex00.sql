begin;
update pizzeria set rating = 5 where name = 'Pizza Hut';
select * from pizzeria where name = 'Pizza Hut';
select * from pizzeria where name = 'Pizza Hut'; -- 2
commit;
select * from pizzeria where name = 'Pizza Hut'; --2