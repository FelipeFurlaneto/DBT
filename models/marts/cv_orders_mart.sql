{{ config(materialized='table') }}

with ord as
(
    select * from {{ ref('int_orders') }}
),

cus as
(
    select * from {{ ref('int_customer') }}
),

cv_orders_mart as 
(
select
o.id_order as id_order
,o.id_customer as id_customer
,c.ds_customer as ds_customer
,c.id_nation as id_nation
,sum(c.acc_balance) as account_balance
,c.ds_mkt_segment as ds_mkt_segment
,o.st_order as st_order
,coalesce(round(avg(o.price),3),0) as price
,o.dt_order as dt_order
,o.ds_priority as ds_priority
,o.id_clerk as id_clerk
,o.nm_priority as nm_priority
from ord o
left join cus c on o.id_customer = c.id_customer
group by 1, 2, 3, 4, 6, 7, 9, 10, 11, 12
)

select * from cv_orders_mart