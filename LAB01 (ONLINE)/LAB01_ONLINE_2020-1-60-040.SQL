--------- CREATE TABLE Instructor

CREATE TABLE Instructor (
   instructor_id	VARCHAR2(13),
   instructor_name	VARCHAR2(20),
   dept_name	        VARCHAR2(20),       
   Salary	        NUMBER,
   CONSTRAINT instructorId_PK PRIMARY KEY (instructor_id),
   CONSTRAINT deptName_FK FOREIGN KEY (dept_name) REFERENCES Department,
   CONSTRAINT IT_SALARY CHECK (Salary > 30000)
);

----------- CREATE TABLE Department

CREATE TABLE Department (
   dept_name	        VARCHAR2(20),  
   building	        VARCHAR2(20),       
   Budget	        NUMBER,
   CONSTRAINT deptName_PK PRIMARY KEY (dept_name),
   CONSTRAINT building_FK FOREIGN KEY (Building) REFERENCES Building,
   CONSTRAINT DT_BUDGET CHECK (Budget > 100000)
);

------------- CREATE TABLE Building

CREATE TABLE Building (  
   building	        VARCHAR2(20),       
   Area	                VARCHAR2(20),
   Floor	        NUMBER,
   CONSTRAINT building_PK PRIMARY KEY (Building),
   
);

----------INSERTING VALUES

INSERT INTO INSTRUCTOR VALUES ('2020-1-60-040', 'ALICE', 'CSE', 50000);
INSERT INTO INSTRUCTOR VALUES ('2021-2-60-045', 'LISA', 'CSE', 75000);
INSERT INTO INSTRUCTOR VALUES ('2022-3-60-051', 'SAM', 'EEE', 89000);

INSERT INTO Department VALUES ('CSE', 'Main', 500000);
INSERT INTO Department VALUES ('CSE', 'Fub', 700000);
INSERT INTO Department VALUES ('EEE', 'AB-1', 900000);

INSERT INTO Building VALUES ('Main', 9500000, 8);
INSERT INTO Building VALUES ('Fub', 720000, 10);
INSERT INTO Building VALUES ('AB-1', 150000, 9);

------------ Query - 1

SELECT instructor_id, instructor_name, Salary
FROM Instructor, Department
WHERE Instructor.dept_name = Department.dept_name AND Building = 'Main';

------------ Query - 2

SELECT dept_name
FROM Department, Building
WHERE Deprtment.building = Building.building AND (Area > 200000) ;

------------ Query - 3

SELECT instructor_name, dept_name
FROM Instructor, Department
WHERE Instructor.dept_name = Department.dept_name AND (Budget => 100000) AND (Budget <= 200000) ;

------------ Query - 4

SELECT instructor_name, dept_name, Building.building
FROM Instructor, Department, Building
WHERE Instructor.dept_name = Department.dept_name AND Deprtment.building = Building.building AND (Salary => 50000) AND (Area < 200000) ;

