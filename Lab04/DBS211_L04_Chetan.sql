/* 
   Name = Chetan Arora
   Student ID = 100976240
   DBS211 – Lab 04
*/

SET AUTOCOMMIT ON;

-- 1: Create table the following tables and their given constraints:
Create TABLE L4_MOVIES (
mid INT PRIMARY KEY,
title VARCHAR(35) Not NULL,
releaseYear INT Not NULL,
director INT NOT NULL,
score DECIMAL(3,2) CHECK (score BETWEEN 0 AND 5)
);

CREATE TABLE L4_ACTORS (
aid Int PRIMARY KEY,
firstName varchar(20) NOT NULL,
lastName varchar(30) NOT NULL
);

CREATE TABLE L4_CASTINGS (
movieid Int,
actorid int,
PRIMARY KEY (movieid, actorid),
CONSTRAINT fk_movieid FOREIGN KEY (movieid) REFERENCES L5_MOVIES(mid),
CONSTRAINT fk_actorid FOREIGN KEY (actorid) REFERENCES L5_ACTORS(aid)
);

CREATE TABLE L4_DIRECTORS (
directorid Int PRIMARY KEY,
firstname varchar(20) NOT NULL,
lastname varchar(30) NOT NULL
);


-- 2: Modify the movies table to create a foreign key constraint that refers to table directors.
ALTER TABLE L4_movies
    ADD CONSTRAINT fk_director FOREIGN KEY (director) REFERENCES L5_directors;
    
 
-- 3: Modify the movies table to create a new constraint so the uniqueness of the movie title isguaranteed.
ALTER TABLE L4_movies
    ADD UNIQUE (title);
    

-- 4: Write insert statements to add the following data to table directors and movies.
INSERT ALL
INTO l4_directors VALUES (1010, 'Rob', 'Minkoff')
INTO l4_directors VALUES (1020, 'Bill', 'Condon')
INTO l4_directors VALUES (1050, 'Josh', 'Cooley')
INTO l4_directors VALUES (2010, 'Brad', 'Bird')
INTO l4_directors VALUES (3020, 'Lake', 'Bell')
SELECT * FROM dual;


INSERT ALL
INTO l4_movies VALUES (100, 'The Lion King', 2019, 3020, 3.50)
INTO l4_movies VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20)
INTO l4_movies VALUES (300, 'Toy Story 4', 2019, 1020, 4.50)
INTO l4_movies VALUES (400, 'Mission Impossible', 2018, 2010, 5.00)
INTO l4_movies VALUES (500, 'The Secret Life of Pets', 2016, 1010, 3.90)
SELECT * FROM dual;


-- 5: Write SQL statements to remove all above tables.Is the order of tables important when removing? Why?

/*
    The order is important, because of the parent-child realtionship between tables. Some of the tables are referenced to 
    some other tables and you cannot drop those tables if the referenced tables are not deleted first. So we can
    delete the referenced table first, or add Cascade Constraints at the end of the statements to make sure there are no errors.
*/
DROP TABLE l4_movies Cascade Constraints;
DROP TABLE l4_actors Cascade Constraints;
DROP TABLE l4_castings Cascade Constraints;
DROP TABLE l4_directors Cascade Constraints;


-- 6: Create a new empty table employee2 the same as table employees. Use a single statement tocreate the table and insert the data at the same time.
CREATE TABLE employee2 AS
SELECT *
    FROM employees;


-- 7: Modify table employee2 and add a new column username to this table.
--    The value of this columnis not required and does not have to be unique.
ALTER TABLE employee2
ADD username varchar(20) NULL;


-- 8: Delete all the data in the employee2 table.
DELETE FROM employee2;


-- 9: Re-insert all data from the employees table into your new table employee2 using a singlestatement.
INSERT INTO employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
SELECT employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle 
    FROM employees;

-- 10: In table employee2, write a SQL statement to change the first name and the last name ofemployee with ID 1002 to your name.
UPDATE employee2
SET lastname = 'Arora', firstname = 'Chetan'
WHERE employeenumber = 1002;


-- 11: In table employee2, generate the email address for column username for each student byconcatenating the first character of employee’s first name and the employee’s last name.
--     Forinstance, the username of employee Peter Stone will be pstone. NOTE: the username is in alllower case letters
UPDATE employee2
SET UserName = CONCAT(SUBSTR(firstname, 1, 1), lastname);


-- 12: In table employee2, remove all employees with office code 4.
DELETE FROM employee2 WHERE officecode = 4;


-- 13: Drop table employee2.
DROP TABLE employee2;