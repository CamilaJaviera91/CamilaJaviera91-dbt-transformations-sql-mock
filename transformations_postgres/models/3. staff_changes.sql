{{ config(materialized='table') }}

SELECT 
    EXTRACT(YEAR FROM COALESCE(e.hire_date::DATE, e.termination_date::DATE)) AS year,
    e.department,
    COUNT(e.id) FILTER (WHERE e.hire_date IS NOT NULL) AS hired_count,
    COUNT(e.id) FILTER (WHERE e.termination_date IS NOT NULL) AS terminated_count
FROM {{ source('public', 'employees') }} e
WHERE e.hire_date IS NOT NULL OR e.termination_date IS NOT NULL
GROUP BY 
    EXTRACT(YEAR FROM COALESCE(e.hire_date::DATE, e.termination_date::DATE)), 
    e.department
ORDER BY year