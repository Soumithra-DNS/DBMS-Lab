/*1*/
CREATE TABLE student(
  Roll VARCHAR(20) PRIMARY KEY,
  Name VARCHAR(20),
  Dept VARCHAR(20),
  Year VARCHAR(20),
  Semester VARCHAR(20)
);

INSERT INTO student (Roll, Name, Dept, Year, Semester) VALUES
('06543201', 'Rahim', 'BBA', '2nd', '1st'),
('06543202', 'Karim', 'ICE', '2nd', '1st'),
('06543203', 'Motin', 'CSE', '1st', '2nd'),
('05654456', 'Swadhin', 'CSE', '1st', '2nd'),
('05654457', 'Hena', 'BBA', '4th', '2nd'),
('05654458', 'Sohag', 'CSE', '3rd', '1st');

SELECT * FROM student;

/*2*/
CREATE TABLE student1 (
    Roll VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(20),
    FatherName VARCHAR(20),
    Address VARCHAR(20),
    Mobile VARCHAR(15)
);

INSERT INTO student1 (Roll, Name, FatherName, Address, Mobile) VALUES
('06543201', 'Rahim', 'Ataur', 'Rajshahi', '01719201233'),
('06543202', 'Karim', 'Tareq', 'Dhaka', '01719202020'),
('06543203', 'Motin', 'Rahman', 'Khulna', '01719202678'),
('05654456', 'Swadhin', 'Fazlu', 'Rajshahi', '01719204564'),
('05654457', 'Hena', 'Rahman', 'Rajshahi', '01119212020'),
('05654458', 'Sohag', 'Fazlul', 'Natore', '01719202222');

SELECT * FROM student1;

/*3*/
/*1*/
/*i*/
SELECT Name FROM student
WHERE Semester = '1st';

/*ii*/
SELECT Name
FROM student
WHERE Year = '2nd';

/*iii*/
SELECT Name
FROM student
WHERE Dept = 'CSE';

/*iv*/
SELECT Name
FROM student
WHERE Roll = '06543201';

/*2*/
/*i*/
SELECT Name, Address, Mobile
FROM student1
WHERE FatherName = 'Rahman';

/*ii*/
SELECT Name, Address, Mobile
FROM student1
WHERE Mobile = '01719202020';

/*iii*/
SELECT Name, Address, Mobile
FROM student1
WHERE Address = 'Rajshahi';

/*iv*/
SELECT Name, Address, Mobile
FROM student1
WHERE Address = 'Rajshahi' AND FatherName = 'Rahman';

/*v*/
SELECT Name, Address, Mobile
FROM student1
WHERE Roll = '05654456';
