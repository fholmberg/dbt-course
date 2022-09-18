select 
    ord.orderid, ord.orderdate, ord.shipdate, 
    ord.shipmode, (ord.ordersellingprice - ord.ordercostprice) as orderprofit,
    ord.ordercostprice, ord.ordersellingprice,
    cust.customername, cust.segment, cust.country,
    prod.category, prod.productname, prod.subcategory 
from {{ ref('raw_orders') }} as ord
left join {{ ref('raw_customers') }} as cust
    on ord.customerid = cust.customerid
left join {{ ref('raw_products') }} as prod
    on ord.productid = prod.productid
