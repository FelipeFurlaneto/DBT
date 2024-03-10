{{ config(materialized='view') }}

with stg_ords as
(
    select * from inbound.orders
)
select * from stg_ords