-- WINDOW FUNCTIONS ---

-- windows functions are really powerful and are somewhat like a group by - except they don't roll everything up into 1 row when grouping. 
-- windows functions allow us to look at a partition or a group, but they each keep their own unique rows in the output
-- we will also look at things like Row Numbers, rank, and dense rank

SELECT *
FROM employee_demographics;

SELECT gender, AVG (salary) AS Avg_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
     ON dem.employee_id = sal.employee_id
GROUP BY gender;

SELECT gender, AVG (salary) OVER()
FROM employee_demographics AS dem
JOIN employee_salary AS sal
     ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name, dem.last_name, salary, gender, AVG (salary) OVER()
FROM employee_demographics AS dem
JOIN employee_salary AS sal
     ON dem.employee_id = sal.employee_id
;

-- if we use partition it's kind of like the group by except it doesn't roll up - it just partitions or breaks based on a column when doing the calculation

SELECT dem.first_name, dem.last_name, gender, salary, AVG (salary) OVER(PARTITION BY gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
     ON dem.employee_id = sal.employee_id
;

-- now if we wanted to see what the salaries were for genders we could do that by using sum, but also we could use order by to get a rolling total

SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics AS dem
JOIN employee_salary AS sal
     ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM employee_demographics AS dem
JOIN employee_salary AS sal
     ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
     ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
     ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_Num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Rank_Num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS DenseRank_Num
FROM employee_demographics AS dem
JOIN employee_salary AS sal
     ON dem.employee_id = sal.employee_id
;