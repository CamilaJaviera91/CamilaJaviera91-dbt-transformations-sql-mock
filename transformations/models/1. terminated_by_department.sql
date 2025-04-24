{{ config(materialized='table') }}

WITH employees AS (
    SELECT *
    FROM {{ source('public', 'employees') }}) 
    
    SELECT
        e.department, 
        COUNT(e.id) AS employees
    FROM employees e
    WHERE termination_date IS NOT NULL
    GROUP BY department