-- customer
/*
CREATE TABLE `customers` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `payment_information` varchar(50) DEFAULT NULL,
  `addressLine` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customerID`)
);
*/

-- View Customers
CREATE VIEW customer_list AS
SELECT	* 
FROM customers;

DELIMITER //
-- Insert Customers
CREATE PROCEDURE insert_customer(
    IN firstName VARCHAR(50),
    IN lastName VARCHAR(50),
    IN email_address VARCHAR(50),
    IN phone VARCHAR(50),
    IN payment_information VARCHAR(50),
    IN addressLine VARCHAR(50)
)
BEGIN
    INSERT INTO `customers` (`firstName`, `lastName`, `email_address`, `phone`, `payment_information`, `addressLine`)
    VALUES (firstName, lastName, email_address, phone, payment_information, addressLine);
END //

DELIMITER ;

-- View Customers
SELECT	* 
FROM customers;

-- Remove Customers
DELIMITER //

CREATE PROCEDURE remove_customer(
    IN customerID INT
)
BEGIN
    DELETE FROM `customers` WHERE `customerID` = customerID;
END //

DELIMITER ;

-- Update customer email
DELIMITER //

CREATE PROCEDURE update_customer_email(
    IN p_customerID INT,
    IN p_newEmail VARCHAR(50)
)
BEGIN
    UPDATE `customers`
    SET `email_address` = p_newEmail
    WHERE `customerID` = p_customerID;
END //

DELIMITER ;

-- update customer payment information
DELIMITER //

CREATE PROCEDURE update_customer_payment(
    IN p_customerID INT,
    IN p_newPayment VARCHAR(50)
)
BEGIN
    UPDATE `customers`
    SET `email_address` = p_newPayment
    WHERE `customerID` = p_customerID;
END //

DELIMITER ;

-- update customer name
DELIMITER //

CREATE PROCEDURE update_customer_name(
    IN p_customerID INT,
    IN p_newFirst VARCHAR(50),
    IN p_newLast VARCHAR(50)
)
BEGIN
    UPDATE `customers`
    SET `first_name` = p_newFirst,
		`last_name` = p_newLast
    WHERE `customerID` = p_customerID;
END //

DELIMITER ;