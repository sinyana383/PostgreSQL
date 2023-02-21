create or replace function fnc_person_visits_and_eats_on_date
    (pperson varchar default 'Dmitriy',
    pprice numeric default 500,
    pdate date default '2022-01-08'::date)
    returns table(name varchar) as
$$
begin
    return query
    select distinct p2.name from person_visits pv
    join person p on p.id = pv.person_id
    join person_order po on p.id = po.person_id
    join menu m on po.menu_id = m.id
    join pizzeria p2 on p2.id = m.pizzeria_id
    where price < pprice and p.name = pperson
      and po.order_date = pdate and pv.visit_date = pdate;
end;
$$
language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');