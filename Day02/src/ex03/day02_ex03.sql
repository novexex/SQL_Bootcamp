with dates_generator as (
    select *
    from generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp,
                         '1 day'::interval) AS missing_date
)

select to_char(missing_date, 'YYYY-MM-DD') AS missing_date
from (select missing_date
      from dates_generator
            left outer join (
            select visit_date as dates
            from person_visits
            where person_id = 1
               or person_id = 2) as ysl on ysl.dates = missing_date
            where ysl.dates is null) as bar