select pizza_name, price, pizzeria.name as pizzeria_name, visit_date
from (select * from person where name = 'Kate') as ysl
left join person_visits pv on person_id = ysl.id
left join pizzeria on pizzeria.id = pv.pizzeria_id
left join menu on pv.pizzeria_id = menu.pizzeria_id
where price between 800 and 1000
order by 1, 2, 3, 4
