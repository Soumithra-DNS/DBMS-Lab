/*----------------------------------------------------------
  1. Create student table and insert values
----------------------------------------------------------*/
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


/*----------------------------------------------------------
  2. Create studentInfo table and insert values
----------------------------------------------------------*/
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


/*----------------------------------------------------------
  3. Queries
----------------------------------------------------------*/

/* (i) Find out the names of those students who are in 1st semester */
SELECT Name FROM student
WHERE Semester = '1st';

/* (ii) Find out the names of those students who are in 2nd year */
SELECT Name
FROM student
WHERE Year = '2nd';

/* (iii) Find out the names of those students who are in CSE */
SELECT Name
FROM student
WHERE Dept = 'CSE';

/* (iv) Find out the name of the student whose roll is 06543201 */
SELECT Name
FROM student
WHERE Roll = '06543201';


/*----------------------------------------------------------
   Queries on student1
----------------------------------------------------------*/

/* (i) Find out the names, address and mobile for those students whose father’s name is Rahman */
SELECT Name, Address, Mobile
FROM student1
WHERE FatherName = 'Rahman';

/* (ii) Find out the names, address and mobile for those students whose mobile is 01719202020 */
SELECT Name, Address, Mobile
FROM student1
WHERE Mobile = '01719202020';

/* (iii) Find out the names, address and mobile for those students whose address is Rajshahi */
SELECT Name, Address, Mobile
FROM student1
WHERE Address = 'Rajshahi';

/* (iv) Find out the names, address and mobile for those students whose address is Rajshahi and father’s name Rahman */
SELECT Name, Address, Mobile
FROM student1
WHERE Address = 'Rajshahi' AND FatherName = 'Rahman';

/* (v) Find out the names, address and mobile for those students whose roll is 05654456 */
SELECT Name, Address, Mobile
FROM student1
WHERE Roll = '05654456';
