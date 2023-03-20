create table routes
( point1 varchar not null,
  point2 varchar not null,
  cost integer not null
);

insert into routes values ('a', 'b', 10);
insert into routes values ('b', 'a', 10);
insert into routes values ('a', 'd', 20);
insert into routes values ('d', 'a', 20);
insert into routes values ('a', 'c', 15);
insert into routes values ('c', 'a', 15);
insert into routes values ('b', 'c', 35);
insert into routes values ('c', 'b', 35);
insert into routes values ('d', 'b', 25);
insert into routes values ('b', 'd', 25);
insert into routes values ('d', 'c', 30);
insert into routes values ('c', 'd', 30);

with recursive a_traces as (
    select point1 as tour, point1, point2, cost
    from routes
    where point1 = 'a'
    union all
    select parent.tour || ',' || child.point1 as trace,
           child.point1,
           child.point2,
           parent.cost + child.cost
    from routes as child
    join a_traces as parent on child.point1 = parent.point2
        where tour not like '%' || child.point1 || '%'
) select t1.cost as total_cost, concat('{', tour, ',a}') from (select * from a_traces where length(tour) = 7 and point2 = 'a') as t1
order by 1, 2;
