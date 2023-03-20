select ysl.name as person_name1, ysl1.name as person_name2, ysl.address as common_address
from (select distinct name, address from person) as ysl,
     (select distinct name, address from person) as ysl1
where ysl.address = ysl1.address
and ysl.name < ysl1.name
order by 1, 2, 3