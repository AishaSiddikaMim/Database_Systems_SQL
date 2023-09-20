----------------------------- 1

------------------- WITHOUT SUBQUERIES
SELECT c.*
FROM CUSTOMER c, depositor d, account a, branch b
WHERE c.customer_name = d.customer_name AND a.account_number = d.account_number 
AND a.branch_name = b.branch_name AND (c.customer_city = b.branch_city);

------------------- WITH SUBQUERY

SELECT customer_name, customer_street, customer_city
FROM (SELECT customer_name, customer_street, customer_city
FROM CUSTOMER NATURAL JOIN depositor NATURAL JOIN account NATURAL JOIN branch
WHERE customer_city = branch_city);


----------------------------- 2

------------------- WITHOUT SUBQUERIES

SELECT c.*
FROM CUSTOMER c, loan l, borrower b, branch
WHERE c.customer_name = b.customer_name AND l.LOAN_NUMBER = b.LOAN_NUMBER 
AND BRANCH.BRANCH_NAME = l.BRANCH_NAME AND c.customer_city = branch.branch_city;

------------------- WITH SUBQUERY

SELECT DISTINCT customer_name, customer_street, customer_city
FROM (SELECT DISTINCT customer_name, customer_street, customer_city
FROM CUSTOMER NATURAL JOIN borrower NATURAL JOIN loan NATURAL JOIN branch
WHERE customer_city = branch_city);


----------------------------- 3

------------------- USING HAVING

SELECT BRANCH.branch_city, avg(balance)
FROM BRANCH, ACCOUNT
WHERE BRANCH.branch_name = ACCOUNT.branch_name
GROUP BY BRANCH.branch_city
HAVING sum(balance) >= 1000; 

------------------- WITHOUT USING HAVING 

SELECT b.branch_city, avg(balance)
FROM BRANCH b, ACCOUNT a, (SELECT branch_city, SUM(balance) AS total_balance
FROM BRANCH b, ACCOUNT a
WHERE b.branch_name = a.branch_name
GROUP BY b.branch_city) Temp
WHERE b.branch_name = a.branch_name AND 
b.branch_city = Temp.branch_city
AND total_balance >= 1000
GROUP BY b.branch_city;


----------------------------- 4

------------------- USING HAVING

SELECT BRANCH.branch_city, avg(amount)
FROM BRANCH, LOAN
WHERE BRANCH.branch_name = LOAN.branch_name
GROUP BY BRANCH.branch_city
HAVING avg(amount) >= 1500; 

------------------- WITHOUT USING HAVING

SELECT b.branch_city, avg(amount)
FROM BRANCH b, LOAN l, (SELECT branch_city, avg(amount) AS average_amount
FROM BRANCH b, LOAN l
WHERE b.branch_name = l.branch_name
GROUP BY b.branch_city) Temp
WHERE b.branch_name = l.branch_name AND 
b.branch_city = Temp.branch_city
AND average_amount >= 1500
GROUP BY b.branch_city;


----------------------------- 5

------------------- USING ALL

SELECT c.*
FROM account a,CUSTOMER c, depositor d
WHERE c.customer_name = d.customer_name AND a.ACCOUNT_NUMBER = d.ACCOUNT_NUMBER 
AND balance >= ALL (Select balance FROM ACCOUNT);

------------------- WITHOUT USING ALL

SELECT c.*
FROM account a,CUSTOMER c, depositor d
WHERE c.customer_name = d.customer_name AND a.ACCOUNT_NUMBER = d.ACCOUNT_NUMBER 
AND balance IN (Select max(balance)
FROM ACCOUNT);


----------------------------- 6

------------------- USING ALL

SELECT c.*
FROM loan l,CUSTOMER c, BORROWER b
WHERE c.customer_name = b.customer_name AND b.loan_number = l.loan_number 
AND amount <= ALL (Select AMOUNT FROM LOAN);

------------------- WITHOUT USING ALL

SELECT c.*
FROM loan l,CUSTOMER c, BORROWER b
WHERE c.customer_name = b.customer_name AND b.loan_number = l.loan_number 
AND amount IN (Select min(AMOUNT) 
FROM LOAN);


----------------------------- 7

------------------- USING IN

SELECT DISTINCT branch_name, branch_city
FROM BRANCH NATURAL JOIN ACCOUNT NATURAL JOIN LOAN 
WHERE branch_name IN (SELECT branch_name
FROM LOAN NATURAL JOIN BRANCH);

------------------- USING EXISTS

SELECT DISTINCT branch_name, branch_city
FROM (SELECT branch_name, branch_city
FROM BRANCH NATURAL JOIN ACCOUNT) Temp1
WHERE EXISTS (SELECT branch_name, branch_city
FROM (SELECT branch_name, branch_city
FROM BRANCH NATURAL JOIN LOAN) Temp2
WHERE Temp1.branch_name = Temp2.branch_name);


----------------------------- 8

------------------- USING NOT IN

SELECT DISTINCT customer_name, customer_city
FROM CUSTOMER NATURAL JOIN DEPOSITOR 
WHERE customer_name NOT IN (SELECT customer_name
FROM CUSTOMER NATURAL JOIN BORROWER);

------------------- USING NOT EXISTS

SELECT DISTINCT customer_name, customer_city
FROM (SELECT customer_name, customer_city
FROM CUSTOMER NATURAL JOIN DEPOSITOR) Temp1
WHERE NOT EXISTS (SELECT customer_name, customer_city
FROM (SELECT customer_name, customer_city
FROM CUSTOMER NATURAL JOIN BORROWER) Temp2
WHERE Temp1.customer_name = Temp2.customer_name);






