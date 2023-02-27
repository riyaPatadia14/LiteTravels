CREATE TABLE UserData
(
Id INT PRIMARY KEY IDENTITY,
EmpName NVARCHAR(MAX),
Position VARCHAR(20),
Location VARCHAR(40),
Age INT,
Salary VARCHAR(20)
)

DROP TABLE UserData
DROP TABLE USerSearch

CREATE TABLE UserSearch
(
Id INT PRIMARY KEY IDENTITY,
EmpName NVARCHAR(MAX),
Position VARCHAR(20),
Location VARCHAR(40),
Age INT,
Salary VARCHAR(20)
)

CREATE TYPE udt_UserData AS TABLE
(
Id INT PRIMARY KEY IDENTITY,
EmpName NVARCHAR(MAX),
Position VARCHAR(20),
Location VARCHAR(40),
Age INT,
Salary VARCHAR(20)
)

CREATE TYPE udt_UserSearch AS TABLE
(
Id INT PRIMARY KEY IDENTITY,
EmpName NVARCHAR(MAX),
Position VARCHAR(20),
Location VARCHAR(40),
Age INT,
Salary VARCHAR(20)
)
DROP TYPE udt_UserSearch
DROP TYPE udt_UserData

CREATE PROCEDURE sp_User
(
@UserData udt_UserData READONLY,
@UserSearch udt_UserSearch READONLY
)
AS
BEGIN
	MERGE UserData AS ud
	USING UserSearch AS us
	ON (us.Id = ud.Id)
	WHEN MATCHED THEN
	UPDATE SET 
	ud.EmpName = us.EmpName,
	ud.Position = us.Position,
	ud.Location = us.Location ,
	ud.Age = us.Age ,
	ud.Salary = us.Salary

	WHEN NOT MATCHED BY TARGET 
    THEN INSERT (EmpName, Position,Location,Age,Salary)
         VALUES (us.EmpName,us.Position,us.Location,us.Age, us.Salary)
	WHEN NOT MATCHED BY SOURCE THEN
	DELETE; 
END

EXECUTE sp_User

DROP PROCEDURE sp_User
BULK INSERT UserData
FROM 'C:\Users\SIXSIGMA\Documents\SQL Server Management Studio\UserData.txt'
WITH
(
ROWTERMINATOR = '\n',
FIELDTERMINATOR = ','
)
TRUNCATE TABLE UserSearch
SELECT * FROM UserData
SELECT * FROM UserSearch
BULK INSERT UserSearch
FROM 'C:\Users\SIXSIGMA\Documents\SQL Server Management Studio\UserSearch.xlsx'
WITH
(
ROWTERMINATOR = '\n',
FIELDTERMINATOR = ','
)

---------------------------------
BULK INSERT Employees
FROM 'C:\Users\SIXSIGMA\Documents\SQL Server Management Studio\employ.csv'
WITH 
(
ROWTERMINATOR = '\n',
FIELDTERMINATOR = ','
--FIRSTROW = 4,
--ROWS_PER_BATCH = 10000,
--TABLOCK
)
SELECT * FROM Employees
TRUNCATE TABLE Employees

BULK INSERT Employees
FROM '‪C:\Users\SIXSIGMA\Documents\SQL Server Management Studio\Let.txt'
WITH 
(
ROWTERMINATOR = '\n',
FIELDTERMINATOR = ',',
FIRSTROW = 4,
ROWS_PER_BATCH = 10000,
TABLOCK
)
SELECT * FROM Employees

---------------------------------
CREATE TABLE Register
(
Id INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(40) NOT NULL,
Gender VARCHAR(20) NOT NULL
)
ALTER TABLE  Register
ADD PhoneNo BIGINT

BULK INSERT Register
FROM 'C:\Users\SIXSIGMA\Documents\SQL Server Management Studio\reg1.txt'
WITH
(
ROWTERMINATOR = '\n',
FIELDTERMINATOR = ',',
FIRSTROW = 1
)

SELECT * FROM Register

DROP TABLE Register


------bulk insert -----

BULK INSERT Employees
FROM 'C:\Users\SIXSIGMA\Documents\SQL Server Management Studio\employ.csv'
WITH 
(
ROWTERMINATOR = '\n',
FIELDTERMINATOR = ','
--FIRSTROW = 4,
--ROWS_PER_BATCH = 10000,
--TABLOCK
)
SELECT * FROM Employees
TRUNCATE TABLE Employees

BULK INSERT Employees
FROM '‪C:\Users\SIXSIGMA\Documents\SQL Server Management Studio\Let.txt'
WITH 
(
ROWTERMINATOR = '\n',
FIELDTERMINATOR = ',',
FIRSTROW = 4,
ROWS_PER_BATCH = 10000,
TABLOCK
)
SELECT * FROM Employees
-------------SCHEMA----------
CREATE SCHEMA CUSTOMER_SERVICE

SELECT
s.name AS Schema_Name,
u.name AS Schema_Owner
FROM sys.schemas AS s
JOIN sys.sysusers u ON u.uid = s.principal_id
ORDER BY s.name

CREATE  TABLE CUSTOMER_SERVICE.JOBS
(
ID INT PRIMARY KEY IDENTITY,
NAME NVARCHAR(MAX),
EMAIL VARCHAR(40),
PASSWORD NVARCHAR(MAX)
)

CREATE TABLE dbo.offices
(
    office_id      INT
    PRIMARY KEY IDENTITY, 
    office_name    NVARCHAR(40) NOT NULL, 
    office_address NVARCHAR(255) NOT NULL, 
    phone          VARCHAR(20),
);
INSERT INTO 
    dbo.offices(office_name, office_address)
VALUES
    ('Silicon Valley','400 North 1st Street, San Jose, CA 95130'),
    ('Sacramento','1070 River Dr., Sacramento, CA 95820');

CREATE PROC usp_get_office_by_id(
    @id INT
) AS
BEGIN
    SELECT 
        * 
    FROM 
        dbo.offices
    WHERE 
        office_id = @id;
END;

ALTER SCHEMA sales TRANSFER OBJECT::dbo.office

ALTER SCHEMA sales TRANSFER OBJECT::dbo.offices;  

CREATE SCHEMA sales

ALTER PROC usp_get_office_by_id(
    @id INT
) AS
BEGIN
    SELECT 
        * 
    FROM 
        sales.offices
    WHERE 
        office_id = @id;
END;

DROP SCHEMA CUSTOMER_SERVICE

There is already an object named 'usp_get_office_by_id' in the database.
drop schema 'CUSTOMER_SERVICE' because it is being referenced by object 'BHAILAL'.


DROP SCHEMA IF EXISTS offices

select nullif(10,10) result

select nullif('hell','hello') result
SELECT    
Id,Price,PersonId
FROM    
    VisitPlaces
WHERE 
    NULLIF(PersonId,'') IS NULL;
	select * from VisitPlaces

	DECLARE @A int = 10, @b inT = 20
	SELECT
	CASE 
	WHEN @a = @b Then NULL
	ELSE @a end as RESULT

	SELECT    
    CASE order_status
        WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Processing'
        WHEN 3 THEN 'Rejected'
        WHEN 4 THEN 'Completed'
    END AS order_status, 
    COUNT(Id) order_count
FROM    
   RentVehicles
WHERE 
    YEAR(Date) = 2022
GROUP BY 
    order_status;


-----------TVP, UDT----------------

DROP TABLE #lesson
CREATE TABLE #Lesson
(
Id INT PRIMARY KEY,
Name VARCHAR(20)
)
TRUNCATE TABLE #Lesson
SELECT * FROM #Lesson
INSERT INTO #Lesson(Name) VALUES
('economics'),('english'),('hindi'),('gujarati'),('social science'),('math'),('science')

CREATE PROCEDURE sp_InsertLesson
@PerLessonType udt_#Lesson READONLY
AS
BEGIN
	INSERT INTO #Lesson
	SELECT * FROM @PerLessonType
END

DECLARE @PerLessonType udt_#Lesson

INSERT INTO @PerLessonType
VALUES(1,'economics')
,(2,'english'),(3,'hindi'),(4,'gujarati'),(5,'social science'),(6,'math'),(7,'science')
EXECUTE sp_InsertLesson @PerLessonType


CREATE TYPE udt_#Lesson AS TABLE
(
	Id INT PRIMARY KEY,
	Name VARCHAR(20)
)

SELECT * FROM #Lesson


CREATE TABLE #Schools
(
Id INT,
SchoolName VARCHAR(20)
)

CREATE TABLE #Department
(
Id INT,
DepartName VARCHAR(20)
)
SELECT * FROM #Student
CREATE TABLE #Student 
(
Id INT,
Name VARCHAR(20),
Department VARCHAR(30),
faculty VARCHAR(20),
school VARCHAR(30)
)

CREATE TYPE udt_#Schools AS TABLE
(
Id INT,
SchoolName VARCHAR(20)
)

CREATE TYPE udt_#Department AS TABLE
(
Id INT,
DepartName VARCHAR(20)
)
CREATE TYPE udt_#Student AS TABLE
(
Id INT,
Name VARCHAR(20),
Department VARCHAR(30),
faculty VARCHAR(20),
school VARCHAR(30)
)

ALTER PROCEDURE sp_differenttables
					@Schools udt_#Schools READONLY,
					@Departments udt_#Department READONLY,
					@Students udt_#Student READONLY
AS
BEGIN
		INSERT INTO #Schools
		SELECT * FROM @Schools

		
		INSERT INTO #Department
		SELECT * FROM @Departments

	
		INSERT INTO #Student
		SELECT * FROM @Students
END

DECLARE @Schools udt_#Schools, @Departments udt_#Department, @Students udt_#Student

INSERT INTO @Schools VALUES(1,'Saint Zaviers'),(2,'Massom'),(3,'North Star'),(4,'Saint Marry'),(5,'Nirmal'),(6,'PM modi'),(7,'Dholakiya')
INSERT INTO @Departments VALUES(1,'science'),(2,'math'),(3,'social science'),(4,'english')
INSERT INTO @Students VALUES
(1,'jay','science','abc','nirmala'),
(2,'abhishek','math','xyz','saint marry'),
(3,'lara','social science','qrs','nort star')

EXECUTE sp_differenttables @Schools,@Departments,@Students

SELECT * FROM #Schools
SELECT * FROM #Department
SELECT * FROM #Student

-------------------------------------
CREATE TABLE #category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    amount DECIMAL(10 , 2 )
);

INSERT INTO #category(category_id, category_name, amount)
VALUES
(1,'Children Bicycles',15000),
(2,'Comfort Bicycles',25000),
(3,'Cruisers Bicycles',13000),
(4,'Cyclocross Bicycles',10000);


CREATE TABLE #category_staging (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    amount DECIMAL(10 , 2 )
);


INSERT INTO #category_staging(category_id, category_name, amount)
VALUES
(1,'Children Bicycles',15000),
(3,'Cruisers Bicycles',13000),
(4,'Cyclocross Bicycles',20000),
(5,'Electric Bikes',10000),
(6,'Mountain Bikes',10000);

SELECT * FROM #category
SELECT * FROM #category_staging

MERGE #category AS c
USING #category_staging AS cs
ON (c.category_id = cs.category_id)
WHEN MATCHED 
	THEN UPDATE SET
	c.category_name = cs.category_name,
	c.amount = cs.amount
WHEN NOT MATCHED BY TARGET
	THEN INSERT(category_id,category_name,amount)
	VALUES(cs.category_id,cs.category_name,cs.amount)
WHEN NOT MATCHED BY SOURCE
	THEN DELETE;


CREATE TABLE #Product
(
Product_Id INT PRIMARY KEY,
Product_Name VARCHAR(20),
Amount MONEY,
Stock INT
)

CREATE TABLE #Product_Stock
(
Product_Id INT PRIMARY KEY,
Product_Name VARCHAR(20),
Amount MONEY,
Stock INT
)

INSERT INTO #Product(Product_Id,Product_Name,Amount,Stock) VALUES(1,'keyboard',1200,6)
INSERT INTO #Product(Product_Id,Product_Name,Amount,Stock) VALUES(2,'mouse',750,8)
INSERT INTO #Product(Product_Id,Product_Name,Amount,Stock) VALUES(3,'monitor',15000,10)
INSERT INTO #Product(Product_Id,Product_Name,Amount,Stock) VALUES(4,'cpu',10000,12)
INSERT INTO #Product(Product_Id,Product_Name,Amount,Stock) VALUES(5,'ram',2500,20)
INSERT INTO #Product(Product_Id,Product_Name,Amount,Stock) VALUES(6,'hard disk',5000,15)
INSERT INTO #Product(Product_Id,Product_Name,Amount,Stock) VALUES(7,'wire',1500,6)

SELECT * FROM #Product

INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(1,'keyboard',1200,6)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(3,'mouse',900,7)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(4,'hard disk',5000,20)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(5,'monitor',15000,8)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(6,'cpu',8000,12)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(8,'drive',6000,50)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(9,'ssd',5000,100)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(10,'wire',600,90)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(11,'connector',400,9)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(12,'fan',800,15)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(13,'pad',50,13)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(14,'ear phone',200,200)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(15,'head phone',1000,600)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(16,'board',800,60)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(17,'disk',500,70)
INSERT INTO #Product_Stock(Product_Id,Product_Name,Amount,Stock) VALUES(18,'mother board',1500,1000)

SELECT * FROM #Product
SELECT * FROM #Product_Stock

MERGE #Product AS p
USING #Product_Stock AS ps
	ON(p.Product_Id = ps.Product_Id)
WHEN MATCHED 
	THEN UPDATE SET
	p.Product_Name = ps.Product_Name,
	p.Amount= ps.Amount,
	p.Stock = ps.Stock
WHEN NOT MATCHED BY TARGET
	THEN INSERT(Product_Id,Product_Name,Amount,Stock)
	VALUES(ps.Product_Id,ps.Product_Name,ps.Amount,ps.Stock)
WHEN NOT MATCHED BY SOURCE
	THEN DELETE;



