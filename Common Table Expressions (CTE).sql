-- Using Common Table Expressions (CTE) ---
-- A CTE allows you to define a subquery block that can be referenced within the main query. 
-- It is particularly useful for recursive queries or queries that require referencing a higher level

-- The basics of writing a CTE:

-- First, CTEs start using a "With" Keyword. Now we get to name this CTE anything we want
-- Then we say as and within the parenthesis we build our subquery/table we want

WITH CTE_Example AS
(
SELECT gender, AVG(salary) Avg_sal, MAX(salary) Max_sal, MIN(salary) Min_sal, COUNT(salary) Count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
     ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(Avg_sal)
FROM CTE_Example
;


SELECT AVG(Avg_sal)
FROM (
SELECT gender, AVG(salary) Avg_sal, MAX(salary) Max_sal, MIN(salary) Min_sal, COUNT(salary) Count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
     ON dem.employee_id = sal.employee_id
GROUP BY gender
)Example_Subquery
;


WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
     ON CTE_Example.employee_id = CTE_Example2.employee_id
;


WITH CTE_Example (Gender, AVG_sal, MAX_sal, COUNT_sal, MIN_sal) AS
(
SELECT gender, AVG(salary) Avg_sal, MAX(salary) Max_sal, MIN(salary) Min_sal, COUNT(salary) Count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
     ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
;