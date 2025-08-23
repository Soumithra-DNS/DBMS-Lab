/*1*/
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

/*a*/
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


/*b*/
SELECT employee_name
FROM employee
WHERE city = 'Rajshahi';


/*c*/
SELECT employee_name, street
FROM employee
WHERE city = 'Rajshahi';


/*d*/
/*i*/
SELECT employee_name
FROM works
WHERE company_name = 'Sonali';

/*ii*/
SELECT employee_name
FROM works
WHERE company_name = 'Agrani';

/*iii*/
SELECT employee_name
FROM works
WHERE company_name = 'Janata';


/*e*/
/*i*/
SELECT employee_name, salary
FROM works
WHERE company_name = 'Sonali';

/*ii*/
SELECT employee_name, salary
FROM works
WHERE company_name = 'Agrani';

/*iii*/
SELECT employee_name, salary
FROM works
WHERE company_name = 'Janata';


/*f*/
/*i*/
SELECT employee_name
FROM works
WHERE salary = 12000;

/*ii*/
SELECT employee_name
FROM works
WHERE salary >= 12000;

/*iii*/
SELECT employee_name
FROM works
WHERE salary < 12000;


/*g*/
/*i*/
SELECT employee_name, company_name
FROM works
WHERE salary = 12000;

/*ii*/
SELECT employee_name, company_name
FROM works
WHERE salary >= 12000;

/*iii*/
SELECT employee_name, company_name
FROM works
WHERE salary < 12000;


/*h*/
SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name and w.company_name = 'Agrani';


/*i*/
SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name and w.salary >= 10000;


/*j*/
SELECT w.employee_name, w.company_name, w.salary
FROM works w
JOIN employee e ON e.employee_name = w.employee_name and e.city = 'Rajshahi';

/*k*/
SELECT e.employee_name, e.street, e.city, w.company_name
FROM employee e
JOIN works w ON e.employee_name = w.employee_name and w.salary >= 10000;


/*l*/
SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name and w.salary > 12000 and w.company_name = 'Sonali';


/*m*/
SELECT employee_name
FROM works
WHERE company_name != 'Sonali';

/*n*/
update employee
set city = 'Nator'
WHERE employee_name = 'Arif';


SELECT * FROM employee;

/*o*/
UPDATE works
SET salary = salary * 1.10
WHERE company_name = 'Agrani';


/*p*/
DELETE FROM works
WHERE employee_name = 'Sagor';

DELETE FROM employee
WHERE employee_name = 'Sagor';


/*q*/
-- First create company table (if not already created)
CREATE TABLE company (
  company_name VARCHAR(20) PRIMARY KEY,
  city         VARCHAR(20)
);

-- Now add a new column 'manager'
ALTER TABLE company
ADD manager VARCHAR(20);

















