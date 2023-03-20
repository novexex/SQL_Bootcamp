select order_date as action_date, person_id
from person_order
UNION
select visit_date as action_date, person_id
from person_visits
ORDER BY action_date ASC, person_id DESC