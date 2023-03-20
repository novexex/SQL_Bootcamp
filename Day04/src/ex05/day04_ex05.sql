create view v_price_with_discount as
select person.name, pizza_name, price, (price - price * 0.1) as discount_price
from person_order
join person on person_id = person.id
join menu on menu_id = menu.id
order by 1, 2