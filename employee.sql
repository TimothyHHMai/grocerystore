-- employee
/*
CREATE TABLE `employees` (
  `employeeID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeID`)
);
*/

-- view employees
CREATE VIEW employee_list AS
SELECT * FROM employees

-- insert employees
DELIMITER //

CREATE PROCEDURE insert_employee(
    IN p_firstName VARCHAR(50),
    IN p_lastName VARCHAR(50),
    IN p_email_address VARCHAR(50),
    IN p_phone VARCHAR(50),
    IN p_addressLine VARCHAR(50),
    IN p_role VARCHAR(50)
)
BEGIN
    INSERT INTO employees (firstName, lastName, email_address, phone, addressLine, role)
    VALUES (p_firstName, p_lastName, p_email_address, p_phone, p_addressLine, p_role);
END//

DELIMITER ;

-- delete employee
DELIMITER //

CREATE PROCEDURE delete_employee(
    IN p_employeeID INT
)
BEGIN
    DELETE FROM employees WHERE employeeID = p_employeeID;
END//

DELIMITER ;

-- update employee name
DELIMITER //

CREATE PROCEDURE update_employee_name(
    IN p_employeeID INT,
    IN p_newFirst VARCHAR(50),
    IN p_newLast VARCHAR(50)
)
BEGIN
    UPDATE `customers`
    SET `first_name` = p_newFirst,
		`last_name` = p_newLast
    WHERE `employeeID` = p_employeeID;
END //

DELIMITER ;