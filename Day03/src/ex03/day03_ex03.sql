(select pizzeria.name as pizzeria_name
from person_visits pv
join person on pv.person_id = person.id
join pizzeria on pizzeria.id = pv.pizzeria_id
where gender = 'female'
except all
select pizzeria.name as pizzeria_name
from person_visits pv
join person on pv.person_id = person.id
join pizzeria on pizzeria.id = pv.pizzeria_id
where gender = 'male')
union all
(select pizzeria.name as pizzeria_name
from person_visits pv
join person on pv.person_id = person.id
join pizzeria on pizzeria.id = pv.pizzeria_id
where gender = 'male'
except all
select pizzeria.name as pizzeria_name
from person_visits pv
join person on pv.person_id = person.id
join pizzeria on pizzeria.id = pv.pizzeria_id
where gender = 'female')
order by 1
