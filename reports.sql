-- reports

-- employee ratings
CREATE VIEW employee_ratings AS 
SELECT 
    e.employeeID, 
    e.firstName, 
    e.lastName,
    IF(COUNT(r.reviewNumber) = 0, 'No reviews available', 
        CAST(COALESCE(AVG(r.rating), 0) AS DECIMAL(5, 2))
    ) AS avgRating
FROM 
    employees e
LEFT JOIN 
    reviews r ON e.employeeID = r.employeeID
GROUP BY 
    e.employeeID
ORDER BY 
    avgRating DESC;

-- product ratings
CREATE VIEW product_ratings AS
SELECT 
    p.productID, 
    p.productName, 
    IF(COUNT(r.reviewNumber) = 0, 'No reviews available', 
        CAST(COALESCE(AVG(r.rating), 0) AS DECIMAL(5, 2))
    ) AS avgRating
FROM 
    products p
LEFT JOIN 
    reviews r ON p.productID = r.productID
GROUP BY 
    p.productID
ORDER BY 
    avgRating DESC;

DELIMITER //

--  gets employee reviews
CREATE PROCEDURE getEmployeeReviews (
	IN p_employeeID INT
)
BEGIN
    SELECT
        r.reviewNumber,
        r.employeeID,
        CONCAT(e.firstName, ' ', e.lastName) AS employeeName,
        r.productID,
        r.rating,
        r.comments
    FROM
        reviews r
    JOIN
        employees e ON r.employeeID = e.employeeID
    WHERE
        e.employeeID = p_employeeID;
END//

DELIMITER ;

-- employee ratings/total sales
CREATE VIEW employee_report AS
SELECT 
    e.employeeID,
    CONCAT(e.firstName, ' ', e.lastName) AS employeeName,
    IF(COUNT(r.reviewNumber) = 0, 'No reviews available', 
        CAST(COALESCE(AVG(r.rating), 0) AS DECIMAL(5, 2))
    ) AS avgRating,
    COALESCE(es.totalSales, 0) AS totalSales
FROM 
    employees e
LEFT JOIN 
    reviews r ON e.employeeID = r.employeeID
LEFT JOIN 
    (
        SELECT 
            e.employeeID,
            SUM(s.amount) AS totalSales
        FROM 
            sales s
        JOIN 
            employees e ON s.employeeID = e.employeeID
        GROUP BY 
            e.employeeID
    ) es ON e.employeeID = es.employeeID
GROUP BY 
    e.employeeID
ORDER BY 
    avgRating DESC;
    
    -- Sum of sales for each employee

CREATE VIEW employee_sales AS
SELECT
    e.employeeID,
    CONCAT(e.firstName, ' ', e.lastName) AS employeeName,
    SUM(s.amount) AS totalSales
FROM
    sales s
    JOIN employees e ON s.employeeID = e.employeeID
GROUP BY
    e.employeeID
ORDER BY
    totalSales DESC;

-- sum of all sales

CREATE VIEW total_sales AS
SELECT
    SUM(amount) AS totalAmount
FROM
    sales
WHERE
    sale_Date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);
