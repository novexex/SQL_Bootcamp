select to_char(missing_date, 'YYYY-MM-DD') as missing_date
from (select missing_date
      from generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp,
                           '1 day'::interval) as missing_date
               left join (
          select visit_date as dates
          from person_visits
          where person_id = 1
             or person_id = 2
      ) as foo on foo.dates = missing_date
      where foo.dates is null) as bar