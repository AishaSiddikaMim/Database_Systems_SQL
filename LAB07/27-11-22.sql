---------- create views 

CREATE VIEW V AS 
(SELECT id, name, dept_name
FROM instructor);

desc user_views

select view_name, text
from user_views;

-------- crerate a view that contains dept name,
 avg salary of instructors of the dept

CREATE VIEW V1 AS 
(SELECT dept_name, avg(salary) as avg_salary
FROM instructor
GROUP BY dept_name);

----- crerate a view that contains instructor_name, 
course_titles they tough in 2009

CREATE VIEW V2 AS 
(SELECT name, title
FROM instructor NATURAL JOIN teaches, course
WHERE teaches.course_id = course.course_id 
AND semester = 'FALL' and YEAR = 2009);

select *
from course;

select *
from teaches;


------ see anything from views

SELECT *
FROM V2;


SELECT *
FROM V;

------- updateble views

SELECT id, name
from v
where dept_name = 'Comp.Sci.';

select dept_name, count(*)
from v
group by dept_name;


---- INSERT INTO v VALUES('99989', 'TBA', 'Comp.Sci.');

---- INSERT INTO v2 VALUES('TBA', 'Machine Learning'); <<not work>>

---- delete views

delete from v
where id = '9989';

---------

creating 2 new users

CREATE USER dept_sec identified by cse302; (system)

CREATE USER alice identified by cse302; (system)

drop user ALICE; (system)

GRANT connect, create session, unlimited tablespace 
to dept_sec, ALICE; (system)


---- providing access to another user

GRANT SELECT ON v TO dept_sec; (cse302)

SELECT * FROM v; (dept_sec)

select * from cse302_s1_f22;

GRANT SELECT, INSERT ON v TO ALICE WITH GRANT OPTION; (CMD ALICE)
select * from cse302_s1_f22.V; (ALICE)

CREATE USER BOB identified by cse302; (system)
GRANT connect, create session, unlimited tablespace 
to dept_sec, BOB; (system)

SELECT * FROM v; (CSE302)

GRANT SELECT ON cse302_s1_f22.V TO BOB; (CSE302)

SELECT * FROM v; (BOB)

------- WITHDRAW PERMISSIONS

REVOKE SELECT ON cse302_s1_f22.V FROM ALICE;

DESC USER_TABS_PRIVS

SELECT *
FROM USER_TABS_PRIVS;

REVOKE SELECT ON V FROM ALICE; (CSE302)
select * from cse302_s1_f22.V; (ALICE)
select * from cse302_s1_f22.V; (BOB)


----------- LAB TASKS

----------- CSE302_S1_F22 user creation:

create user CSE302_S1_F22 identified by cse302;

GRANT RESOURCE, CONNECT, CREATE SESSION, CREATE TABLE,
CREATE VIEW, CREATE ANY TRIGGER, CREATE ANY PROCEDURE, CREATE
SEQUENCE, CREATE SYNONYM, UNLIMITED TABLESPACE TO CSE302_S1_F22;












