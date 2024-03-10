{{ config(materialized='table') }}

with int_region as
(
    select * from {{ ref('stg_region') }}
)
select 
    R_REGIONKEY as id_region
    ,R_NAME as ds_region
from int_region
group by 1, 2