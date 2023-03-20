insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

select
    (case when "user".name is null
    then 'not defined'
      else "user".name
    end),
    (case when "user".lastname is null
    then 'not defined'
      else "user".lastname
    end),
    final.name as currency_name,
    final.money * COALESCE(final.rate_min, final.rate_max) as currency_in_usd
from
    (select
        balance.user_id,
        currency.id,
        currency.name,
        balance.money,
        (select currency.rate_to_usd from currency
                    where currency.id = currency_id
                      and currency.updated < balance.updated
                    order by rate_to_usd limit 1) as rate_min,
        (select currency.rate_to_usd from currency
                    where currency.id = currency_id
                      and currency.updated > balance.updated
                    order by rate_to_usd limit 1) as rate_max
    from currency
    join balance on currency.id = balance.currency_id
    group by
        balance.money,
        currency.name,
        currency.id,
        balance.updated,
        balance.currency_id,
        balance.user_id
    order by rate_min desc, rate_max) as final
left join "user" on final.user_id = "user".id
order by 1 desc, 2, 3