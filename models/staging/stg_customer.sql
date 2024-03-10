{{ config(materialized='view') }}

with stg_cust as
(
    select * from inbound.customer
)
select * from stg_cust