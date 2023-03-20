select distinct t1.pizza_name, t1.name as pizzeria_name_1, t2.name as pizzeria_name_2, t1.price
from
     (select distinct pizza_name, price, pizzeria_id, name  from menu, pizzeria where pizzeria_id = pizzeria.id) as t1,
     (select distinct pizza_name, price, pizzeria_id, name from menu, pizzeria where pizzeria_id = pizzeria.id) as t2
where t1.price = t2.price and t1.pizzeria_id <> t2.pizzeria_id and t2.pizzeria_id < t1.pizzeria_id
order by 1

