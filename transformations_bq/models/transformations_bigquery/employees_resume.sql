{{ config(materialized='table') }}

WITH employees_resume AS (
  SELECT
    e.gender,
    e.department,
    e.job_title,
    e.total_salary,
    e.current_year,
    e.birth_year,
    e.hired_year,
    e.termination_year,
    e.status,
    e.employees
  FROM {{ source('employees', 'employees_resume') }} e )
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