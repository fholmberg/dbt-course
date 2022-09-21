select 
    ord.orderid, ord.orderdate, ord.shipdate, 
    ord.shipmode, (ord.ordersellingprice - ord.ordercostprice) as orderprofit,
    ord.ordercostprice, ord.ordersellingprice, cust.customerid,
    cust.customername, cust.segment, cust.country, 
    prod.productid, prod.category, prod.productname, prod.subcategory,
    {{ markup('ordersellingprice', 'ordercostprice') }} as markup
from {{ ref('raw_orders') }} as ord
left join {{ ref('raw_customers') }} as cust
    on ord.customerid = cust.customerid
left join {{ ref('raw_products') }} as prod
    on ord.productid = prod.productid
