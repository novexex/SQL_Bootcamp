select name
from person
join person_order po on person.id = po.person_id
join menu on po.menu_id = menu.id

where person.gender = 'male'
and person.address = 'Moscow' or person.address = 'Samara'
and menu.pizza_name = 'pepperoni pizza'
or menu.pizza_name = 'mushroom pizza'
and menu.pizza_name = 'pepperoni pizza' and menu.pizza_name = 'mushroom pizza'
order by name desc