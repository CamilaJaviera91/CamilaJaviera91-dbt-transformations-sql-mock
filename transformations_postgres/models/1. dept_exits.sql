{{ config(materialized='table') }}

SELECT
    e.department, 
    COUNT(e.id) AS employees
FROM {{ source('public', 'employees') }} e
WHERE e.termination_date IS NOT NULL
GROUP BY e.department