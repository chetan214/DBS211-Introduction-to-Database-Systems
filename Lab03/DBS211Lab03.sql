/*Name:- Chetan Arora
Student Id:- 100976240
Oracle User Id:-dbs211_242zaa05
Email:-carora18@myseneca.ca
*/
SET AUTOCOMMIT ON;

--Ans 1
SELECT* FROM offices;

--Ans 2
SELECT employeeNumber FROM employees WHERE  officeCode = 1;

--Ans 3
SELECT
     customerNumber,
     customerName,
     contactFirstName,
     contactLastName,
     phone
FROM customers 
WHERE UPPER(city) = 'PARIS'; 

--Ans 4
SELECT
     customerNumber,
     customerName,
     contactLastName || ' ' || contactFirstName AS contactFullName,
     phone
FROM customers 
WHERE UPPER(country) = 'CANADA'; 

--Ans 5
SELECT DISTINCT
    customerNumber 
FROM
    payments;
    
--Ans 6
SELECT
    customerNumber,
    checkNumber,
    amount 
FROM payments 
WHERE amount < 30000 OR amount > 65000
ORDER BY amount DESC;

--Ans 7
SELECT* FROM orders 
WHERE UPPER(status)='CANCELLED';

--Ans 8
SELECT 
    productCode,
    productName,
    buyPrice,
    MSRP,
    MSRP - buyPrice AS markup,
    ROUND((100 * (MSRP - buyPrice) / buyPrice), 1) AS percMarkup
FROM products;

-- ANS 9

SELECT* FROM products
WHERE UPPER(productName) LIKE '%CO%';

-- Ans 10

SELECT* FROM customers 
WHERE
    UPPER(contactFirstName) LIKE 'S%' AND 
    UPPER(contactFirstName) LIKE '%E%';


-- Ans 11

INSERT INTO employees(
    employeeNumber,
    firstName,
    lastName,
    extension,
    email,
    jobTitle,
    officeCode,
    reportsTo)
    VALUES(
    1600,
    'Chetan',
    'Arora',
    'x4900',
    'carora18@myseneca.ca',
    'Cashier',
    4,
    1088
    );

-- Ans 12

SELECT*
FROM
   employees
WHERE
    employeeNumber = 1600;

-- Ans 13

UPDATE employees SET 
  jobTitle = 'Head Cashier'
WHERE employeenumber = 1600;

-- Ans 14

INSERT INTO employees(
    employeeNumber,
    firstName,
    lastName,
    extension,
    email,
    jobTitle,
    officeCode,
    reportsTo)
    VALUES(
    1607,
    'Jaspinder',
    'Gill',
    'x2200',
    'jaspindergill@gmail.com',
    'Cashier',
    5,
    1600
    );

-- Ans 15

DELETE FROM employees 
WHERE employeenumber = 1600;

/* No this is not working, becuase in this case the child record is found, it means we do not delete the parent statement from the database if the child statment is present in it.*/

-- Ans 16

DELETE FROM employees 
WHERE employeenumber = 1607;

-- Yes, its work.

-- Ans 17

INSERT ALL
    INTO employees VALUES
        (
            1600,
           'Singh',
           'Gurkirat',
           'x2500',
           'gurkiratsingh@gmail.com',
            4,
            1088,
           'Cashier'
        )
    INTO employees VALUES
       (
            1607,
           'Pandit',
           'Sandeep',
           'x2200',
           'sandeeppandit@gmail.com',
            6,
            1088,
           'Cashier'
        )
SELECT * FROM dual;

-- Ans 18

DELETE FROM employees
WHERE employeenumber IN (1600, 1607);

