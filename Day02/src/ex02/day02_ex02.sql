select
case
    when person.name is null then '-'
    else person.name
    end as person_name,
case
    when visit_date is null then null
    else visit_date
    end,
case
    when pizzeria.name is null then '-'
    else pizzeria.name
    end as pizzera_name
from person
full join (select * from person_visits where visit_date between '2022-01-01' and '2022-01-03') as ysl on person.id = ysl.person_id
full join pizzeria on pizzeria.id = ysl.pizzeria_id
order by 1, 2, 3