select person.name as person_name, pizza_name, pizzeria.name as pizzeria_name
from person_order
       inner join person on person_id = person.id
       inner join menu on menu_id = menu.id
       inner join pizzeria on pizzeria_id = pizzeria.id
order by person_name, pizza_name, pizza_name