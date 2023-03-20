CREATE OR REPLACE FUNCTION fnc_persons_female() RETURNS table(id      BIGINT,
                                                              name    VARCHAR,
                                                              age     INTEGER,
                                                              gender  VARCHAR,
                                                              address VARCHAR) as $$
select * from person where gender = 'female'
$$ language sql;

CREATE OR REPLACE FUNCTION fnc_persons_male() RETURNS table(
                                                              id      BIGINT,
                                                              name    VARCHAR,
                                                              age     INTEGER,
                                                              gender  VARCHAR,
                                                              address VARCHAR
                                                             ) as $$
select * from person where gender = 'male'
$$ language sql;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();