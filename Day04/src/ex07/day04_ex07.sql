insert into person_visits
values ((select max(id) + 1 as id from person_visits),
        (select id as person_id from person where name = 'Dmitriy'),
        (select pizzeria.id as pizzeria_id
         from pizzeria
                  join menu on pizzeria.id = menu.pizzeria_id
         where name <> (select * from mv_dmitriy_visits_and_eats)
           and price < 800
         limit 1),
        '2022-01-08'::date);

refresh materialized view mv_dmitriy_visits_and_eats;