with gender_prName as
    (   select p.gender, p2.name as pizzeria_name
        from person_visits
        join person p on person_visits.person_id = p.id
        join pizzeria p2 on person_visits.pizzeria_id = p2.id),
female_prName as
    (   select pizzeria_name from gender_prName
        where gender_prName.gender = 'female'),
male_prName as
    (   select pizzeria_name from gender_prName
        where gender_prName.gender = 'male')

(select pizzeria_name from female_prName
except all
select pizzeria_name from male_prName)

union all

(select pizzeria_name from male_prName
except all
select pizzeria_name from female_prName)
order by 1;