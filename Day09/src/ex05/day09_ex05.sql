CREATE OR REPLACE FUNCTION fnc_persons(in pgender varchar default 'female') RETURNS table(id      BIGINT,
                                                                                          name    VARCHAR,
                                                                                          age     INTEGER,
                                                                                          gender  VARCHAR,
                                                                                          address VARCHAR) as $$
select * from person where gender = pgender
$$ language sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
