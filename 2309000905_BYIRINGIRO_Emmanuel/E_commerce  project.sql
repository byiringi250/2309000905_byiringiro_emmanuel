
-- 2309000905 BYIRINGIRO EMMANUEL
show databases;
create database e_commerce_system;
use e_commerce_system;

show tables;


-- CRUD
-- creation of tables
-- creation of CUSTOMERS table
CREATE TABLE CUSTOMERS(
    Customer_ID	INT PRIMARY KEY not null,
	F_Name	VARCHAR(100),
	L_Name	VARCHAR(100),
	Email	VARCHAR(30)not null,
	Address	VARCHAR(40)	not null,
	Phone_Number	VARCHAR(40)	not null
    );

-- creation of PRODUCTS table
CREATE TABLE PRODUCTS(
	product_ID	INT	PRIMARY KEY not null,
	Product_Name	VARCHAR(100)	not null,
	Category	VARCHAR(100)	not null,
	Price	INT not null,
	Quantity	INT	not null
    );


-- creation of ORDERS table
CREATE TABLE ORDERS(
	Order_ID	INT PRIMARY KEY not null,
	Customer_ID	INT,
	Product_ID 	INT,
	Order_Status	VARCHAR(40)	not null,
	Order_date	DATE not null,
	Shipping_add	VARCHAR(40)	not null,
    FOREIGN KEY(Customer_ID) REFERENCES CUSTOMERS(Customer_ID),
    FOREIGN KEY(product_ID) REFERENCES PRODUCTS(product_ID)
    );

-- insert data into tables

INSERT INTO CUSTOMERS(Customer_ID,F_Name,L_Name,Email,Address,Phone_Number) VALUES
(1,"BYUKUSENGE","jonshon","B.jonShon@eaxample.com","nyabihu","078256365"),
(2,"KARAGWA","john","K.john@eaxample.com","kicukiro","0797467236"),
(3,"KAMANA","alice","K.alice@eaxample.com","rubavu","07276367676"),
(4,"UWERA","dianne","U.dianne@eaxample.com","goma","0738764367"),
(5,"MUTONIWASE","lose","M.lose@eaxample.com","gasabo","0780978676"),
(6,"MURISA","james","M.james@eaxample.com","musanze","0791111323"),
(7,"ISHIMWE","aldo","I.aldo@eaxample.com","nyabihu","072667375657")
;

INSERT INTO PRODUCTS(product_ID,Product_Name,Category,Price,Quantity) VALUES
(1,"rice","food",1000,2000),
(2,"mango","food",1000,500),
(3,"juice","Beverage",500,1500),
(4,"shoes","Clothing",400,20000),
(5,"jacket","Clothing",100,10000), 
(6,"ball","sports",70,40000),
(7,"milk","Beverage",2000,1000),
(8,"bedroom","Furniture",30,60000)
;

INSERT INTO ORDERS(Order_ID,Customer_ID,Product_ID,Order_Status,Order_date,Quantity,Shipping_add) VALUE 
(1,1,1,"pending","2025-01-20",30,"musanze"),
(2,1,2,"pending","2025-01-20",20,"majerwa"),
(3,1,3,"shiped","2025-01-28",100,"kicukiro"),
(4,2,1,"Processing ","2024-02-10",20,"kiziguro"),
(5,2,4,"Processing ","2024-04-25",60,"nyagatare"),
(6,2,5,"Delivered","2024-06-11",30,"majerwa"),
(7,3,4,"Canceled","2024-09-29",10,"nyarugenge"),
(8,3,5,"pending","2024-11-01",12,"nyamata"),
(9,3,5,"Completed","2024-12-02",20,"musanze"),
(10,4,3,"Returned","2024-04-07",20,"kicukiro"),
(11,5,3,"Canceled","2024-07-31",11,"majerwa")
;

alter table orders add column Quantity int after Order_date;
desc orders;
-- slection
select * from CUSTOMERS;
select * from PRODUCTS;
select * from  ORDERS;
-- update tables
update CUSTOMERS set Phone_Number="0781132920" where Customer_ID=7;
update PRODUCTS set Price=45000 where product_ID=8;
update ORDERS set Order_Status="Returned" where Order_ID=11;


/* 
calculate AVG
calculate SUM
calculate COUNT
*/

SELECT avg(Price) AS AVERAGE_OF_PRICE FROM PRODUCTS WHERE Category="food";
SELECT sum(Quantity) AS SUM_OF_QUANTITY FROM PRODUCTS;
SELECT count(Order_ID) AS PENDING_ORDER FROM ORDERS WHERE Order_Status="pending";

/*
CREATION OF  VIEW
*/
-- VIEW OF food
CREATE view LISTOFFOOD AS SELECT * FROM PRODUCTS WHERE Category="food";

-- view of ordered product
CREATE VIEW LIST_OF_PRODUCT_ORDERED AS SELECT Product_Name,Category,Price FROM PRODUCTS WHERE product_ID IN (SELECT product_ID FROM ORDERS);

-- view of not ordered product
CREATE VIEW LIST_OF_PRODUCT_ORDERED_NOT_AVIALABLE AS SELECT Product_Name,Category,Price FROM PRODUCTS WHERE product_ID NOT IN (SELECT product_ID FROM ORDERS);
-- view of complete odered

CREATE view LISTOf_completed_order AS SELECT Order_Status,Order_date,Quantity,Shipping_add FROM ORDERS WHERE Order_Status="Completed";

-- VIEW OF CUSTOMERS 

CREATE view LISTOf_CUSTOMER AS SELECT F_Name,L_Name,Email,Address FROM CUSTOMERS;

-- VIEW OF Order_Status
CREATE view LIST_OF_Order_Status AS SELECT distinct Order_Status FROM ORDERS;


-- READ OF VIEWS
SELECT * FROM LISTOFFOOD;
SELECT * FROM LIST_OF_PRODUCT_ORDERED;
SELECT * FROM LIST_OF_PRODUCT_ORDERED_NOT_AVIALABLE;
SELECT * FROM LISTOf_completed_order;
SELECT * FROM LISTOf_CUSTOMER;
SELECT * FROM LIST_OF_Order_Status;

-- STORING PROCEDURE
-- INSERT STORING PROCEDURE IN CUSTOMERS
DELIMITER $$
CREATE PROCEDURE insert_into_customer (IN Customer_IDC	INT ,
	IN F_NameC	VARCHAR(100),
	IN L_NameC	VARCHAR(100),
	IN EmailC	VARCHAR(30),
	IN AddressC	VARCHAR(40)	,
	IN Phone_NumberC	VARCHAR(40)
    )
    BEGIN
    INSERT INTO CUSTOMERS VALUES(Customer_IDC,F_NameC,L_NameC,EmailC,AddressC,Phone_NumberC);
    END $$
    DELIMITER ;
    CALL insert_into_customer(9,"GAKWERE","Pazzo","G.Pazzo@eaxample.com","ngoma","072654000");

-- INSERT STORING PROCEDURE IN PRODUCT
DELIMITER $$
CREATE PROCEDURE insert_into_products(IN product_IDP	INT,
	IN Product_NameP	VARCHAR(100),
	IN CategoryP	VARCHAR(100),
	IN PriceP	INT,
	IN QuantityP	INT
    )
    BEGIN
    INSERT INTO PRODUCTS VALUES(product_IDP,Product_NameP,CategoryP,PriceP,QuantityP);
    END $$
    DELIMITER ;
    CALL insert_into_products(9,"BEANS","FOOD",1400,60000);
    
    -- UPDATE STORING PROCEDURE IN PRODUCT
DELIMITER $$
CREATE PROCEDURE UPDATE_into_products(IN QuantityP	INT,IN product_IDP	INT)
    BEGIN
    UPDATE  PRODUCTS SET Quantity=QuantityP WHERE product_ID=product_IDP;
    END $$
    DELIMITER ;
    CALL UPDATE_into_products(2000,6);

-- UPDATE STORING PROCEDURE IN CUSTOMERS
DELIMITER $$
CREATE PROCEDURE UPDATE_CUSTPMER_TABLES(IN Addres VARCHAR(40),IN Customer_IDC INT)
    BEGIN
    UPDATE  CUSTOMERS SET Address=Addres WHERE Customer_ID=Customer_IDC;
    END $$
    DELIMITER ;
    CALL UPDATE_CUSTPMER_TABLES("BURERA",1);
    
DELIMITER $$
CREATE PROCEDURE DELET_FROM_CUSTOMER(IN Customer_IDC INT)
    BEGIN
    DELETE FROM CUSTOMERS WHERE Customer_IDC=Customer_ID;
    END $$
    DELIMITER ;
    CALL DELET_FROM_CUSTOMER(8);
    
    
DELIMITER $$
CREATE PROCEDURE LISTOFSELECTION(IN Addres VARCHAR(40))
    BEGIN
    SELECT * FROM CUSTOMERS WHERE Address=Addres;
    END $$
    DELIMITER ;
    CALL LISTOFSELECTION("BURERA");
    
    /*
    TRIGGERS FOR CUSTOMERS
    */
    -- TRIGGER AFTER INSERT 
    CREATE TABLE Customer_Counters(CounterName VARCHAR(30) PRIMARY KEY, Count INT);
INSERT INTO  Customer_Counters(CounterName,Count) VALUES ('NumberOfCustomer',0);
SELECT * FROM Customer_Counters;

DELIMITER $$
CREATE TRIGGER aftercustomersinsert AFTER INSERT ON CUSTOMERS FOR EACH ROW
BEGIN 
UPDATE Counters SET Count =Count + 1 WHERE CounterName='NumberOfCustomer';
END $$
DELIMITER ;
-- TRIGGER AFTER DELETE

DELIMITER $$
CREATE TRIGGER aftercustomersdelete AFTER DELETE ON CUSTOMERS FOR EACH ROW
BEGIN 
UPDATE Counters SET Count =Count - 1 WHERE CounterName='NumberOfCustomer';
END $$
DELIMITER ;


-- TRIGGER AFTER UPDATE
DELIMITER $$
CREATE TRIGGER aftercustomersupdate AFTER UPDATE ON CUSTOMERS FOR EACH ROW
BEGIN 
UPDATE Counters SET Count =Count WHERE CounterName='NumberOfCustomer';
END $$
DELIMITER ;

/*
    TRIGGERS FOR PRODUCTS
    */
    -- TRIGGER AFTER INSERT 

CREATE TABLE Product_Counters(CounterName VARCHAR(30) PRIMARY KEY, Count INT);
INSERT INTO  Product_Counters(CounterName,Count) VALUES ('NumberOfProduct',0);
SELECT * FROM Product_Counters;


DELIMITER $$
CREATE TRIGGER afterproductsinsert AFTER INSERT ON PRODUCTS FOR EACH ROW
BEGIN 
UPDATE Counters SET Count =Count + 1 WHERE CounterName='NumberOfProduct';
END $$
DELIMITER ;


-- TRIGGER AFTER DELETE
DELIMITER $$
CREATE TRIGGER afterproductsdelete AFTER DELETE ON PRODUCTS FOR EACH ROW
BEGIN 
UPDATE Counters SET Count =Count - 1 WHERE CounterName='NumberOfProduct';
END $$
DELIMITER ;

-- TRIGGER AFTER UPDATE
DELIMITER $$
CREATE TRIGGER afterproductsupdates AFTER UPDATE ON PRODUCTS FOR EACH ROW
BEGIN 
UPDATE Counters SET Count =Count WHERE CounterName='NumberOfProduct';
END $$
DELIMITER ;



/*
    TRIGGERS FOR ORDER
    */
    -- TRIGGER AFTER INSERT 
    
CREATE TABLE Order_Counters(CounterName VARCHAR(30) PRIMARY KEY, Count INT);
INSERT INTO  Order_Counters(CounterName,Count) VALUES ('NumberOfOrder',0);
SELECT * FROM Order_Counters;

DELIMITER $$
CREATE TRIGGER afterOrdersinsert AFTER INSERT ON ORDERS FOR EACH ROW
BEGIN 
UPDATE Counters SET Count =Count + 1 WHERE CounterName='NumberOfOrder';
END $$
DELIMITER ;

-- TRIGGER AFTER DELETE

DELIMITER $$
CREATE TRIGGER afterOrdersdelete AFTER DELETE ON ORDERS FOR EACH ROW
BEGIN 
UPDATE Counters SET Count =Count - 1 WHERE CounterName='NumberOfOrder';
END $$
DELIMITER ;

-- TRIGGER AFTER UPDATE

DELIMITER $$
CREATE TRIGGER afterOrderUpdate AFTER UPDATE ON ORDERS FOR EACH ROW
BEGIN 
    UPDATE Order_Counters SET Count = Count WHERE CounterName = 'NumberOfOrder';
END $$

DELIMITER ;

-- 2309000905 BYIRINGIRO EMMANUEL