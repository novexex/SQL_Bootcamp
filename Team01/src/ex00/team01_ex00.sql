with value_eur as (select * from currency where name = 'EUR' order by updated desc limit 1),
value_usd as (select * from currency where name ='USD' order by updated desc limit 1),
value_jpy as (select * from currency where name ='JPY' order by updated desc limit 1),
max_result as (select * from value_eur
                union
               select * from value_usd
                union
               select * from value_jpy)

select
(case when "user".name is null
    then 'not defined'
      else "user".name
  end),
(case when "user".lastname is null
    then 'not defined'
      else "user".lastname
  end),
balance.type,
sum(balance.money) volume,
(case when max_result.name is null
    then 'not defined'
      else max_result.name
  end) currency_name,
(case when max_result.rate_to_usd is null
    then 1
   else max_result.rate_to_usd
  end) last_rate_to_usd,
(case when max_result.rate_to_usd is null
    then 1 * sum(balance.money)
   else max_result.rate_to_usd * sum(balance.money)
  end) total_volume_in_usd
from "user"
full join balance on balance.user_id = public."user".id
full join max_result on balance.currency_id = max_result.id
group by "user".name, "user".lastname, balance.type, currency_name, max_result.rate_to_usd
order by 1 desc , 2, 3