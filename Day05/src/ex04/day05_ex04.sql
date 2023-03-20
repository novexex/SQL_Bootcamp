create unique index on menu (pizzeria_id, pizza_name);

explain analyse
select pizzeria_id, pizza_name
from menu