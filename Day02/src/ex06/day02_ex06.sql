select pizza_name, pizzeria.name as pizzeria_name
from (select * from person where name = 'Denis' or name = 'Anna') as ysl
left join person_order on ysl.id = person_order.person_id
left join menu on person_order.menu_id = menu.id
left join pizzeria on menu.pizzeria_id = pizzeria.id
order by 1, 2