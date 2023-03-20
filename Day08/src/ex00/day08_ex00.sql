-- session 1
begin transaction;
update pizzeria set rating = 5 where name = 'Pizza Hut';
select * from pizzeria where name = 'Pizza Hut';

-- session 2
select * from pizzeria where name = 'Pizza Hut';

-- session 1
commit;
select * from pizzeria where name = 'Pizza Hut';

-- session 2
select * from pizzeria where name = 'Pizza Hut';