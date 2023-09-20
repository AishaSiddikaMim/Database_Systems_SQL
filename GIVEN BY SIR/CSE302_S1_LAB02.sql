-- create a new attribute 'date_of_birth' in the existing STUDENT table.

ALTER TABLE STUDENT ADD date_of_birth DATE;

ALTER TABLE STUDENT ADD CGPA NUMBER;


UPDATE STUDENT
SET date_of_birth = '03-MAR-2002', CGPA = 4.0
WHERE id = '2020-1-60-001';


ALTER TABLE STUDENT DROP COLUMN CGPA;
ALTER TABLE STUDENT DROP COLUMN date_of_birth;


ALTER TABLE STUDENT MODIFY ID NUMBER;

UPDATE STUDENT
SET TOT_CRED = NULL;

ALTER TABLE STUDENT MODIFY TOT_CRED VARCHAR2(10);

-- to drop a constraint

ALTER TABLE STUDENT DROP CONSTRAINT ST_TOT_CRED;

-- renaming an attribute name

ALTER TABLE STUDENT RENAME COLUMN TOT_CRED TO TOTAL_CREDIT;

-- rename a table

ALTER TABLE STUDENT RENAME TO STUDENT_INFO;

ALTER TABLE STUDENT_INFO RENAME TO STUDENT;

ALTER TABLE STUDENT ADD CONSTRAINT ST_CHK_DEPT CHECK (dept_name IN 
                                               ('CSE','EEE','ECE'));

-- Queries on Banking Schema


-- 1. Find account number and branch name which have balance more than 500.

SELECT account_number, branch_name
FROM ACCOUNT a
WHERE balance > 500;

-- 2. Find account number and branch name which have balance 
-- in between 500 and 700.

SELECT account_number, branch_name
FROM ACCOUNT a
WHERE balance >= 500 and balance <= 700;

SELECT account_number, branch_name
FROM ACCOUNT a
WHERE balance BETWEEN 500 AND 700;


-- 3. Find loan number and branch name which have amount
-- more than 100 and less than 500. (use BETWEEN)


SELECT loan_number, branch_name
FROM LOAN 
WHERE amount BETWEEN 101 AND 499;

-- 4. Show customer name who have accounts

SELECT customer_name
FROM DEPOSITOR;

-- 5. Show unique customer name who have accounts.

SELECT DISTINCT customer_name
FROM DEPOSITOR;

-- 6. Show unique customer name who have an account or a loan or both.

SELECT customer_name
FROM Depositor
UNION
SELECT customer_name
FROM Borrower;

-- 7. Show unique customer name who have both account and loan.

SELECT customer_name
FROM Depositor
INTERSECT
SELECT customer_name
FROM Borrower;

-- 8. Show unique customer name who have only accounts but no loans.

SELECT customer_name
FROM Depositor
MINUS
SELECT customer_name
FROM Borrower;

-- 9. Show unique customer name who have only loans but no accounts.

SELECT customer_name
FROM Borrower
MINUS
SELECT customer_name
FROM Depositor;

-- 10. Show customer name, street and city who have both accounts and loans.

SELECT C.customer_name, customer_street, customer_city
FROM Depositor D, Customer C
WHERE D.customer_name = C.customer_name
INTERSECT
SELECT C.customer_name, customer_street, customer_city
FROM Borrower B, Customer C
WHERE B.customer_name = C.customer_name;


SELECT customer_name, customer_street, customer_city
FROM Depositor NATURAL JOIN Customer
INTERSECT
SELECT customer_name, customer_street, customer_city
FROM Borrower NATURAL JOIN Customer;












