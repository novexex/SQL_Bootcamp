-- session 1
begin transaction;

-- session 2
begin transaction;

-- session 1
select * from pizzeria where name = 'Pizza Hut';

-- session 2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
commit;

-- session 1
select * from pizzeria where name = 'Pizza Hut';
commit;

-- session 1
select * from pizzeria where name = 'Pizza Hut';

-- session 2
select * from pizzeria where name = 'Pizza Hut';
