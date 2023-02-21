insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE or replace FUNCTION fnc_persons(balance_update timestamp, currency_id integer)
RETURNS numeric AS
$$
    with t as(
    (select * from currency where updated < balance_update and currency_id = currency.id
    order by updated desc
    limit 1)
    union all
    (select * from currency where updated >= balance_update and currency_id = currency.id
    order by updated
    limit 1))
    select rate_to_usd from t limit 1
$$ LANGUAGE SQL;

select
        coalesce(u.name, 'not defined'), coalesce(u.lastname, 'not defined'),
        c.name,
       (money * fnc_persons(balance.updated, balance.currency_id)) as currency_in_usd
from balance
left join "user" u on u.id = balance.user_id
join (select distinct id, name from currency) c on c.id = balance.currency_id
order by 1 desc, 2, 3;