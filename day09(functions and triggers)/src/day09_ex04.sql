CREATE or replace FUNCTION fnc_persons_female()
RETURNS table(id bigint,
  name varchar,
  age integer,
  gender varchar,
  address varchar) AS
$$
    select * from person where gender = 'female';
$$ LANGUAGE SQL;

CREATE or replace FUNCTION fnc_persons_male()
RETURNS table(id bigint,
  name varchar,
  age integer,
  gender varchar,
  address varchar) AS
$$
    select * from person where gender = 'male';
$$ LANGUAGE SQL;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();