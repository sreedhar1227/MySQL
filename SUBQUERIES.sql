--- SUBQUERIES ---
#So subqueries are queries within queries.
# now if we try to have more than 1 column in the subquery we get an error saying the operand should contain 1 column only 

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_demographics
WHERE employee_id IN 
                   (SELECT employee_id
                   FROM employee_salary
                   WHERE dept_id = 1)
;

SELECT first_name, salary,
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary;

SELECT gender, AVG(Min_age)
FROM (SELECT gender, MIN(age) AS Min_age, 
MAX(age) AS Max_age,
COUNT(age) AS Count_age, 
AVG(age) AS Avg_age
FROM employee_demographics
GROUP BY gender) AS agg_tabel
GROUP BY gender;

SELECT AVG(Max_age)
FROM (SELECT gender,
 MIN(age) AS Min_age, 
MAX(age) AS Max_age,
COUNT(age) AS Count_age, 
AVG(age) AS Avg_age
FROM employee_demographics
GROUP BY gender) AS agg_tabel;
                   