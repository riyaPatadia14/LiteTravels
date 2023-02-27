CREATE DATABASE Deployment
USE Deployment
CREATE TABLE Salesmans
(
Id INT  PRIMARY KEY,
Name VARCHAR(20) NOT NULL,
City VARCHAR(20) ,
Commission NUMERIC(10,2) NOT NULL
)

SELECT  * FROM Salesmans
INSERT INTO Salesmans(Id,Name, City, Commission) VALUES
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex ','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5003,'Lauson Hen',NULL,0.12),
(5007,'Paul Adam ',	'Rome',0.13);

CREATE TABLE Customers
(
Id INT PRIMARY KEY,
CustName VARCHAR(20) NOT NULL,
City VARCHAR(20) NOT NULL,
Grade INT,
SalesmanId INT FOREIGN KEY REFERENCES Salesmans(Id)
)

INSERT INTO Customers(Id,CustName,City,Grade,SalesmanId) VALUES
(3002,	'Nick Rimando	','New York  ',100,5001),
(3005,	'Graham Zusi	','California',200,5002),
(3001,  'Brad Guzan		','London    ',NULL,5005),         
(3004,  'Fabian Johns	','Paris     ',300,5006) ,       
(3007,  'Brad Davis		','New York  ',200,5001) ,       
(3009,  'Fabian Johns	','Berlin    ',100,5003) ,    
(3008,  'Julian Green	','London    ',300,5002) ,        
(3003,  'Jozy Altidor	','Moscow    ',200,5007) ;         
                
 select  * from Customers            
             
         
CREATE TABLE Orders
(
Id INT PRIMARY KEY,
PurchaseAmount MONEY,
OrderDate DATE,
CustomersId INT FOREIGN KEY REFERENCES Customers(Id),
SalesmanId INT FOREIGN KEY REFERENCES Salesmans(Id)
)
drop table orders
INSERT INTO Orders(Id, PurchaseAmount, OrderDate, CustomersId, SalesmanId) VALUES
(70001,150.5,'10-05-2012',3005,5002),																 
(70009,270.65,'09-10-2012',3001,5005),															
(70002,65.26,'10-05-2012',  3002,5001),															
(70004,110.5,'08-17-2012',  3009,5003),															
(70007,948.5,'09-10-2012',  3005,5002),															
(70005,2400.6,'07-27-2012',  3007,5001),																
(70008,5760,'09-10-2012',  3002,5001),															
(70010,1983.43,'10-10-2012',  3004,5006),															
(70003,2480.4,'06-27-2012',  3009,5003),															
(70012,250.45,'08-27-2012',  3008,5002),															
(70011,75.29,'08-17-2012',3003,5007),															
(70013,3045.6,'04-25-2012',3002,5001);


CREATE TABLE CompanyMast
(
Id INT PRIMARY KEY,
CompanyName VARCHAR(20) 
)

INSERT INTO CompanyMast(Id, CompanyName) VALUES
(11 ,'Samsung'),
(12 ,'iBall'),
(13 ,'Epsion'),
(14 ,'Zebronics'),
(15 ,'Asus'),
(16 ,'Frontech');


CREATE TABLE ItemMast 
(
Id INT PRIMARY KEY,
ProductName VARCHAR(20),
ProductPrice MONEY,
ProductCompany INT FOREIGN KEY REFERENCES CompanyMast(Id)
)

INSERT INTO ItemMast(Id,ProductName,ProductPrice,ProductCompany) VALUES
(101 ,'Mother Board',3200,15),
(102 ,'Key Board', 450,16),
(103 ,'ZIP drive', 250,14),
(104 ,'Speaker  ', 550,16),
(105 ,'Monitor  ',5000,11),
(106 ,'DVD drive', 900,12),
(107 ,'CD drive ', 800,12),
(108 ,'Printer   ',2600,13),
(109 ,'Refill cartridge', 350,13),
(110 ,'Mouse', 250 ,12)


CREATE TABLE EmpDepartment
(
DeptCode INT PRIMARY KEY,
DeptName VARCHAR(20),
DeptAllotment BIGINT
)

INSERT INTO EmpDepartment(DeptCode, DeptName, DeptAllotment) VALUES
(57 ,'IT     ',65000),
(63 ,'Finance',15000),
(47 ,'HR	',240000),
(27 ,'RD     ',55000),
(89 ,'QC     ',75000)

select * from empdepartment
CREATE TABLE EmployeeDetails
(
Id INT PRIMARY KEY,
EmmpName VARCHAR(20),
EmpLname VARCHAR(20),
EmpDepartment INT FOREIGN KEY REFERENCES EmpDepartment(DeptCode)
)
     
INSERT INTO EmployeeDetails(Id,EmmpName,EmpLname,EmpDepartment) VALUES
   (127323,'Michale ','Robbin   ',57),
   (526689,'Carlos  ','Snares   ',63),
   (843795,'Enric   ','Dosio    ',57),
   (328717,'Jhon    ','Snares   ',63),
   (444527,'Joseph  ','Dosni    ',47),
   (659831,'Zanifer ','Emily    ',47),
   (847674,'Kuleswar','Sitaraman',57),
   (748681,'Henrey  ','Gabriel  ',47),
   (555935,'Alex    ','Manuel   ',57),
   (539569,'George  ','Mardy    ',27),
   (733843,'Mario   ','Saule    ',63),
   (631548,'Alan    ','Snappy   ',27),
   (839139,'Maria   ','Foster   ',57);   
   

 CREATE TABLE ElectroMaster
 (
 Id INT PRIMARY KEY,
 OrderId INT FOREIGN KEY REFERENCES Orders(Id),
 EmpDetailId INT FOREIGN KEY REFERENCES EmployeeDetails(Id),
 ItemMast INT FOREIGN KEY REFERENCES ItemMast(Id)
 )
  
INSERT INTO ElectroMaster(Id,OrderId,EmpDetailId,ItemMast) VALUES
(101,70003,631548,103),
(102,70005,748681,106),
(103,70009,839139,108),
(104,70001,555935,101),
(105,70007,847674,107),
(106,70002,733843,109),
(107,70004,843795,110),
(108,70008,847674,105);


 /* 1. Write a SQL statement to prepare a list with salesman name, customer name and their cities for the salesmen and customer who belongs to the same city. */

SELECT * FROM EmployeeDetails
SELECT * FROM EmpDepartment
SELECT * FROM ItemMast
SELECT * FROM CompanyMast
SELECT * FROM Orders
SELECT * FROM Customers
SELECT * FROM Salesmans


SELECT Name,CustName,c.City,s.City
FROM Salesmans AS s 
JOIN Customers AS c ON c.City = s.City


-----------------------------
/* 2. Write a SQL statement to make a list with order no, purchase amount, customer name and their cities for those orders which order amount between 500 and 2000 */

SELECT o.Id, PurchaseAmount, CustName, City
FROM Orders AS o
JOIN Customers  AS c ON c.Id =  o.CustomersId
WHERE PurchaseAmount BETWEEN 500 AND 2000

/* 3. Write a SQL statement to know which salesman are working for which customer. */

SELECT Name, CustName,s.City, c.City, Commission
FROM Salesmans AS s
JOIN Customers AS c ON c.SalesmanId = s.Id

/* 4. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission from the company is more than 12%. */

SELECT Name, CustName,s.City, c.City, Commission
FROM Salesmans AS s
JOIN Customers AS c ON c.SalesmanId = s.Id
WHERE Commission > 0.12

/* 5. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who does not live in the same city 
where their customer lives, and gets a commission is above 12% . */
SELECT Name, CustName,s.City, c.City, Commission
FROM Salesmans AS s
JOIN Customers AS c ON s.City = c.City
WHERE Commission > 0.12

/* 6. Write a SQL statement to find the details of an order i.e. order number, order date, amount of order, 
which customer gives the order and which salesman works for that customer and how much commission he gets for an order. */

SELECT o.Id, OrderDate,PurchaseAmount,Name, CustName, Commission
FROM Orders AS o
JOIN Salesmans AS s ON s.Id = o.SalesmanId
JOIN Customers AS c ON c.Id = o.CustomersId


/* 7. Write a SQL statement to make a join on the tables salesman, customer and orders in such a form that the same column of 
each table will appear once and only the relational rows will come.*/

SELECT Name,CustName,COUNT(o.SalesmanId) AS sid, COUNT(o.CustomersId) AS cid ,PurchaseAmount
FROM Salesmans AS s
JOIN Orders AS o ON o.SalesmanId = s.Id
JOIN Customers AS c ON c.SalesmanId= s.Id
GROUP BY Name,CustName,PurchaseAmount
/*
SELECT *
  FROM orders
  NATURAL JOIN customers
  NATURAL JOIN salesmans
*/

/* 8. Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own. */

	SELECT CustName,Name
	FROM Salesmans AS s
	LEFT JOIN Customers AS c ON c.SalesmanId = s.Id 
	ORDER BY SalesmanId ASC



/* 9. Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman or by own. */

SELECT CustName, Name, Grade
FROM Salesmans AS s
JOIN Customers AS c ON c.SalesmanId = s.Id
WHERE Grade < 300 
ORDER BY SalesmanId ASC

/* 10. Write a SQL statement to make a report with customer name, city, order number, order date, 
and order amount in ascending order according to the order date to find that either any of the existing customers have placed no order or placed one or more orders. */

SELECT CustName, c.City,OrderDate,PurchaseAmount
FROM Customers AS c
LEFT OUTER JOIN Orders AS o ON o.CustomersId = c.Id
ORDER BY OrderDate  ASC





/* 11. Write a SQL statement to make a report with customer name, city, order number, order date, order amount, salesman name and commission 
to find that either any of the existing customers have placed no order or placed one or more orders by their salesman or by own. */

SELECT CustName, c.City,o.Id,OrderDate, PurchaseAmount, Name, Commission
FROM Customers AS c
LEFT OUTER JOIN Orders AS o ON o.CustomersId = c.Id
LEFT OUTER JOIN Salesmans AS s ON s.Id = c.SalesmanId

/* 12. Write a SQL statement to make a list in ascending order for the salesmen who works either for one or more customer or not yet join under any of the customers. */

SELECT Name, CustName, s.City, c.City, Commission
FROM Salesmans AS s
LEFT OUTER JOIN Customers AS c ON s.Id = c.SalesmanId
ORDER BY Name ASC

/* 13. Write a SQL statement to make a list for the salesmen who works either for one or more 
customer or not yet join under any of the customers who placed either one or more orders or no order to their supplier. */

SELECT Name, CustName, Commission,o.Id
FROM Salesmans AS s
LEFT OUTER JOIN Customers AS c ON c.SalesmanId = s.Id 
LEFT OUTER JOIN Orders AS o ON o.CustomersId = c.Id

/* 14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. 
The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier. */

SELECT Name, CustName 
FROM Salesmans AS s
LEFT OUTER JOIN Customers AS c ON c.SalesmanId = s.Id
LEFT OUTER JOIN Orders AS o ON o.SalesmanId = s.Id
WHERE PurchaseAmount >= 2000
AND Grade IS NOT NULL



/* 15. Write a SQL statement to make a report with customer name, city, order no, order date, purchase amount for 
those customers from the existing list who placed one or more orders or which order(s) have been placed by the customer who is not on the list. */

SELECT CustName, c.City, OrderDate, PurchaseAmount 
FROM Orders AS o
RIGHT JOIN Customers AS c ON c.Id = o.CustomersId 

/* 16. Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for only 
those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who is neither in the list nor have a grade. */

SELECT CustName, c.City, o.Id, OrderDate, PurchaseAmount
FROM Customers AS c
FULL OUTER JOIN  Orders AS o ON o.CustomersId = c.Id
AND Grade IS NOT NULL


/* 17. Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa. */

SELECT *
FROM Salesmans AS s
CROSS JOIN Customers AS c 

/* 18. Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and 
vice versa for that customer who belongs to a city. */

SELECT *
FROM Salesmans AS s
CROSS JOIN Customers c
 WHERE s.city IS NOT NULL;


/* 19. Write a SQL statement to make a cartesian product between salesman and customer 
i.e. each salesman will appear for all customer and vice versa for those salesmen who belongs to a city and the customers who must have a grade. */

SELECT *
FROM Salesmans AS s
CROSS JOIN Customers AS c
 WHERE s.city IS NOT NULL
    AND c.grade IS NOT NULL;
/* 20. Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will 
appear for all customer and vice versa for those salesmen who must belong a city which is not the same as his customer and the customers should have an own grade. */


SELECT *
FROM Salesmans AS s
CROSS JOIN Customers c
 WHERE s.city IS NOT NULL
 AND s.city != c.city
  AND c.grade IS NOT NULL;
/* 21. Write a SQL query to display all the data from the item_mast, including all the data for each item's producer company. */

SELECT *
FROM ItemMast AS im
JOIN CompanyMast AS  cm ON cm.Id = im.ProductCompany


/* 22. Write a SQL query to display the item name, price, and company name of all the products. */

SELECT ProductPrice,ProductName,ProductCompany,CompanyName
FROM ItemMast AS im
JOIN CompanyMast AS  cm ON cm.Id = im.ProductCompany
/* 23. Write a SQL query to display the average price of items of each company, showing the name of the company. */

SELECT CompanyName,ProductName,AVG(ProductPrice) AS pp
FROM ItemMast AS im
JOIN CompanyMast AS  cm ON cm.Id = im.ProductCompany
GROUP BY CompanyName,ProductName

/* 24. Write a SQL query to display the names of the company whose products have an average price larger than or equal to Rs. 350. */


SELECT CompanyName,ProductName,ProductPrice
FROM ItemMast AS im
JOIN CompanyMast AS  cm ON cm.Id = im.ProductCompany
WHERE ProductPrice >= 350
/* 25. Write a SQL query to display the name of each company along with the ID and price for their most expensive product. */

SELECT CompanyName,ProductName,ProductPrice,ProductCompany,im.Id
FROM ItemMast AS im
JOIN CompanyMast AS  cm ON cm.Id = im.ProductCompany
AND ProductPrice =(SELECT MAX(ProductPrice)AS R FROM ItemMast AS im WHERE cm.Id = im.ProductCompany)


/* 26. Write a query in SQL to display all the data of employees including their department. */

SELECT *
FROM EmployeeDetails e
INNER JOIN EmpDepartment ed ON e.EmpDepartment = ed.DeptCode

/* 27. Write a query in SQL to display the first name and last name of each employee, along with the name and sanction amount for their department. */


SELECT EmpDepartment,EmpLname,DeptAllotment
FROM EmployeeDetails e
INNER JOIN EmpDepartment ed ON e.EmpDepartment = ed.DeptCode


/* 28. Write a query in SQL to find the first name and last name of employees working for departments with a budget more than Rs. 50000. */

SELECT EmpDepartment,EmpLname, DeptAllotment
FROM EmployeeDetails AS e
JOIN EmpDepartment  AS  ed ON ed.DeptCode = e.EmpDepartment
WHERE DeptAllotment > 50000


/* 29. Write a query in SQL to find the names of departments where more than two employees are working. */
SELECT ed.DeptName,COUNT(ed.DeptCode)
FROM EmployeeDetails e
INNER JOIN EmpDepartment ed ON e.EmpDepartment = ed.DeptCode
 GROUP BY ed.DeptName
HAVING COUNT(ed.DeptCode) > 2;
------------------
---KHATA SYSTEM--------------

CREATE DATABASE KhataSystem
--------------------------------
----- TABLE SALES---------------------

CREATE TABLE Sales
(
Id INT IDENTITY(1001,1) PRIMARY KEY,
DepartmentHead VARCHAR(30) NOT NULL,
DepartmentType NVARCHAR(MAX) NOT NULL,
ProductName NVARCHAR(MAX) NOT NULL,
ProductPrice MONEY NOT NULL,
Production DATE NOT NULL
--mm-dd-yyyy
)

SELECT * FROM Sales
DROP TABLE Sales
TRUNCATE TABLE Sales

INSERT INTO Sales(DepartmentHead, DepartmentType, ProductName, ProductPrice, Production) VALUES
('Sapan Verma','chain','Plain',20000,'11-06-2022'),
('Ankur Vyas','chain','Sakar Small Design',56000,'11-23-2022'),
('Sapan Verma','chain','Dot Design',90000,'11-01-2022'),
('Ankur Vyas','chain','Sakar Big Design', 120000,'11-23-2022'),
('Sapan Verma','chain','Ball Design',1050000,'11-01-2022'),
('Ankur Vyas','chain','Diamond Design',103000,'11-23-2022'),

('Kiran Sharma','necklace','Plain',200000,'06-02-2022'), 
('Anjana Vora','necklace','Jartar Design',2500000,'06-12-2022'), 
('Kiran Sharma','necklace','Diamond Design',3000000,'06-02-2022'), 
('Kiran Sharma','necklace','Chokar',700000,'06-12-2022'), 
('Anjana Vora','necklace','Kundan Design',600000,'06-02-2022'), 
('Anjana Vora','necklace','Flower Design',350000,'06-12-2022'),

('Avani Jain','bangles','Plain',560000,'06-06-2022'),
('Avani Jain','bangles','Flower Design',90000,'06-12-2022'), 
('Krishwa Zinzuwadiya','bangles','Kundan Design',1000000,'06-12-2022'), 
('Avani Jain','bangles','Diamond Design',102000,'06-06-2022'), 
('Krishwa Zinzuwadiya','bangles','Jartar Design',8010000,'06-26-2022'), 
('Avani Jain','bangles','Waves Design',80000,'06-16-2022'), 

('Manisha Agarwal','earrings','Bondi',60000,'06-05-2022'),
('Krupa Parmar','earrings','Plain',12000,'06-05-2022'), 
('Manisha Agarwal','earrings','Jartar Design',89000,'06-05-2022'), 
('Krupa Parmar','earrings','Diamond Design',100000,'06-05-2022'), 
('Manisha Agarwal','earrings','Flower Design',230000,'06-05-2022'), 
('Krupa Parmar','earrings','Circle Design',100000,'06-05-2022'), 

('Pranav Gupta','payal','Plain',100000,'03-08-2022'),
('Pranav Gupta','payal','Diamond Design',23000,'03-08-2022'),
('Pranav Gupta','payal','Bondi',56000,'03-08-2022'),
('Pranav Gupta','payal','Flower Design',80000,'03-08-2022'),
('Pranav Gupta','payal','Animal Design',100000,'03-08-2022'),
('Pranav Gupta','payal','Kundan Design',120000,'03-08-2022'),

('Privanshi Desai','rings','Plain',26000,'05-06-2022'),
('Shumbham Makadia','rings','Diamond Design',350000,'03-06-2022'),
('Lata Adesara','rings','Flower Design',80000,'03-06-2022'),
('Shumbham Makadia','rings','Jartar Design',960000,'03-06-2022'),
('Lata Adesara','rings','Diamond Design',130000,'03-06-2022'),
('Privanshi Desai','rings','Kundan Design',230000,'03-06-2022');

------------------------------------
------- TABLE EMPLOYEES -----------------

CREATE TABLE Employees
(
Id INT IDENTITY(501, 1) PRIMARY KEY,
EmployeeName NVARCHAR(MAX) NOT NULL,
Salary MONEY NOT NULL,
EmployeeLocation NVARCHAR(MAX) NOT NULL,
StartDate DATE NOT NULL,
DOB DATE NOT NULL,
Phone BIGINT NOT NULL,
Gender NVARCHAR(MAX) NOT NULL,
Commission  NUMERIC(12,5) NOT NULL
)
ALTER TABLE Employees
ADD SalesId INT;

ALTER TABLE Employees
ADD CONSTRAINT FK_SalesIdEmployees FOREIGN KEY(SalesId) REFERENCES Sales(Id)

ALTER TABLE Employees
ADD CustomersId INT;

ALTER TABLE Employees
ADD CONSTRAINT FK_CustomersId  FOREIGN KEY(CustomersId) REFERENCES  Customers(Id) 
SELECT * FROM Sales
SELECT * FROM Employees
DROP TABLE Employees
INSERT INTO Employees(EmployeeName,Salary,EmployeeLocation,StartDate,DOB,Phone,Gender,Commission,SalesId,CustomersId) VALUES
('Sujit Taneja',80000, 'Ahmedabad','06-25-2022', '12-14-1991',1234567892,'male',10.5,1015,10),
('Karuna Deshmukh',56000, 'Indore','07-08-2022', '08-09-1992',5248456932,'male',89.7,1030,23),
('Parita Soni',70000, 'Himmatnagar','12-09-2022', '03-02-1993',2584123650,'female',50.9,1011,20),
('Manish Patel',75000, 'Surat','12-03-2022', '06-03-1990',1234658206,'male',23.6,1002,11),
('India Gandhi',89000, 'Jamnagar','06-03-2022', '05-03-1984',9602530120,'male',78.9,1020,17),
('Hetvi Doshi',65000, 'Junagadh','06-07-2022', '07-06-1986',1010101010,'female',73.9,1029,22),
('Nishtha Shah',67000, 'Ankleshwar','06-03-2022', '03-01-1956',2123252624,'male',85.6,1016,14),
('Nimit Jain',56500, 'Bharuch','10-07-2022', '03-09-1990',3635383935,'male',65.3,1004,19),
('Kishan Soni',89000, 'Nasik','05-06-2022', '05-06-1992',1029547863,'female',20.9,1036,16),
('Akash Patel',80000, 'Indoe','06-03-2022', '03-01-1991',2036501480,'female',9.7,1010,12),
('Abhay Parmar',79000, 'Bhopal','04-06-2022', '03-07-1993',2032569810,'male',3.6,1025,15),
('Jenil Gupta',56000, 'Vadodaraa','03-08-2022', '12-06-1990',3050213602,'female',9.6,1011,13),
('Jaymin Parmar',75000, 'Rajkot','02-06-2022', '03-09-1986',1478520369,'male',5.8,1024,21),
('Dinesh Patel',80000, 'Ahmedabad','01-03-2022', '03-10-1956',0295406302,'male',12.5,1019,18);

------------------------------------------

---------------- TABLE CUSTOMERS ------------------

CREATE TABLE Customers 
(
Id INT IDENTITY(10,1) PRIMARY KEY,
CustomerName NVARCHAR(MAX) NOT NULL,
CustomerNumber BIGINT NOT NULL,
OrderDetails NVARCHAR(MAX) NOT NULL, 
OrderDate DATE NOT NULL,
DiscountPrice NUMERIC(10,3) NOT NULL
)
ALTER TABLE Customers
ADD CustomerLocation NVARCHAR(MAX);

ALTER TABLE Customers
ADD SalesId INT;
Truncate table Customers
ALTER TABLE Customers
ADD CONSTRAINT FK_SalesIdCustomers  FOREIGN KEY(SalesId) REFERENCES  Sales(Id)



INSERT INTO Customers(CustomerName, CustomerNumber, OrderDetails, OrderDate, DiscountPrice, SalesId,CustomerLocation) VALUES
('Aparna Sharma', 1234568596, 'Kundan Design-bangles', '10-06-2022', 5.10,1012, 'Ahmedabad'),
('Kiran Soni',2458965423,'Sakar Small Design-chain', '06-08-2022',12.5,1002,'Surat'),
('Anupam Mittal',2458745896,'Chokar-necklace', '07-05-2022',19.5,1010,'Varanasi'),
('Aparna Parekh',3256984512,'Kundan Design-necklace', '08-09-2022',14.5,1011,'Vadodara'),
('Leena Patel',9654785123,'Diamond Design-bangles', '10-09-2022',18.5,1012, 'Bhopal'),
('Niva Oza',3254896574,'Plain-payal', '03-24-2022',16.5,1025,'Ahmedabad'),
('Manish Manhotra',3245896745,'Kundan Design-rings','12-07-2022',16.5,1032,'Rajkot'),
('Siddhant Chaturvedi',3214569874,'Plain-earrings', '05-06-2022',17.5,1020,'Junagadh'),
('Ishan Khattar',1254638975,'Bondi-earrings', '04-02-2022',5.6,1019,'Surat'),
('Chintan Devagn',9547235891,'Sakar Big Design-chain','08-07-2022',8.9,1004,'Ahmedabad'),
('Feny Kundra',6425981257,'Kundan Design-necklace','06-03-2022',6.6,1011,'Nasik'),
('Pooja Sheth',3216580258,'Circle Design-earrings','09-07-2022',40.3,1024,'Himmatnagar'),
('Pryanshi Datani',9058060570,'Animal Design-payal','03-05-2022',23.1,1029,'Rajkot'),
('Tiam Patidar',5489615237,'Kundan Design-payal','03-09-2022',8.7,1030,'Ahmedabad');
------------------------------------

--1. From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return AgentName, cust_name and city.

-----------------------1

SELECT EmployeeLocation, CustomerName , c.CustomerLocation, EmployeeName,ProductName, DepartmentHead
FROM Employees  AS e 
JOIN Customers AS c ON c.Id =  e.CustomersId
JOIN Sales AS s ON s.Id = e.SalesId
WHERE EmployeeLocation = CustomerLocation
----------------------------------
--2. From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000


------------------------2

SELECT *
FROM  Sales AS s
WHERE 
ProductPrice  BETWEEN 12000 AND 80000
------------------------------

--3. From the following tables write a SQL query to find agents who received commissions of more than 12 percent from the company.

--------------------------------3

SELECT EmployeeName, Commission, ProductName, DepartmentHead,ProductPrice, CustomerName
FROM Employees AS e
JOIN Sales AS s ON s.Id = e.SalesId
JOIN Customers AS c ON c.Id = e.CustomersId
WHERE Commission > 12.5

-------------------------------------------

--4. Write a SQL statement to join the tables AgentName, customer and orders so that the same column of each table appears once

-------------------------4
select * from employees
select * from sales
select * from customers

SELECT s.Id, c.Id, e.Id 
FROM Employees AS e
RIGHT JOIN Customers AS c ON c.Id = e.CustomersId
LEFT JOIN Sales AS s ON s.Id = c.SalesId
WHERE s.Id = c.SalesId


SELECT s.Id, c.Id, e.Id 
FROM Employees AS e
LEFT OUTER JOIN Customers AS c ON c.Id = e.CustomersId
RIGHT OUTER JOIN Sales AS s ON s.Id = c.SalesId
WHERE s.Id = c.SalesId
---------------------------

--5. From the following tables write a SQL query to display the customer name, customer city, grade, AgentName, Agent city. The results should be sorted by ascending customer_id.

------------------------5

SELECT e.CustomersId,CustomerName, CustomerLocation, DiscountPrice, EmployeeName
FROM Employees AS e
JOIN Sales  AS s ON s.Id = e.SalesId
JOIN Customers AS c  ON c.Id = e.CustomersId
ORDER BY e.CustomersId ASC 

-------------------------
/*
6. From the following tables write a 
SQL query to find those customers with a grade less than 3. Return cust_name, customer city, grade, AgentName, AgentNamecity. 
The result should be ordered by ascending customer_id
*/
select * from employees
select * from sales
select * from customers
---------------------------6

SELECT e.CustomersId, CustomerName, CustomerLocation, DiscountPrice, EmployeeName, EmployeeLocation
FROM Employees AS e
JOIN Sales AS s ON s.Id = e.SalesId
JOIN Customers AS c ON c.Id = e.CustomersId
WHERE DiscountPrice < 13 
ORDER BY e.CustomersId ASC

-----------------------------
/*
7. Write a SQL statement to make a report with customer
name, city, order number, order date, and order amount in ascending order 
according to the order date to determine whether any of the existing customers have placed an order or not.

*/

--------------------7

SELECT CustomerName, CustomerLocation, OrderDetails,DepartmentHead, DepartmentType, ProductName, ProductPrice,Production,  OrderDate
FROM Employees AS e
JOIN Sales AS s ON s.Id = e.SalesId
JOIN Customers AS c ON c.Id = e.CustomersId
WHERE OrderDate = '12-07-2022'
ORDER BY ProductPrice ASC

------------------------
/*

8. SQL statement to generate a report with customer name, city, order number, order date, order amount, agent name, and commission 
to determine if any of the existing customers have not placed orders or if they have placed orders through their
   agent or by themselves
*/

------------8

SELECT CustomerName,EmployeeName,DepartmentHead, CustomerLocation, OrderDetails,OrderDate, ProductPrice,Commission
FROM Employees AS e
LEFT OUTER JOIN Customers AS c ON c.Id = e.CustomersId
LEFT OUTER JOIN Sales AS s ON s.Id = c.SalesId
WHERE c.SalesId = e.SalesId
---------------------
/*
9. Write a SQL statement to generate a list in ascending order of agents who work either for one or more customers or have not yet joined any of the customers.
*/
------------9
SELECT CustomerName,EmployeeName, CustomerLocation, OrderDetails,OrderDate,Commission
FROM Employees AS e
LEFT OUTER JOIN Customers AS c ON c.Id = e.CustomersId
ORDER BY EmployeeName ASC
-----------

--10.From the following tables write a SQL query to list all agents along with customer name, city, grade, order number, date, and amount.

------------10

SELECT CustomerName,EmployeeName,DepartmentHead, CustomerLocation, OrderDetails,OrderDate, ProductPrice,Commission
FROM Employees AS e
JOIN Customers AS c ON c.Id = e.CustomersId
JOIN Sales AS s ON s.Id = c.SalesId
