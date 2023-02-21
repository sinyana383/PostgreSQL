with recursive r as (
    -- стартовая часть рекурсии
    select point1 as start, point1, point2, cost, cost as total_cost, 1 as level
    from tsp
    where point1 = 'a'

    union

    -- рекурсивная часть
   select
          r.start || ',' || tsp.point1,
          tsp.point1, tsp.point2,
          tsp.cost,
          total_cost + tsp.cost,
          r.level + 1
   from tsp                         -- tsp - таблица с километражем
   join r on                        -- r - предидущее объединение
            tsp.point1 = r.point2
            and level < 4
            where not r.start ~ tsp.point1  -- нахождение символа в строке
)
(select r.total_cost,
           '{' || r.start || ',a}' as tour
    from r
    where r.total_cost = (select min(r.total_cost) from r where level = 4 and point2 = 'a') and point2 = 'a')
union
(select r.total_cost,
           '{' || r.start || ',a}' as tour
    from r
    where r.total_cost = (select max(r.total_cost) from r where level = 4 and point2 = 'a') and point2 = 'a')
order by 1, 2;