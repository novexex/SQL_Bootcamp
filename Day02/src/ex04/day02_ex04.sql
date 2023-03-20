select pizza_name, p.name, price
from menu
join pizzeria p on menu.pizzeria_id = p.id
where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'
order by pizza_name, p.name