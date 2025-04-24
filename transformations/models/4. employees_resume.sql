{{ config(materialized='table') }}

WITH employees_resume AS 
(SELECT
    e.gender,
    e.department,
    e.job_title,
    EXTRACT(YEAR FROM now()::DATE) AS current_year,
    EXTRACT(YEAR FROM e.date_birth::DATE) AS birth_year,
    EXTRACT(YEAR FROM e.hire_date::DATE) AS hired_year,
    EXTRACT(YEAR FROM e.termination_date::DATE) AS termination_year,
    e.status,
    COUNT(e.id) AS employees
FROM {{ source('public', 'employees') }} e  
GROUP BY 
    e.gender,
    e.department,
    e.job_title,
    EXTRACT(YEAR FROM now()::DATE),
    EXTRACT(YEAR FROM e.date_birth::DATE),
    EXTRACT(YEAR FROM e.hire_date::DATE),
    EXTRACT(YEAR FROM e.termination_date::DATE),
    e.status
ORDER BY EXTRACT(YEAR FROM e.date_birth::DATE) ASC)
SELECT 
    er.gender,
    er.department,
    er.job_title,
    er.employees,
    (er.current_year - er.birth_year) AS age,
    CASE 
        WHEN er.termination_year IS NULL THEN (er.current_year - er.hired_year)
        ELSE (er.termination_year - er.hired_year)
    END AS working_years,
    er.status
FROM employees_resume er
ORDER BY age DESC;