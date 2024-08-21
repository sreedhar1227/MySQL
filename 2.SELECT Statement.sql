-- SELECT STATEMENET

-- the SELECT statement is used to work with columns and specify what columns you want to work see in your output. There are a few other things as well that
-- we will discuss throughout this video

#We can also select a specefic number of column based on our requirement. 

SELECT *
FROM employee_demographics;

SELECT first_name, last_name, age
FROM employee_demographics;

SELECT first_name, age + 10
FROM employee_demographics;

SELECT last_name, (age + 10) * 10
FROM employee_demographics;

SELECT DISTINCT gender
FROM employee_demographics;

SELECT distinct first_name, gender
FROM parks_and_recreation.employee_demographics;