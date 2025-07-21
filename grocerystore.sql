/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`grocerystore` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `grocerystore`;

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

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

/*Data for the table `customers` */
INSERT INTO `customers`(`firstName`, `lastName`, `email_address`, `phone`, `payment_information`, `addressLine`) values 
('Lila', 'Ramani', 'crumbVoc@gmail.com', '8561234321', NULL, '123, This Street'),
('Taylor', 'Swift', 'swifty890@gmail.com', '2679094444', 'Credit', '442, There Street'),
('Willow', 'Smith', 'altSimth@gmail.com', '2679084664', NULL, '23, There Street'),
('Lana', 'Ray', 'lanadelRay@yahoo.com', '2679084994', 'Credit', '23, Down Street'),
('Vic', 'Fuentes', 'ptvsing@gmail.com', '8561335321', NULL, '443, Up Street');

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

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

/*Data for the table `employees` */
INSERT INTO `employees`(`firstName`, `lastName`, `email_address`, `phone`, `addressLine`, `role`) values 
('Na', 'Yaeon', 'Twice@outlook.com', '2011234321', '123, South Street', 'cashier'),
('Lady', 'Gaga', 'telephone@gmail.com', '2679093333', '001, Queen Street', 'manager'),
('Christian', 'Yu', 'dprIan@gmail.com', '2679084664', '67, Hot Street', 'cashier'),
('Avril', 'Lavigne', 'soComplicated@yahoo.com', '2125084994', '23, Second Street', 'cashier'),
('Jesse', 'Rutherford', 'neighborhoodVoc@outlook.com', '8561335321', '58, Indie Street', 'cashier');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(70) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `quantityInStock` smallint(6) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`productID`)
);

/*Data for the table `products` */
INSERT INTO `products`(`productName`, `productVendor`, `quantityInStock`, `productPrice`) VALUES 
('oat milk', 'Planet Oat', 67, 3.99),
('egg', 'Wellsley Farms', 202, 4.06),
('apple', 'Gala', 102, 0.73),
('bread', 'Wonder Bread', 122, 5.99),
('diet coke', 'Coca-Cola', 28, 13.18);


/*Table structure for table `reviews` */

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `reviewNumber` int NOT NULL AUTO_INCREMENT,
  `employeeID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `comments` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reviewNumber`)
);
-- rating is out of 10
/*Data for the table `reviews` */
INSERT INTO `reviews`(`employeeID`, `productID`, `rating`, `comments`) VALUES 
(NULL, 2, 1, 'Stale. I would give them a zero if i could'),
(3, NULL, 10, 'Looked at me'),
(4, NULL, 10, 'Assisted me into finding the best priced items'),
(NULL, 1, 5, 'Sour'),
(NULL, 5, 8, 'Tastes exactly the same as non-diet!'),
(4, NULL, 8, NULL);

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `saleNumber` int NOT NULL AUTO_INCREMENT,
  `employeeID` int(11) NOT NULL,
  `sale_Date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`saleNumber`)
);

/*Data for the table `sales` */
INSERT INTO `sales`(`employeeID`, `sale_date`, `amount`) VALUES 
('3', '2024-02-21', 142.42),
('1', '2024-03-21', 23.01),
('2', '2024-03-26', 302.51),
('1', '2024-04-02', 256.67),
('4', '2024-04-13', 13.41);

DROP TABLE IF EXISTS `vendors`;

CREATE TABLE `vendors` (
  `vendorID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vendorID`)
);

/*Data for the table `vendors` */
INSERT INTO `vendors`(`name`, `address`) VALUES 
('Planet Oat', '12, Oat Street'),
('Wellsley Farms', '02, Nowhere Street'),
('Gala', '07, Farm Street'),
('Wonder Bread', '38, Somwhere Street'),
('Coca-Cola', '12, Somewhere Street');
