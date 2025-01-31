 TITLE E-COMMERCE WEBSITE SYSTEM 

Description:
The E-Commerce Website System is an online platform designed to facilitate the buying and selling of products over the internet. The system is built to handle various aspects of e-commerce transactions, offering an efficient and user-friendly experience for both customers and administrators.

After access the problem faced physical commercial like spent much time for going to the shop, robbers, ….,. I decide to develop an online platform help people to save their time. The platform contains an entity such as Orders, Customers, and Products to ensure the operations is doing well for shopping experience.

ERD (Entity Relationship Diagram).










LDM (Logical Data Modal).
Customers (Customer_ID, F_Name, L_Name, Email, Address, Phone_Number).
Products (Prproduct_ID, Product_Name, Category, Price, Quantity).
Orders(Order_ID, Customer_ID, Product_ID, Order_Status
, Order_date, Quantity, Shipping_add).

PDM (Physical Data Modal).













DATA DICTIONARY
ENTITIES	ATTRIBUTE	DATA TYPE	SIZE	CONSTRAINTS	DESCRIPTION


CUSTOMERS	Customer_ID	INTIGERS	11	PRIMARY KEY not null	Customers identification number
	F_Name	STRING	100	null	 First name
	L_Name	STRING	100	null	Last name
	Email	STRING	30	not null	email
	Address	STRING	40	not null	address
	Phone_Number	STRING	40	not null	Phone number


PRODUCTS	Prproduct_ID	INTIGERS	11	PRIMARY KEY not null	Product identification number
	Product_Name	STRING	100	not null	Product name
	Category	STRING	100	not null	Category
	Price	INTIGERS	11	not null	Product price
	Quantity	INTIGERS	11	not null	Product quantity



ORDERS	Order_ID	INTIGERS	11	PRIMARY KEY not null	Order identification number
	Customer_ID	INTIGERS	11	FOREIGN KEY not null	Customer identification number
	Product_ID 	INTIGERS	11	FOREIGN KEY not null	Product identification number
	Order_Status	STRING	40	not null	Order status
	Order_date	DATE	20	not null	Order date
	Quantity	INTIGERS	11	Not null	Quantity
	Shipping_add	STRING	40	not null	Shipping address
 
