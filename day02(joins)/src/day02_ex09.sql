with person_join_menu as
    (select person.name, m.pizza_name
        from person
        join person_order po on person.id = po.person_id
        join menu m on m.id = po.menu_id
        where gender = 'female'
    )

select name from person_join_menu
    where pizza_name in ('cheese pizza')

intersect
select name from person_join_menu
    where pizza_name in ('pepperoni pizza')
order by name
