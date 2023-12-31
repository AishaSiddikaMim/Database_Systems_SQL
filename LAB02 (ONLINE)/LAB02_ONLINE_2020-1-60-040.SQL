-------------------CREATE TABLE 

create table product (
PRODUCT_ID      NUMBER,
product_name    VARCHAR2(5),
PRODUCT_PRICE     NUMBER,
CONSTRAINT CHECK (PRODUCT_PRICE > 100),
CONSTRAINT PT_PK PRIMARY KEY (PRODUCT_ID)
);

---------------A

ALTER TABLE PRODUCT ADD PRODUCT_MGF_DATE DATE;

---------------B

ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_MGF_DATE CHECK (PRODUCT_MGF_DATE > to_date ('01-JAN-2022', 'dd-mm-yy'));


---------------C


ALTER TABLE PRODUCT MODIFY product_name VARCHAR2(15);

---------------D

ALTER TABLE PRODUCT ADD PRODUCT_EXPR_DATE DATE;

---------------E

INSERT INTO PRODUCT VALUES (25, 'OIL', 250, '03-mar-2022', '03-mar-2027');


---------------F

ALTER TABLE PRODUCT DROP COLUMN PRODUCT_EXPR_DATE;

---------------G

ALTER TABLE PRODUCT RENAME COLUMN PRODUCT_PRICE TO PRICE;

---------------H

ALTER TABLE PRODUCT RENAME TO PRODUCT_DATA;

---------------I

ALTER TABLE PRODUCT_DATA DROP CONSTRAINT PPRODUCT_MGF_DATE ;









