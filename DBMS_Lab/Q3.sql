/*1. Insurance Database*/

/* Create tables */
CREATE TABLE person (
  nid INT PRIMARY KEY,
  name VARCHAR(100),
  address VARCHAR(100)
);

CREATE TABLE car (
  license VARCHAR(10) PRIMARY KEY,
  year INT,
  model VARCHAR(100)
);

CREATE TABLE accident (
  date_ DATE,
  driver VARCHAR(100),
  damage_amount INT,
  PRIMARY KEY(date_, driver)
);

CREATE TABLE owns (
  nid INT,
  license VARCHAR(10),
  PRIMARY KEY (nid, license),
  FOREIGN KEY (nid) REFERENCES person(nid),
  FOREIGN KEY (license) REFERENCES car(license)
);

CREATE TABLE log (
  license VARCHAR(10),
  date_ DATE,
  driver VARCHAR(100),
  PRIMARY KEY (license, date_, driver),
  FOREIGN KEY (license) REFERENCES car(license)
);

/* a) Insert the given data into person, car, accident, owns, and log tables */
INSERT INTO person VALUES
(123451, 'Arif', 'Rajshahi'),
(123452, 'Sumon', 'Moynamati'),
(123453, 'Sagor', 'Sirajgang'),
(123454, 'Abdul', 'Rajshahi'),
(123455, 'Himesh', 'Dhaka'),
(123456, 'Amirul', 'Sylhet'),
(123457, 'Sajib', 'Chittagang'),
(999001, 'Komol', 'Unknown'),
(999002, 'Bahadur', 'Unknown'),
(999003, 'Akter', 'Unknown');

INSERT INTO car VALUES
('12-3000', 2012, 'Axio'),
('11-3000', 2008, 'Corolla'),
('12-4000', 2013, 'Axio'),
('12-5000', 2013, 'Premio'),
('11-5000', 2010, 'Nano'),
('11-6000', 2011, 'Alto'),
('12-6000', 2015, 'Nano Twist');

INSERT INTO owns VALUES
(123451, '11-3000'),
(123452, '12-4000'),
(123453, '12-5000'),
(123454, '11-5000'),
(123455, '11-6000'),
(123456, '12-6000'),
(123457, '12-3000');

INSERT INTO accident VALUES
('2013-01-12', 'Arif', 10000),
('2015-09-25', 'Komol', 12000),
('2014-06-20', 'Bahadur', 11000),
('2011-12-20', 'Abdul', 8000),
('2015-09-19', 'Akter', 7000),
('2013-05-15', 'Arif', 20000),
('2014-08-20', 'Arif', 15000);

INSERT INTO log VALUES
('11-3000', '2013-01-12', 'Arif'),
('12-4000', '2015-09-25', 'Komol'),
('11-6000', '2014-06-20', 'Bahadur'),
('11-5000', '2011-12-20', 'Abdul'),
('12-6000', '2015-09-19', 'Akter'),
('11-3000', '2013-05-15', 'Arif'),
('11-3000', '2014-08-20', 'Arif');


-- b) Find the names of all persons who live in Rajshahi.
SELECT name 
FROM person 
WHERE address = 'Rajshahi';


-- c) Which model was sold in 2013?
SELECT DISTINCT model
FROM car
WHERE year = 2013;


-- d) Find the names of those drivers where damage amount is between 10000 and 15000.
SELECT driver 
FROM accident
WHERE damage_amount BETWEEN 10000 AND 15000;


-- e) Find the national id (nid) of those persons who have Axio.
SELECT DISTINCT p.nid
FROM person p
JOIN owns o ON p.nid = o.nid
JOIN car c ON o.license = c.license
WHERE c.model = 'Axio';


-- f) Find the name and address of those persons who have Alto.
SELECT p.name, p.address
FROM person p
JOIN owns o ON p.nid = o.nid
JOIN car c ON o.license = c.license
WHERE c.model = 'Alto';


-- g) Who (driver) was involved in the accident on 20/12/2011?
SELECT driver
FROM accident
WHERE date_ = '2011-12-20';


-- h) Who was the owner of the car with license 12-4000?
SELECT p.name
FROM person p
JOIN owns o ON p.nid = o.nid
WHERE o.license = '12-4000';


-- i) Who was the owner of the car whose driver is Arif?
SELECT DISTINCT p.name
FROM person p
JOIN owns o ON p.nid = o.nid
JOIN log l ON o.license = l.license
WHERE l.driver = p.name;


-- j) Which car was involved in accident on 19/09/2015?
SELECT l.license
FROM log l
JOIN accident a ON l.date_ = a.date_ AND l.driver = a.driver
WHERE a.date_ = '2015-09-19';


-- k) Find the number of accidents in which the cars belonging to “Arif” were involved.
SELECT COUNT(*) AS num_of_accidents
FROM accident a
JOIN log l ON a.date_ = l.date_ AND a.driver = l.driver
JOIN owns o ON l.license = o.license
JOIN person p ON o.nid = p.nid
WHERE p.name = 'Arif';


-- l) Find the dates of accidents in which the cars belonging to “Arif” were involved.
SELECT DISTINCT a.date_
FROM accident a
JOIN log l ON a.date_ = l.date_ AND a.driver = l.driver
JOIN owns o ON l.license = o.license
JOIN person p ON o.nid = p.nid
WHERE p.name = 'Arif';


-- m) Modify the database so that “Arif” now lives in Natore.
UPDATE person
SET address = 'Natore'
WHERE name = 'Arif';
