-- create Student table

CREATE TABLE Student (
   id			VARCHAR2(13),
   name			VARCHAR2(20) NOT NULL,
   dob			DATE,
   total_credits	NUMBER(5,2),
   CGPA			NUMBER(3,2),
   PRIMARY KEY (id),
   CHECK (CGPA >=0 AND CGPA <= 4)
);

-- drop Student table

DROP TABLE Student;

-- insert a record into Student table

INSERT INTO Student VALUES 
       ('2018-2-60-062', 'Sumona', '12/01/1998', 140.00, 3.99);


INSERT INTO Student VALUES 
       ('2018-2-60-063', 'A', '06/01/1997', 76.00, 3.69);
INSERT INTO Student VALUES 
       ('2018-2-60-064', 'B', '03/11/1998', 50.50, 2.99);
INSERT INTO Student VALUES 
       ('2018-2-60-065', 'C', '12/30/1999', 140.00, 3.9);

-- delete an existing record from Student table

DELETE FROM Student
WHERE id = '2018-2-60-065';

-- update an existing record of Student table
UPDATE Student
SET CGPA = 3.79
WHERE id = '2018-2-60-063';


-- Retrieve data of Student Table
-- SELECT-FROM-WHERE query

SELECT * FROM Student;

-- Show id, name and cgpa of all students.

SELECT id, name, cgpa
FROM Student;

-- Show id, name, cgpa of students who have 
-- cgpa more than or equal to 3


SELECT id, name, cgpa
FROM Student
WHERE CGPA >= 3;












