{{ config(materialized='table') }}

WITH employees_resume AS (
  SELECT
    e.gender,
    e.department,
    e.job_title,
    EXTRACT(YEAR FROM CURRENT_DATE()) AS current_year,
    EXTRACT(YEAR FROM DATE(e.date_birth)) AS birth_year,
    EXTRACT(YEAR FROM DATE(e.hire_date)) AS hired_year,
    EXTRACT(YEAR FROM DATE(e.termination_date)) AS termination_year,
    e.status,
    COUNT(e.id) AS employees
  FROM {{ source('public', 'employees') }} e  
  GROUP BY 
    e.gender,
    e.department,
    e.job_title,
    EXTRACT(YEAR FROM CURRENT_DATE()),
    EXTRACT(YEAR FROM DATE(e.date_birth)),
    EXTRACT(YEAR FROM DATE(e.hire_date)),
    EXTRACT(YEAR FROM DATE(e.termination_date)),
    e.status
)
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
ORDER BY age DESC