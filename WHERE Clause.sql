--- WHERE CLAUSE ---

#The WHERE clause is used to filter records (rows of data)
#It's going to extract only those records that fulfill a specified condition.
# So basically if we say "Where name is = 'Alex' - only rows were the name = 'Alex' will return
# So this is only effecting the rows, not the columns

SELECT *
FROM employee_salary;

SELECT *
FROM employee_salary
WHERE first_name = 'Leslie';

SELECT *
FROM employee_salary
WHERE salary > 5000;

SELECT *
FROM employee_salary
WHERE salary >= 5000;

SELECT *
FROM employee_salary
WHERE salary < 5000;

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_demographics
WHERE gender = 'Male';

SELECT *
FROM employee_demographics
WHERE gender != 'Male';

SELECT *
FROM employee_demographics
WHERE birth_date < '1985-01-01';

--- AND, OR, NOT are Logical Operators ---

SELECT *
FROM employee_demographics
WHERE birth_date < '1985-01-01'
AND gender = 'Male';

SELECT *
FROM employee_demographics
WHERE birth_date < '1985-01-01'
OR gender = 'Male';

SELECT *
FROM employee_demographics
WHERE birth_date < '1985-01-01'
OR NOT gender = 'Male';

--- LIKE Statement ---
--- Under LIKE statement we use --- '%' ( Means Anything) and '_' ( Means Specific value) ---

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'le%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%e%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';

SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1985%';

