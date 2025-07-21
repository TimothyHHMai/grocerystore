-- products
/*
CREATE TABLE `products` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(70) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `quantityInStock` smallint(6) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`productID`)
);
*/

-- View Products --
CREATE VIEW products_list AS
SELECT	* 
FROM products;

DELIMITER //

-- Insert Products
CREATE PROCEDURE insert_product(
    IN productName VARCHAR(50),
    IN productVendor VARCHAR(50),
    IN quantityInStock smallint(6),
    IN productPrice decimal(10,2)
)
BEGIN
    INSERT INTO `products`(`productName`, `productVendor`, `quantityInStock`, `productPrice`)
    VALUES (productName, productVendor, quantityInStock, productPrice);
END //

DELIMITER ;

-- Remove Product
DELIMITER //

CREATE PROCEDURE remove_product(
    IN productID INT
)
BEGIN
    DELETE FROM `products` WHERE `productID` = productID;
END //

DELIMITER ;

-- Update product price

DELIMITER //

CREATE PROCEDURE update_productPrice(
    IN p_productID INT,
    IN p_newPrice decimal(10,2)
)
BEGIN
    UPDATE `customers`
    SET `productPrice` = p_newPrice
    WHERE `productID` = p_productID;
END //

DELIMITER ;

-- update product quantity
DELIMITER //
CREATE PROCEDURE update_productQuantity(
    IN p_productID INT,
    IN p_newQuantity smallint(6)
)
BEGIN
    UPDATE `customers`
    SET `quantityInStock` = p_newQuantity
    WHERE `productID` = p_productID;
END //

DELIMITER ;

DELIMITER //


-- Check which products are less than 50
CREATE VIEW lowProducts AS
SELECT * FROM products
WHERE quantityInStock < 50;

-- add/subtract product
DELIMITER //
    
    CREATE PROCEDURE `addFromStock`(
    IN p_productID INT,
    IN p_quantityToAdd INT
)
BEGIN
    DECLARE currentStock INT;

    SELECT `quantityInStock` INTO currentStock
    FROM `products`
    WHERE `productID` = p_productID;

    IF currentStock IS NOT NULL AND currentStock >= p_quantityToAdd THEN
        UPDATE `products`
        SET `quantityInStock` = currentStock + p_quantityToAdd
        WHERE `productID` = p_productID;
        
		SELECT CONCAT('Successfully added ', p_quantityToAdd, ' from stock for productID ', p_productID) AS message;

    ELSE
        SELECT 'Error: Product not found or insufficient stock' AS message;
    END IF;
END //
