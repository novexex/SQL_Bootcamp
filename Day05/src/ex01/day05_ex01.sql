set enable_seqscan = false;
set enable_indexscan = true;

explain analyse
select pizza_name, name as pizzeria_name
from menu
join pizzeria on pizzeria_id = pizzeria.id