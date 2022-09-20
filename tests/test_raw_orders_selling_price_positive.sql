with orders as(
    select * from {{ ref('raw_orders') }}
)

select orderid, sum(ordersellingprice) as sum_sell_price
from orders
group by 1
having sum(ordersellingprice) < 0 