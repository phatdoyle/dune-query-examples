select count(distinct("from")) as distinct_senders, cast(evt_block_time as date) as date
from erc20."ERC20_evt_Transfer"
where "contract_address" = '\x6b175474e89094c44da98b954eedeac495271d0f' --Change the contract address to any ERC20 Address to get your information. 
and evt_block_time  > '2021-05-01 00:00'
group by date 
order by date desc