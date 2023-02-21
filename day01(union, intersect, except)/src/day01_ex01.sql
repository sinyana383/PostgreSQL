select *
from (select name from person
    order by name) as object_name

union all
select *
from (select pizza_name from menu
    order by pizza_name) as object_name;