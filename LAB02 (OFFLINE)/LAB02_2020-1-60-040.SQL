---------------- CREATE TABLE (LAB TASK - 01 (i) )

CREATE TABLE ACCOUNT(
account_no      CHAR(5),
balance         NUMBER NOT NULL,
CONSTRAINT ACCOUNT_PK PRIMARY KEY (account_no),
CONSTRAINT ACCOUNT_balance CHECK (balance > 0)
);

---------------- CREATE TABLE (LAB TASK - 01 (ii) )

CREATE TABLE CUSTOMER(
customer_no      CHAR(5),
customer_name    VARCHAR2(20) NOT NULL,
customer_city    VARCHAR2(10),
CONSTRAINT CUSTOMER_PK PRIMARY KEY (customer_no)
);

---------------- CREATE TABLE (LAB TASK - 01 (iii) )

CREATE TABLE DEPOSITOR(
account_no      CHAR(5),
customer_no     CHAR(5),
CONSTRAINT DEPOSITOR_PK PRIMARY KEY (account_no, customer_no)
);


---------------- MAKING CHANGES IN THE TABLES (LAB TASK - 02)


---------------- (i) 

ALTER TABLE CUSTOMER ADD date_of_birth DATE;
desc CUSTOMER;

---------------- (ii)

ALTER TABLE CUSTOMER DROP COLUMN date_of_birth;
desc CUSTOMER;

---------------- (iii) 

ALTER TABLE DEPOSITOR RENAME COLUMN account_no TO a_no;
ALTER TABLE DEPOSITOR RENAME COLUMN customer_no TO c_no;
desc DEPOSITOR;

---------------- (iv) 

ALTER TABLE DEPOSITOR ADD CONSTRAINT depositor_fk1 FOREIGN KEY(a_no) REFERENCES ACCOUNT(account_no);
ALTER TABLE DEPOSITOR ADD CONSTRAINT depositor_fk2 FOREIGN KEY(c_no) REFERENCES CUSTOMER(customer_no);
desc DEPOSITOR;

---------------- INSERTING VALUES (LAB TASK - 03)

INSERT INTO ACCOUNT VALUES ('A-101', 12000);
INSERT INTO ACCOUNT VALUES ('A-102', 6000);
INSERT INTO ACCOUNT VALUES ('A-103', 2500);

INSERT INTO CUSTOMER VALUES ('C-101', 'Alice',   'Dhaka');
INSERT INTO CUSTOMER VALUES ('C-102', 'Annie',   'Dhaka');
INSERT INTO CUSTOMER VALUES ('C-103', 'Bob',     'Chittagong');
INSERT INTO CUSTOMER VALUES ('C-104', 'Charlie', 'Khulna');

INSERT INTO DEPOSITOR VALUES ('A-101', 'C-101');
INSERT INTO DEPOSITOR VALUES ('A-103', 'C-102');
INSERT INTO DEPOSITOR VALUES ('A-103', 'C-104');
INSERT INTO DEPOSITOR VALUES ('A-102', 'C-103');



---------------- QUERIES (LAB TASK - 04)

---------------- (i) 

SELECT customer_name, customer_city
FROM CUSTOMER;

---------------- (ii) 

SELECT DISTINCT customer_city
FROM CUSTOMER; 

---------------- (iii) 

SELECT account_no 
FROM ACCOUNT
WHERE (balance > 7000);

---------------- (iv) 

SELECT customer_name, customer_no
FROM CUSTOMER
WHERE (customer_city = 'Khulna');

---------------- (v) 

SELECT customer_name, customer_no
FROM CUSTOMER
WHERE (customer_city != 'Dhaka');

---------------- (vi) 

SELECT customer_name, customer_city
FROM ACCOUNT, CUSTOMER, DEPOSITOR
WHERE ACCOUNT.account_no = DEPOSITOR.a_no AND CUSTOMER.customer_no = DEPOSITOR.c_no AND (balance > 7000);

---------------- (vii) 

SELECT customer_name, customer_city
FROM ACCOUNT, CUSTOMER, DEPOSITOR
WHERE ACCOUNT.account_no = DEPOSITOR.a_no AND CUSTOMER.customer_no = DEPOSITOR.c_no AND (balance > 7000) AND (customer_city != 'Khulna');

---------------- (viii) 

SELECT ACCOUNT.account_no, balance
FROM ACCOUNT, DEPOSITOR
WHERE ACCOUNT.account_no = DEPOSITOR.a_no AND (c_no = 'C-102'); 

---------------- (ix) 

SELECT ACCOUNT.account_no, balance
FROM ACCOUNT, CUSTOMER, DEPOSITOR
WHERE ACCOUNT.account_no = DEPOSITOR.a_no AND CUSTOMER.customer_no = DEPOSITOR.c_no AND (customer_city != 'Chittagong');

---------------- (x) 

SELECT customer_no, customer_name, customer_city
FROM ACCOUNT, CUSTOMER, DEPOSITOR
WHERE ACCOUNT.account_no = DEPOSITOR.a_no AND CUSTOMER.customer_no = DEPOSITOR.c_no AND account_no = NULL;
