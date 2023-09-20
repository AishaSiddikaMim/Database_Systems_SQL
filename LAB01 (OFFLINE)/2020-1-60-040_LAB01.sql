--------------CREATE TABLE(LAB TASK - 01(a) )  

CREATE TABLE instructor_2020160040(
id              NUMBER,
name            VARCHAR (20),
dept_name       VARCHAR (25),
salary          NUMBER,
CONSTRAINT IT_PK PRIMARY KEY (id)
);

--------------CREATE TABLE(LAB TASK - 01(b) )  

CREATE TABLE course_2020160040 (
course_id       VARCHAR (20),
title           VARCHAR (40),
dept_name       VARCHAR (25),
credits         NUMBER (5, 2),
CONSTRAINT CT_PK PRIMARY KEY (course_id)
);

----------INSERT VALUES(LAB TASK - 02(a) )

INSERT INTO instructor_2020160040 VALUES (10101, 'Srinivasan', 'Comp.Sci.', 65000);
INSERT INTO instructor_2020160040 VALUES (12121, 'Wu',         'Finance',   90000);
INSERT INTO instructor_2020160040 VALUES (15151, 'Mozart',     'Music',     40000);
INSERT INTO instructor_2020160040 VALUES (22222, 'Einstein',   'Physics',   95000);
INSERT INTO instructor_2020160040 VALUES (32343, 'EI Said',    'History',   60000);
INSERT INTO instructor_2020160040 VALUES (33456, 'Gold',       'Physics',   87000);
INSERT INTO instructor_2020160040 VALUES (45565, 'Katz',       'Comp.Sci.', 75000);
INSERT INTO instructor_2020160040 VALUES (58583, 'Califieri',  'History',   62000);
INSERT INTO instructor_2020160040 VALUES (76543, 'Singh',      'Finance',   80000);
INSERT INTO instructor_2020160040 VALUES (76766, 'Crick',      'Biology',   72000);
INSERT INTO instructor_2020160040 VALUES (83821, 'Brandt',     'Comp.Sci.', 92000);
INSERT INTO instructor_2020160040 VALUES (98345, 'Kim',        'Elec.Eng.', 80000);

----------INSERT VALUES(LAB TASK - 02(b) )

INSERT INTO course_2020160040 VALUES ('BIO-101', 'Intro to Biology',           'Biology',   4);
INSERT INTO course_2020160040 VALUES ('BIO-301', 'Genetics',                   'Biology',   4);
INSERT INTO course_2020160040 VALUES ('BIO-399', 'Computational Biology',      'Biology',   3);
INSERT INTO course_2020160040 VALUES ('CS-101',  'Intro. to Computer Science', 'Comp.Sci.', 4);
INSERT INTO course_2020160040 VALUES ('CS-190',  'Game Design',		       'Comp.Sci.', 4);
INSERT INTO course_2020160040 VALUES ('CS-315',  'Robotics',		       'Comp.Sci.', 3);
INSERT INTO course_2020160040 VALUES ('CS-319',  'Image Processing',	       'Comp.Sci.', 3);
INSERT INTO course_2020160040 VALUES ('CS-347',  'Database System Concepts',   'Comp.Sci.', 3);
INSERT INTO course_2020160040 VALUES ('EE-181',  'Intro. to Digital Systems',  'Elec.Eng.', 3);
INSERT INTO course_2020160040 VALUES ('FIN-201', 'Investment Banking',	       'Finance',   3);
INSERT INTO course_2020160040 VALUES ('HIS-351', 'World History',              'History',   3);
INSERT INTO course_2020160040 VALUES ('MU-199',  'Music Video Production',     'Music',     3);
INSERT INTO course_2020160040 VALUES ('PHY-101', 'Physics Principles',         'Physics',   4);

------------QUERIES (LAB TASK - 03)

------(i)

SELECT name
From instructor_2020160040;

------(ii)

SELECT course_id, title
From course_2020160040;

------(iii)

SELECT name, instructor_2020160040.dept_name
FROM instructor_2020160040
WHERE id = 22222;

------(iv)

SELECT title, credits
FROM course_2020160040
WHERE dept_name = 'Comp.Sci.';

------(v)

SELECT name, instructor_2020160040.dept_name
FROM instructor_2020160040
WHERE salary > 70000;

------(vi)

SELECT title
FROM course_2020160040
WHERE credits >= 4 ;

------(vii)

SELECT name, dept_name
From instructor_2020160040
WHERE (salary >= 80000 AND salary <= 100000);

------(viii)

SELECT title, credits
FROM course_2020160040
Where dept_name != 'Comp.Sci.';

------(ix)

SELECT *
From instructor_2020160040;

------(x)

SELECT *
From course_2020160040
WHERE dept_name = 'Biology' AND credits != 4;
