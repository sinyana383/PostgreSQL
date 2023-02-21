with gender_prName as
    (   select p.gender, p2.name as pizzeria_name
        from person_order
        join person p on person_order.person_id = p.id
        join menu m on person_order.menu_id = m.id
        join pizzeria p2 on m.pizzeria_id = p2.id),
female_prName as
    (   select pizzeria_name from gender_prName
        where gender_prName.gender = 'female'),
male_prName as
    (   select pizzeria_name from gender_prName
        where gender_prName.gender = 'male')

(select pizzeria_name from female_prName
except
select pizzeria_name from male_prName)

union

(select pizzeria_name from male_prName
except
select pizzeria_name from female_prName)
order by 1;