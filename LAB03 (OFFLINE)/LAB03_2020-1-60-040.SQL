-----------------------1

SELECT branch_name, branch_city
FROM branch
WHERE (assets > 1000000);

-----------------------2

SELECT account_number, balance
FROM account
WHERE branch_name = 'Downtown' OR balance BETWEEN 599 AND 751;

-----------------------3

SELECT account.account_number
FROM account, branch
WHERE account.branch_name = branch.branch_name AND branch_city = 'Rye';

-----------------------4

SELECT loan.loan_number
FROM borrower, loan, customer
WHERE borrower.loan_number = loan.loan_number AND customer.customer_name = borrower.customer_name AND customer_city = 'Harrison' AND amount >= 1000;

-----------------------5

SELECT *
FROM account
ORDER BY balance DESC;

-----------------------6

SELECT *
FROM customer
ORDER BY customer_city;
 
-----------------------7

SELECT customer_name
FROM depositor
INTERSECT
SELECT customer_name
FROM borrower;

-----------------------8

SELECT customer.customer_name, customer_city, customer_street
FROM depositor, customer
WHERE depositor.customer_name = customer.customer_name
UNION
SELECT customer.customer_name, customer_city, customer_street
FROM borrower, customer
WHERE borrower.customer_name = customer.customer_name;

-----------------------9

SELECT customer.customer_name, customer_city
FROM borrower, customer
WHERE borrower.customer_name = customer.customer_name
MINUS
SELECT customer.customer_name, customer_city
FROM depositor, customer
WHERE depositor.customer_name = customer.customer_name;

-----------------------10

SELECT sum(assets)
FROM branch;

-----------------------11

SELECT branch_name, avg(balance)
FROM account
GROUP BY branch_name;

-----------------------12

SELECT branch_city, avg(balance)
FROM account, branch
WHERE account.branch_name = branch.branch_name
GROUP BY branch_city;

-----------------------13

SELECT branch_name, min(amount)
FROM loan
GROUP BY branch_name;

-----------------------14

SELECT branch_name, count(loan_number)
FROM loan
GROUP BY branch_name;

-----------------------15

SELECT depositor.customer_name, depositor.account_number
FROM depositor
MINUS
SELECT d.customer_name, d.account_number
FROM account, depositor d, depositor (temp)
WHERE d.balance < temp.balance AND d.account_number = account.account_number ;
 




