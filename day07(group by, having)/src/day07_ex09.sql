select address,
       round((max(age) - (min(age)/max(age)::numeric)),2) as formula,
       round(avg(age),2) as average,
        (round((max(age) - (min(age)/max(age)::numeric)),2)
        > round(avg(age),2)) as comparison
from person
group by address
order by 1