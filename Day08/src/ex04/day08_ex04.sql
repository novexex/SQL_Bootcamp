-- session 1
begin transaction;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;

-- session 2
begin transaction;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;

-- session 1
select * from pizzeria where name = 'Pizza Hut';

-- session 2
update pizzeria set rating = 3.0 where name = 'Pizza Hut';
commit;

-- session 1
select * from pizzeria where name = 'Pizza Hut';
commit;

-- session 1
select * from pizzeria where name = 'Pizza Hut';

-- session 2
select * from pizzeria where name = 'Pizza Hut';
