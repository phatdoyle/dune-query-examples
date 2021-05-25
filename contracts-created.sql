Select date_trunc('week', created_at) as date, count(address)
from ethereum.contracts
where created_at is not null
and created_at > '2020-01-01 00:00'
group by date
order by date desc