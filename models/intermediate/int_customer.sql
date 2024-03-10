{{ config(materialized='table')}}

with int_cust as
(
    select * from {{ ref('stg_customer') }}
)
select 
    C_CUSTKEY as id_customer
    ,C_NAME as ds_customer
    ,C_ADDRESS as ds_customer_address
    ,C_NATIONKEY as id_nation
    ,C_PHONE as ds_customer_phone
    ,SUM(C_ACCTBAL) as acc_balance
    ,C_MKTSEGMENT as ds_mkt_segment
from int_cust
group by 1, 2, 3, 4, 5, 7