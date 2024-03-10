{{ config(materialized='table')}}

with int_orders as
(
    select * from {{ ref('stg_orders') }}
)
select
    O_ORDERKEY as id_order
    ,O_CUSTKEY as id_customer
    ,O_ORDERSTATUS as st_order
    ,AVG(O_TOTALPRICE) as price
    ,O_ORDERDATE as dt_order
    ,SUBSTR(O_ORDERPRIORITY,3) as ds_priority
    ,TO_NUMBER(SUBSTR(O_CLERK, 7)) as id_clerk
    ,O_SHIPPRIORITY as nm_priority
from int_orders
group by 1, 2, 3, 5, 6, 7, 8