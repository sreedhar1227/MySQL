--- Limit & Aliasing ---

-- Limit is just going to specify how many rows you want in the output

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_demographics
Limit 3;

SELECT *
FROM employee_demographics
ORDER BY age DESC
Limit 3;

SELECT *
FROM employee_demographics
ORDER BY age DESC
Limit 2, 1;

--- Aliasing (change the name of a column) ---

-- aliasing is just a way to change the name of the column (for the most part)
-- it can also be used in joins, but we will look at that in the intermediate series

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;

SELECT gender, AVG(age) avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;
