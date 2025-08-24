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

/*A*/
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

SELECT * FROM person;

SELECT * FROM car;

SELECT * FROM accident;

SELECT * FROM owns;

SELECT * FROM log;


/*B*/
SELECT name 
FROM person 
WHERE address = 'Rajshahi';

/*C*/
SELECT DISTINCT model
FROM car
WHERE year = 2013;

/*D*/
SELECT driver 
FROM accident
WHERE damage_amount BETWEEN 10000 AND 15000;

/*E*/
SELECT DISTINCT p.nid
FROM person p
JOIN owns o ON p.nid = o.nid
JOIN car c ON o.license = c.license
WHERE c.model = 'Axio';

/*F*/
SELECT p.name, p.address
FROM person p
JOIN owns o ON p.nid = o.nid
JOIN car c ON o.license = c.license
WHERE c.model = 'Alto';

/*G*/
SELECT driver
FROM accident
WHERE date_ = '2011-12-20';

/*H*/
SELECT p.name
FROM person p
JOIN owns o ON p.nid = o.nid
WHERE o.license = '12-4000';

/*I*/
SELECT DISTINCT p.name
FROM person p
JOIN owns o ON p.nid = o.nid
JOIN log l ON o.license = l.license
WHERE l.driver = p.name;

/*J*/
SELECT l.license
FROM log l
JOIN accident a ON l.date_ = a.date_ AND l.driver = a.driver
WHERE a.date_ = '2015-09-19';

/*K*/
SELECT COUNT(*) AS num_of_accidents
FROM accident a
JOIN log l ON a.date_ = l.date_ AND a.driver = l.driver
JOIN owns o ON l.license = o.license
JOIN person p ON o.nid = p.nid
WHERE p.name = 'Arif';

/*L*/
SELECT DISTINCT a.date_
FROM accident a
JOIN log l ON a.date_ = l.date_ AND a.driver = l.driver
JOIN owns o ON l.license = o.license
JOIN person p ON o.nid = p.nid
WHERE p.name = 'Arif';

/*Update*/
UPDATE person
SET address = 'Natore'
WHERE name = 'Arif';
