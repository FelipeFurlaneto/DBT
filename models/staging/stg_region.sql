{{ config(materialized='view') }}

with stg_regn as
(
    select * from inbound.region
)
select * from stg_regn