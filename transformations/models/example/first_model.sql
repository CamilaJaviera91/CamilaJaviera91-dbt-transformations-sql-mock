{{ config(materialized='table') }}

with employees as (

    select *
    from {{ source('public', 'employees') }}

)

select 
    department, 
    count(*) as employees
from employees
where termination_date is not null
group by department