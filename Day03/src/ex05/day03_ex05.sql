select pizzeria.name as pizzeria_name
from person_visits pv
join pizzeria on pizzeria_id = pizzeria.id
join person_order po on pv.person_id = po.person_id
join person on po.person_id = person.id
where person.name = 'Andrey'
and visit_date <> order_date