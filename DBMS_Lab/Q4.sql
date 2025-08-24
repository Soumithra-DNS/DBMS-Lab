/*a) Create tables and insert given data */

CREATE TABLE employee (
  employee_name VARCHAR(100) PRIMARY KEY,
  street VARCHAR(100),
  city VARCHAR(100)
);

CREATE TABLE company (
  company_name VARCHAR(100) PRIMARY KEY,
  city VARCHAR(100)
);

CREATE TABLE works (
  employee_name VARCHAR(100),
  company_name VARCHAR(100),
  salary INT,
  PRIMARY KEY (employee_name, company_name),
  FOREIGN KEY (employee_name) REFERENCES employee(employee_name),
  FOREIGN KEY (company_name) REFERENCES company(company_name)
);

CREATE TABLE manages (
  employee_name VARCHAR(100) PRIMARY KEY,
  manager_name VARCHAR(100),
  FOREIGN KEY (employee_name) REFERENCES employee(employee_name),
  FOREIGN KEY (manager_name) REFERENCES employee(employee_name)
);

-- Insert employees
INSERT INTO employee VALUES
('Arif', '51 Upashahar', 'Rajshahi'),
('Sumon', '52 East', 'Moynamati'),
('Sagor', 'Neemgachhi', 'Sirajgong'),
('Abdul', 'Binodpur', 'Rajshahi'),
('Himesh', 'Nazrul Avenue', 'Dhaka'),
('Amirul', 'Chawk Bazar', 'Sylhet'),
('Sajib', '99 North', 'Chittagong');

-- Insert companies
INSERT INTO company VALUES
('Agrani', 'Rajshahi'),
('Sonali', 'Sylhet'),
('Janata', 'Dhaka');

-- Insert works
INSERT INTO works VALUES
('Sumon', 'Agrani', 12000),
('Abdul', 'Sonali', 13000),
('Himesh', 'Agrani', 6000),
('Amirul', 'Sonali', 20000),
('Sagor', 'Sonali', 8000),
('Arif', 'Janata', 13000),
('Sajib', 'Janata', 9000);

-- Insert manages
INSERT INTO manages VALUES
('Amirul', 'Amirul'),
('Abdul', 'Amirul'),
('Sagor', 'Amirul'),
('Sumon', 'Sumon'),
('Himesh', 'Sumon'),
('Arif', 'Arif'),
('Sajib', 'Arif');


/*b) Find the names of all employees who work for "Sonali". */
SELECT employee_name
FROM works
WHERE company_name = 'Sonali';


/*c) Find names, streets, and cities of employees who work for "Agrani". */
SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Agrani';


/*d) Find names, streets, and cities of employees who work for "Sonali" 
    and earn more than 1,20,000 per annum. 
    (Monthly salary > 10000 means annual salary > 120000) */
SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Sonali'
  AND w.salary > 10000;


/*e) Find employees who live in the same city as the companies they work for. */
SELECT e.employee_name
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
JOIN company c ON w.company_name = c.company_name
WHERE e.city = c.city;


/*f) Find employees who live in the same city and street as their managers. */
SELECT e.employee_name
FROM employee e
JOIN manages mg ON e.employee_name = mg.employee_name
JOIN employee m ON mg.manager_name = m.employee_name
WHERE e.city = m.city
  AND e.street = m.street;


/*g) Find employees who do not work for "Sonali". */
SELECT e.employee_name
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name != 'Sonali';


/*h) Find all employees who earn more than each employee of "Janata" bank */
SELECT e.employee_name, w.salary
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.salary > ALL (
    SELECT w2.salary
    FROM works w2
    WHERE w2.company_name = 'Janata'
);


/* i) Find all employees who earn more than the average salary of their company */
SELECT e.employee_name, w.company_name, w.salary
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.salary > (
    SELECT AVG(w2.salary)
    FROM works w2
    WHERE w2.company_name = w.company_name
);


/* j) Find the company that has the most employees */
SELECT w.company_name
FROM works w
GROUP BY w.company_name
ORDER BY COUNT(w.employee_name) DESC
LIMIT 1;





