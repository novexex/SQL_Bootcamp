create view v_symmetric_union as
select *
from (
         with r as (select person_id
                    from person_visits
                    where visit_date = '2022-01-02'),
              s as (select person_id
                    from person_visits
                    where visit_date = '2022-01-06')
         select *
         from (select * from r except select * from s) as t1
         union
         select *
         from (select * from r except select * from s) as t2
         order by person_id) as t3