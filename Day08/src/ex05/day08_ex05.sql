-- session 1
begin transaction;

-- session 2
begin transaction;

-- session 1
select sum(rating) from pizzeria;

-- session 2
update pizzeria set rating = 1 where name = 'Pizza Hut';
commit;

-- session 1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- session 2
select sum(rating) from pizzeria;
