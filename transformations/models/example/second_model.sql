{{ config(materialized='table') }}

WITH by_department AS (
    SELECT 
        e.department,
        COUNT(e."name") AS employees,
        COUNT(e.termination_date) AS terminated,
        (COUNT(e."name") - COUNT(e.termination_date)) AS active_employees
    FROM {{ source('public', 'employees') }} e 
    GROUP BY e.department
)
SELECT 
    bd.department, 
    bd.employees, 
    bd.terminated, 
    bd.active_employees,
    ROUND((bd.terminated * 1.0 / bd.employees), 2) AS turnover_rate
FROM by_department bd
ORDER BY bd.active_employees DESC;
