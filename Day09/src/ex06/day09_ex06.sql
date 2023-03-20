CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(in pperson varchar default 'Dmitry',
                                                              in pprice numeric default 500,
                                                              in pdate date default '2022-01-08') RETURNS VARCHAR as $$
                                                              declare pizzeria_name varchar;
begin
    select pizzeria.name into pizzeria_name from person
    join person_visits on person.id = person_visits.person_id
    join person_order on person.id = person_order.person_id
    join menu on person_order.menu_id = menu.id
    join pizzeria on menu.pizzeria_id = pizzeria.id
    where person.name = pperson
    and menu.price = pprice
    and person_visits.visit_date = pdate;
    RETURN pizzeria_name;
end
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
