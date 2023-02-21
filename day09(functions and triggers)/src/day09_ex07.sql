CREATE or replace FUNCTION func_minimum(arr numeric[])
RETURNS numeric AS
$$
    select min(a) from unnest(arr) as a;
$$ LANGUAGE SQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
