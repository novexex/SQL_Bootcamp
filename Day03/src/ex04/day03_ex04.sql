(select pizzeria.name as pizzeria_name
from person_order po
join menu on po.menu_id = menu.id
join person on po.person_id = person.id
join pizzeria on menu.pizzeria_id = pizzeria.id
where gender = 'female'
except
select pizzeria.name as pizzeria_name
from person_order po
join menu on po.menu_id = menu.id
join person on po.person_id = person.id
join pizzeria on menu.pizzeria_id = pizzeria.id
where gender = 'male')
union
(select pizzeria.name as pizzeria_name
from person_order po
join menu on po.menu_id = menu.id
join person on po.person_id = person.id
join pizzeria on menu.pizzeria_id = pizzeria.id
where gender = 'male'
except
select pizzeria.name as pizzeria_name
from person_order po
join menu on po.menu_id = menu.id
join person on po.person_id = person.id
join pizzeria on menu.pizzeria_id = pizzeria.id
where gender = 'female')
order by 1
