{{ config(materialized='table') }}

WITH employees AS (
    SELECT *
    FROM {{ source('public', 'employees') }}) 

    SELECT 
        EXTRACT(YEAR FROM COALESCE(e.hire_date::DATE, e.termination_date::DATE)) AS year,
        e.department,
        COUNT(e.id) FILTER (WHERE e.hire_date IS NOT NULL) AS hired_count,
        COUNT(e.id) FILTER (WHERE e.termination_date IS NOT NULL) AS terminated_count
    FROM employees e
    WHERE hire_date IS NOT NULL OR termination_date IS NOT NULL
    GROUP BY 
        EXTRACT(YEAR FROM COALESCE(hire_date::DATE, termination_date::DATE)), 
        department
    ORDER BY year