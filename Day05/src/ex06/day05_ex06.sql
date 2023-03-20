create index idx_1 on pizzeria(rating);

explain analyse
select menu.pizza_name as pizza_name,
       max(rating)
       over (partition by rating order by rating rows between unbounded preceding and current row)
from menu
join pizzeria on menu.pizzeria_id = pizzeria.id
order by 1, 2