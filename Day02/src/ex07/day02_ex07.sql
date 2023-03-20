select pizzeria.name
from pizzeria
join person_visits pv on pizzeria.id = pv.pizzeria_id
join person p on pv.person_id = p.id
join menu m on pv.pizzeria_id = m.pizzeria_id
where p.name = 'Dmitriy'
and pv.visit_date = '2022-01-08'
and m.price < 800
