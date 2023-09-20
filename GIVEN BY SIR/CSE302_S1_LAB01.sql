-- create a new user

CREATE USER CSE302_S1_F22 IDENTIFIED BY cse302;

-- provide appropriate permission to a new user

GRANT CONNECT, CREATE SESSION, CREATE TABLE, CREATE VIEW,
CREATE SEQUENCE, CREATE ANY TRIGGER, UNLIMITED TABLESPACE TO
CSE302_S1_F22;

-- create Student table
CREATE TABLE STUDENT (
   id VARCHAR2(13),
   name VARCHAR2(10),
   dept_name VARCHAR2(10),
   tot_CRED NUMBER(5,2),
   CONSTRAINT ST_PK PRIMARY KEY (id),
   CONSTRAINT ST_TOT_CRED CHECK (tot_cred >=0 and tot_cred <=140)
);
CREATE TABLE CourseAdvising (
   course_id varchar2(6),
   sec_id NUMBER,
   semester VARCHAR2(10),
   year NUMBER,
   id VARCHAR2(13),
   grade VARCHAR2(2),
   CONSTRAINT CA_PK PRIMARY KEY (course_id, sec_id, semester,
                                 year, id),
   CONSTRAINT CA_FK FOREIGN KEY (id) REFERENCES Student,
   CONSTRAINT CA_year CHECK (year >= 2000)
);

INSERT INTO Student VALUES ('2020-1-60-001', 'Alice', 'CSE', 100);
INSERT INTO Student VALUES ('2020-1-60-002', 'Bob', 'CSE', 85);
INSERT INTO Student VALUES ('2020-1-68-003', 'Charlie', 'EEE', 75);
INSERT INTO Student VALUES ('2020-1-60-003', 'Danny', 'CSE', 55);


INSERT INTO COURSEADVISING VALUES ('CSE345',1,'Fall',2022,'2020-1-60-001','A');
INSERT INTO COURSEADVISING VALUES ('CSE302',2,'Fall',2022,'2020-1-60-001','B+');
INSERT INTO COURSEADVISING VALUES ('EEE387',1,'Summer',2022,'2020-1-68-003','A-');
INSERT INTO COURSEADVISING VALUES ('EEE200',1,'Summer',1998,'2020-1-68-003','A-');

INSERT INTO COURSEADVISING VALUES ('EEE387',1,'Summer',2022,'2020-1-68-004','A-');


-- Find students who are from CSE department and completed 
-- more than or equal to 100 credits

SELECT *
FROM STUDENT
WHERE dept_name = 'CSE' AND tot_cred >= 120;

-- Joining two relations using cross join (cartesian product) 
-- with a JOIN CONDITION


SELECT *
FROM Student, CourseAdvising
WHERE Student.id = CourseAdvising.id;


-- Find student id, name and total credits completed who have enrolled 
-- courses in Fall 2022 semester.

SELECT DISTINCT CourseAdvising.id, name, tot_cred
FROM Student, CourseAdvising
WHERE Student.id = CourseAdvising.id and semester = 'Fall' and year = 2022;










