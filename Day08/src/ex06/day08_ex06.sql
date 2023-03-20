-- session 1
begin transaction;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

-- session 2
begin transaction;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

-- session 1
select sum(rating) from pizzeria;

-- session 2
update pizzeria set rating = 5 where name = 'Pizza Hut';
commit;

-- session 1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- session 2
select sum(rating) from pizzeria;
