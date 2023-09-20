------------------------- TASK 1

CREATE VIEW CSE_COURSE AS 
(SELECT course_id, title, credits
FROM course Natural join student
WHERE dept_name = 'Comp. Sci.');

SELECT course_id, title, credits
from CSE_COURSE;


----------------------- TASK 2

CREATE USER U1 identified by cse302;
CREATE USER U2 identified by cse302;
CREATE USER U3 identified by cse302;

GRANT connect, create session, unlimited tablespace to U1, U2, U3;


----------------------- TASK 3

------- (EXECUTED FROM CSE302_S1_F22)

GRANT SELECT ON CSE_COURSE TO U1 WITH GRANT OPTION;

GRANT SELECT ON CSE_COURSE TO U2 WITH GRANT OPTION;


------- (EXECUTED FROM U2)

SELECT *
FROM CSE302_S1_F22.CSE_COURSE;

GRANT SELECT ON CSE302_S1_F22.CSE_COURSE TO U1;

-------- (EXECUTED FROM U1)

SELECT *
FROM CSE302_S1_F22.CSE_COURSE;

GRANT SELECT ON CSE302_S1_F22.CSE_COURSE TO U3;

-------- (EXECUTED FROM U3)

SELECT *
FROM CSE302_S1_F22.CSE_COURSE;


----------------------- TASK 4

-------- (EXECUTED FROM CSE302_S1_F22)

SELECT *
FROM USER_TAB_PRIVS;


---------------------- TASK 5

-------- (EXECUTED FROM CSE302_S1_F22)

REVOKE SELECT ON CSE_COURSE FROM U1;

SELECT *
FROM USER_TAB_PRIVS;


---------------------- TASK 6

Authorization graph after revoking : 

The privilege is revoked from U1. So U3 will lose the privilege, as U3 was getting the privilege from U1. 
But U1 will not lose the privilege because it is getting the privilege from U2 also.

