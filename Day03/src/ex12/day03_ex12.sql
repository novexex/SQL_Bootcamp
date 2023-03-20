insert into person_order
select id, person_id, menu_id, order_date
from (
         select distinct generate_series((select max(id) from person_order) + 1,
                                         (select max(id) from person_order) +
                                         (select count(id) from person),
                                         1) as id,
                         generate_series(1,
                                         (select max(id) from person),
                                         1) as person_id,
                         menu.id            as menu_id,
                         '2022-02-25'::date as order_date
         from person_order,
              person,
              menu
         where menu.pizza_name = 'greek pizza'
         order by id, person_id, menu_id
     ) as foo;