drop function fnc_persons_female;
drop function fnc_persons_male;

CREATE or replace FUNCTION fnc_persons(in pgender varchar default 'female')
RETURNS table(id bigint,
  name varchar,
  age integer,
  gender varchar,
  address varchar) AS
$$
    select * from person where gender = pgender;
$$ LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();