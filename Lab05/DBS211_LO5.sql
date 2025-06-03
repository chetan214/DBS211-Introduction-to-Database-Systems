/*

    DBS211 - Lab 5
    Name - Chetan Arora
    Student ID - 100976240
    Date - 10 June 2024
  */

--Ans 1
--a By using ANSI-89 Join:

SELECT 
    employees.employeeNumber,
    employees.firstName,
    employees.lastName,
    offices.city,
    offices.phone,
    offices.postalCode
FROM employees, offices
WHERE employees.officeCode = offices.officecode
AND offices.country = 'France';

--b By using ANSI-92 Join:

SELECT 
    employees.employeeNumber,
    employees.firstName,
    employees.lastName,
    offices.city,
    offices.phone,
    offices.postalCode
FROM employees JOIN offices
   ON employees.officeCode = offices.officeCode
WHERE offices.country = 'France';



--Ans 2
SELECT 
    customers.customerNumber,
    customers.customerName,
    payments.paymentDate,
    payments.amount
FROM customers JOIN payments
    ON customers.customerNumber = payments.customerNumber
WHERE customers.country = 'Canada'
ORDER BY customers.customerNumber, payments.paymentDate;



--Ans 3
SELECT
    customers.customernumber,
    customers.customerName
FROM customers LEFT JOIN payments
    ON customers.customerNumber = payments.customerNumber
WHERE customers.country = 'USA' AND payments.customerNumber IS NULL
ORDER BY customers.customerNumber;



--Ans 4

--a
CREATE VIEW vwCustomerOrder AS
SELECT 
    c.customerNumber,
    o.orderNumber,
    o.orderDate,
    p.productName,
    oD.quantityOrdered,
    oD.priceEach
FROM
    customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderDetails oD ON o.orderNumber = oD.orderNumber
    JOIN products p ON oD.productCode = p.productCode;

--b
SELECT *
FROM vwCustomerOrder;


--Ans 5
SELECT * 
FROM vwCustomerOrder
WHERE customerNumber = 124
ORDER BY orderNumber, 
(SELECT orderLineNumber 
    FROM orderdetails 
    WHERE orderNumber = vwCustomerOrder.orderNumber 
    AND productCode = (SELECT productCode 
    FROM products 
    WHERE productName = vwCustomerOrder.productName
    )
);



--Ans 6

SELECT
    customers.customerNumber,
    customers.contactfirstName,
    customers.contactlastName,
    customers.phone,
    customers.creditLimit
FROM
    customers
    LEFT JOIN orders ON customers.customerNumber = orders.customerNumber
WHERE
    orders.orderNumber IS NULL;




--Ans 7
CREATE VIEW vwEmployeeManager AS
SELECT 
    e.employeeNumber,
    e.firstName,
    e.lastName,
    e.email,
    e.jobTitle,
    e.officeCode,
    e.reportsTo AS managerEmployeeNumber,
    m.firstName AS managerFirstName,
    m.lastName AS managerLastName
FROM
    employees e
    LEFT JOIN employees m ON e.reportsTo = m.employeeNumber;




--Ans 8
CREATE OR REPLACE VIEW vwEmployeeManager AS
SELECT
    e.employeeNumber,
    e.firstName,
    e.lastName,
    e.email,
    e.jobTitle,
    e.officeCode,
    e.reportsTo AS managerEmployeeNumber,
    m.firstName AS managerFirstName,
    m.lastName AS managerLastName
FROM
    employees e
JOIN employees m ON e.reportsTo = m.employeeNumber
WHERE
    e.reportsTo IS NOT NULL;



--Ans 9
DROP VIEW vwCustomerOrder;
DROP VIEW vwEmployeeManager;

