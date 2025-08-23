/*----------------------------------------------------------
1. Consider the following database with these relations
   employee (employee_name, street, city)
   works (employee_name, company_name, salary)
----------------------------------------------------------*/

/* Create employee and works tables */
CREATE TABLE employee (
  employee_name VARCHAR(20) PRIMARY KEY,
  street        VARCHAR(30),
  city          VARCHAR(20)
);

CREATE TABLE works (
  employee_name VARCHAR(20),
  company_name  VARCHAR(20),
  salary        INT,
  PRIMARY KEY (employee_name),
  FOREIGN KEY (employee_name) REFERENCES employee(employee_name)
);


/*----------------------------------------------------------
 a) Insert the following data into employee and works
----------------------------------------------------------*/
INSERT INTO employee (employee_name, street, city) VALUES
  ('Arif',   '51 upashahar',   'Rajshahi'),
  ('Sumon',  '52 east',        'Moynamati'),
  ('Sagor',  'Neemgachhi',     'Sirajgong'),
  ('Abdul',  'Binodpur',       'Rajshahi'),
  ('Himesh', 'Nazrul avenue',  'Dhaka'),
  ('Amirul', 'Chawk bazar',    'Sylhet'),
  ('Sajib',  '99 north',       'Chittagong');

INSERT INTO works (employee_name, company_name, salary) VALUES
  ('Sumon',  'Agrani',  12000),
  ('Abdul',  'Sonali',  13000),
  ('Himesh', 'Agrani',   6000),
  ('Amirul', 'Sonali',  20000),
  ('Sagor',  'Sonali',   8000),
  ('Arif',   'Janata',  13000),
  ('Sajib',  'Janata',   9000);

-- View full tables
SELECT * FROM employee;
SELECT * FROM works;


/*----------------------------------------------------------
 b) Find the names of all employees who live in Rajshahi city
----------------------------------------------------------*/
SELECT employee_name
FROM employee
WHERE city = 'Rajshahi';


/*----------------------------------------------------------
 c) Find the names and street addresses of all employees 
    who live in Rajshahi city
----------------------------------------------------------*/
SELECT employee_name, street
FROM employee
WHERE city = 'Rajshahi';


/*----------------------------------------------------------
 d) Find the names of all employees who work for:
    i) Sonali   ii) Agrani   iii) Janata
----------------------------------------------------------*/
-- i) Sonali
SELECT employee_name
FROM works
WHERE company_name = 'Sonali';

-- ii) Agrani
SELECT employee_name
FROM works
WHERE company_name = 'Agrani';

-- iii) Janata
SELECT employee_name
FROM works
WHERE company_name = 'Janata';


/*----------------------------------------------------------
 e) Find the names and salary of all employees who work for:
    i) Sonali   ii) Agrani   iii) Janata
----------------------------------------------------------*/
-- i) Sonali
SELECT employee_name, salary
FROM works
WHERE company_name = 'Sonali';

-- ii) Agrani
SELECT employee_name, salary
FROM works
WHERE company_name = 'Agrani';

-- iii) Janata
SELECT employee_name, salary
FROM works
WHERE company_name = 'Janata';


/*----------------------------------------------------------
 f) Find the names of all employees whose salary is:
    i) 12000   ii) >=12000   iii) <12000
----------------------------------------------------------*/
-- i) Salary = 12000
SELECT employee_name
FROM works
WHERE salary = 12000;

-- ii) Salary >= 12000
SELECT employee_name
FROM works
WHERE salary >= 12000;

-- iii) Salary < 12000
SELECT employee_name
FROM works
WHERE salary < 12000;


/*----------------------------------------------------------
 g) Find the names and company of all employees whose salary is:
    i) 12000   ii) >=12000   iii) <12000
----------------------------------------------------------*/
-- i) Salary = 12000
SELECT employee_name, company_name
FROM works
WHERE salary = 12000;

-- ii) Salary >= 12000
SELECT employee_name, company_name
FROM works
WHERE salary >= 12000;

-- iii) Salary < 12000
SELECT employee_name, company_name
FROM works
WHERE salary < 12000;


/*----------------------------------------------------------
 h) Find the names, streets and cities of all employees 
    who work for Agrani
----------------------------------------------------------*/
SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Agrani';


/*----------------------------------------------------------
 i) Find the names, streets and cities of all employees 
    who earn >= 10000
----------------------------------------------------------*/
SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.salary >= 10000;


/*----------------------------------------------------------
 j) Find the names, company and salary of all employees 
    who live in Rajshahi city
----------------------------------------------------------*/
SELECT w.employee_name, w.company_name, w.salary
FROM works w
JOIN employee e ON e.employee_name = w.employee_name
WHERE e.city = 'Rajshahi';


/*----------------------------------------------------------
 k) Find the names, streets, cities and companies 
    of all employees who earn >=10000
----------------------------------------------------------*/
SELECT e.employee_name, e.street, e.city, w.company_name
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.salary >= 10000;


/*----------------------------------------------------------
 l) Find the names, streets and cities of all employees 
    who work for Sonali and earn more than 12000
----------------------------------------------------------*/
SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.salary > 12000 AND w.company_name = 'Sonali';


/*----------------------------------------------------------
 m) Find all employees in the database who do not work for Sonali
----------------------------------------------------------*/
SELECT employee_name
FROM works
WHERE company_name != 'Sonali';


/*----------------------------------------------------------
 n) Modify the database so that “Arif” now lives in Natore
----------------------------------------------------------*/
UPDATE employee
SET city = 'Natore'
WHERE employee_name = 'Arif';

SELECT * FROM employee;


/*----------------------------------------------------------
 o) Give all employees of “Agrani” Bank 10 percent salary raise
----------------------------------------------------------*/
UPDATE works
SET salary = salary * 1.10
WHERE company_name = 'Agrani';


/*----------------------------------------------------------
 p) Delete all records for Sagor in employee and works tables
----------------------------------------------------------*/
DELETE FROM works
WHERE employee_name = 'Sagor';

DELETE FROM employee
WHERE employee_name = 'Sagor';


/*----------------------------------------------------------
 q) Add a column 'manager' in the company table
----------------------------------------------------------*/
-- Create company table if not exists
CREATE TABLE company (
  company_name VARCHAR(20) PRIMARY KEY,
  city         VARCHAR(20)
);

-- Add manager column
ALTER TABLE company
ADD manager VARCHAR(20);
