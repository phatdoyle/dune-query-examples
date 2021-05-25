with rcd as (
select "to", count("tokenId") as received
from erc721."ERC721_evt_Transfer"
where "contract_address" = '\x7bd29408f11d2bfc23c34f18275bbf23bb716bc7' --Change the contract address to any ERC721 Address to get your information.
group by "to"
), 

sent as (
select "from", count("tokenId") as sent
from erc721."ERC721_evt_Transfer"
where "contract_address" = '\x7bd29408f11d2bfc23c34f18275bbf23bb716bc7'  --Change the contract address to any ERC721 Address to get your information. 
group by "from"
)

select "to", received, sent, (received - sent) as balance
from rcd as a
join sent as b
on a."to" = b."from"
where (received - sent) > 20
order by balance desc