--- Stored Procedure ---

SELECT *
FROM employee_salary
WHERE salary >= 50000;


CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();


DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
      SELECT *
	  FROM employee_salary
      WHERE salary >= 50000;
      SELECT *
	  FROM employee_salary
	  WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries2();




DELIMITER $$
CREATE PROCEDURE large_salaries90(employee_id_param INT)
BEGIN
	SELECT salary
	FROM employee_salary
	WHERE salary >= 60000
    AND employee_id_param = employee_id;
END $$

DELIMITER ;

CALL large_salaries90(1);