select distinct name
from person
         join person_order on person.id = person_order.person_id
         join menu on person_order.menu_id = menu.id
where person.gender = 'female'
  and menu.pizza_name = 'pepperoni pizza'
intersect
select distinct name
from person
         join person_order on person.id = person_order.person_id
         join menu on person_order.menu_id = menu.id
where person.gender = 'female'
  and menu.pizza_name = 'cheese pizza'
order by name