select 
    {{ dbt_utils.surrogate_key(['ord.orderid', 'cust.customerid', 'prod.productid']) }} as sk_orders,
    ord.orderid, ord.orderdate, ord.shipdate, 
    ord.shipmode, (ord.ordersellingprice - ord.ordercostprice) as orderprofit,
    ord.ordercostprice, ord.ordersellingprice, cust.customerid,
    cust.customername, cust.segment, cust.country, 
    prod.productid, prod.category, prod.productname, prod.subcategory,
    {{ markup('ordersellingprice', 'ordercostprice') }} as markup, del.delivery_team
from {{ ref('raw_orders') }} as ord
left join {{ ref('raw_customers') }} as cust
    on ord.customerid = cust.customerid
left join {{ ref('raw_products') }} as prod
    on ord.productid = prod.productid
left join {{ ref('delivery_team') }} as del
    on del.shipmode = ord.shipmode 