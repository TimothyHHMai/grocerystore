-- reviews
/*
CREATE TABLE `reviews` (
  `reviewNumber` int NOT NULL AUTO_INCREMENT,
  `employeeID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `comments` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reviewNumber`)
);
*/

-- review lists
CREATE VIEW review_list AS
SELECT * FROM reviews

-- insert review
DELIMITER //

CREATE PROCEDURE insert_review(
    IN p_employeeID INT,
    IN p_productID INT,
    IN p_rating INT,
    IN p_comments VARCHAR(50)
)
BEGIN
    INSERT INTO reviews (employeeID, productID, rating, comments)
    VALUES (p_employeeID, p_productID, p_rating, p_comments);
END//

DELIMITER ;

-- delete review

DELIMITER //

CREATE PROCEDURE delete_review(
    IN p_reviewNumber INT
)
BEGIN
    DELETE FROM reviews WHERE reviewNumber = p_reviewNumber;
END//

DELIMITER ;
