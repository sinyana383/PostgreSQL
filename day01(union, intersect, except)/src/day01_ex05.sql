select person.id, person.name, age, gender, address, pizzeria.id, pizzeria.name, rating
from person, pizzeria
order by person.id, pizzeria.id