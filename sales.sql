-- sales
/*
CREATE TABLE `sales` (
  `saleNumber` int NOT NULL AUTO_INCREMENT,
  `employeeID` int(11) NOT NULL,
  `sale_Date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`saleNumber`)
);
*/
-- view sale
CREATE VIEW sales_list AS
SELECT * FROM sales

-- insert sale
DELIMITER //

CREATE PROCEDURE insert_sale(
    IN p_employeeID INT,
    IN p_sale_Date DATE,
    IN p_amount DECIMAL(10,2)
)
BEGIN
    INSERT INTO sales (employeeID, sale_Date, amount)
    VALUES (p_employeeID, p_sale_Date, p_amount);
END//

DELIMITER ;

-- delete sale
DELIMITER //

CREATE PROCEDURE delete_sale(
    IN p_saleNumber INT
)
BEGIN
    DELETE FROM sales WHERE saleNumber = p_saleNumber;
END//

DELIMITER ;
