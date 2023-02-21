create view v_symmetric_union as
select person_id
from ((select *
       from person_visits
       where visit_date = '2022-01-2'
       except
       select *
       from person_visits
       where visit_date = '2022-01-6')

      union

      (select *
       from person_visits
       where visit_date = '2022-01-6'
       except
       select *
       from person_visits
       where visit_date = '2022-01-2')
      order by person_id) as sim_union;
