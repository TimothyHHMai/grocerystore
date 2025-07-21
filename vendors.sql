-- vendors
/*
CREATE TABLE `vendors` (
  `vendorID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vendorID`)
);
*/
-- view vendors
CREATE VIEW vendors_list AS
SELECT * FROM vendors

-- insert vendors
DELIMITER //

CREATE PROCEDURE insert_vendor(
    IN p_name VARCHAR(50),
    IN p_address VARCHAR(50)
)
BEGIN
    INSERT INTO vendors (name, address)
    VALUES (p_name, p_address);
END//

DELIMITER ;

-- delete vendors
DELIMITER //

CREATE PROCEDURE delete_vendor(
    IN p_vendorID INT
)
BEGIN
    DELETE FROM vendors WHERE vendorID = p_vendorID;
END//

DELIMITER ;
