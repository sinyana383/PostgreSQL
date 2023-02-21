select coalesce(u.name, 'not defined'), coalesce(u.lastname, 'not defined'), b.type, sum(b.money) as volume,
		coalesce(c.name, 'not defined') as currency_name, coalesce(c2.rate_to_usd, '1') as last_rate_to_usd,
		(sum(b.money)*coalesce(c2.rate_to_usd, '1')) as total_volume_in_usd
from "user" u
full join balance b on b.user_id=u.id
full join (select c.id, c.name, max(c.updated) as last_update from currency c
		  group by 1, 2) as c on c.id=b.currency_id
left join currency c2 on c2.name=c.name and c2.updated=c.last_update
group by 1, 2, 3, 5, 6
order by 1 desc, 2, 3;