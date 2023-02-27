USE LiteTravels

CREATE TRIGGER tr_Rollbacktransaction
ON Registrations
FOR INSERT 
AS
BEGIN
PRINT 'you cannot perform insert operation'
ROLLBACK TRANSACTION
END

INSERT INTO Registrations(Name,Email) VALUES ('Priya Sharma','priyasharma@gmail.com')

DROP TRIGGER tr_Rollbacktransaction

-------------
CREATE TABLE Audit_data
(
Id INT IDENTITY,
Audit_Action TEXT
)


CREATE OR ALTER TRIGGER tr_InserData_RentVehicles
ON RentVehicles
FOR INSERT , UPDATE, DELETE
AS
BEGIN
		DECLARE @Id INT;

		SELECT @Id = Id FROM inserted
		SELECT @Id = Id FROM deleted
		--INSERT INTO Audit_data VALUES('INSERT id = ' + CAST(@Id AS varchar(10)) + ' is insert at ' + CAST(GETDATE() AS varchar(20)))
		--INSERT INTO Audit_data VALUES('DELETE id = ' + CAST(@Id AS varchar(10)) + ' is DELETE at ' + CAST(GETDATE() AS varchar(20)))
		--INSERT INTO Audit_data VALUES('UPDATE id = ' + CAST(@Id AS varchar(10)) + ' is UPDATE at ' + CAST(GETDATE() AS varchar(20)))
END

SELECT * FROM Audit_data
SELECT * FROM RentVehicles
INSERT INTO RentVehicles(VehicleType,VehicleModel,VehicleNumber,PersonNumber,PeriodTimeIn,PeriodTimeOut,Price,Date,VehicleLocation,PersonId) 
VALUES ('Car','Jazz','AN8 lm 4587','8965475216','06:23','09:00',18000,'2022-11-06',12,6)

DELETE FROM RentVehicles WHERE Id = 23 
INSERT INTO RentVehicles(VehicleType,VehicleModel,VehicleNumber,PersonNumber,PeriodTimeIn,PeriodTimeOut,Price,Date,VehicleLocation,PersonId) 
VALUES ('Bike','KTM','kl2 ni 3671','62589145237','07:30','01:00',2000,'2022-03-13',3,25)

DROP TRIGGER tr_InserData_RentVehicles

-------

CREATE TABLE RentVehicles_Audit(
    Id INT IDENTITY PRIMARY KEY,
    VehicleType NVARCHAR(MAX) NOT NULL,
    VehicleModel NVARCHAR(MAX) NOT NULL,
    VehicleNumber NVARCHAR(MAX) NOT NULL,
    PersonNumber NVARCHAR(MAX) NOT NULL,
    PeriodTimeIn TIME NOT NULL,
    PeriodTimeOut TIME NOT NULL,
	Date DATE NOT NULL,
	VehicleLocation INT NOT NULL,
	PersonId INT NOT NULL,
    updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    CHECK(operation = 'INS' or operation='DEL')
);


CREATE OR ALTER TRIGGER tr_RentVehicles_data
ON RentVehicles
AFTER INSERT, DELETE
AS
BEGIN
SET NOCOUNT ON
	INSERT INTO RentVehicles_Audit 
	( VehicleType,VehicleModel, VehicleNumber,PersonNumber,PeriodTimeIn,PeriodTimeOut,Date,VehicleLocation,PersonId,updated_at,operation)
	SELECT
	 i.VehicleType,VehicleModel, VehicleNumber,PersonNumber,PeriodTimeIn,PeriodTimeOut,Date,VehicleLocation,i.PersonId,GETDATE(),'INS'
	 FROM inserted AS i
	 UNION ALL
	 SELECT
	 d.VehicleType,VehicleModel, VehicleNumber,PersonNumber,PeriodTimeIn,PeriodTimeOut,Date,VehicleLocation,d.PersonId,GETDATE(),'DEL'
	 FROM deleted AS d
END

INSERT INTO RentVehicles
(VehicleType,VehicleModel, VehicleNumber,PersonNumber,PeriodTimeIn,PeriodTimeOut,Date,VehicleLocation,PersonId) 
VALUES('Scooter','Jupiter','DL sd 1268',7458125694,'10:00','08:30','2022-08-31',6,3)

SELECT * FROM RentVehicles_Audit
TRUNCATE TABLE RentVehicles_Audit
DELETE FROM RentVehicles WHERE VehicleNumber = 'DL sd 1268'
--------
select * from RentVehicles
CREATE TABLE TransportMediums_Audit
(
	Id INT IDENTITY,
	Source NVARCHAR(MAX) NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	Destination NVARCHAR(MAX) NOT NULL,
	Price MONEY NOT NULL,
	PersonId INT NOT NULL,
	TransportWays INT NOT NULL,
	updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    CHECK(operation = 'INS' or operation='DEL')
)
select * from TransportMediums_Audit

CREATE OR ALTER TRIGGER tr_TransportMediums
ON TransportMediums
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
SET NOCOUNT ON
SELECT * FROM inserted
SELECT * FROM deleted
INSERT INTO TransportMediums_Audit 
	(Source,StartDate,EndDate,Destination, Price,PersonId,TransportWays,updated_at,operation)
	SELECT
	 i.Source,StartDate,EndDate,Destination,Price,PersonId,i.TransportWay,GETDATE(),'INS'
	 FROM inserted AS i
	 UNION ALL
	 SELECT
	 d.Source,StartDate, EndDate, Destination, Price, PersonId,d.TransportWay,GETDATE(),'DEL'
	 FROM deleted AS d
END
select * from TransportMediums_Audit
INSERT INTO TransportMediums(Source,StartDate,EndDate,Destination,Price,PersonId,TransportWay) VALUES
('Ladakh','2022-06-09','2022-06-11','Delhi',6500,9,20)

DELETE FROM TransportMediums WHERE Id = 3

UPDATE TransportMediums SET Destination='Mumbai' WHERE Id = 21

SELECT * FROM TransportMediums
UPDATE TransportMediums SET Destination='delhi' WHERE Id = 2

-------------------------------------

CREATE VIEW vw_Flights
AS
	SELECT FlightName,'Approved' approval_status FROM Flights
UNION 
	SELECT FlightName,'Pending_Approved' approval_status FROM Flights_approval

CREATE TABLE Flights_approval
(
	Id INT IDENTITY PRIMARY KEY,
	FlightName NVARCHAR(MAX) NOT NULL
)
DROP TRIGGER tr_Flights

CREATE TRIGGER tr_Flights 
ON vw_Flights
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Flights_approval
	(
		FlightName
	)
	SELECT i.FlightName FROM inserted AS i
	WHERE i.FlightName NOT IN
	(
	SELECT FlightName FROM Flights)
END

INSERT INTO vw_Flights(FlightName) VALUES('Qatar')

SELECT FlightName,approval_status FROM vw_Flights

select * from Flights_approval

---------------------

CREATE VIEW vw_Hotels
AS
	SELECT HotelName, 'Approved Status' approval_status FROM Hotels 
UNION
	SELECT HotelName, 'Approval Status Pending' FROM Hotel_approval

CREATE TABLE Hotel_approval
(
Id INT PRIMARY KEY IDENTITY,
HotelName NVARCHAR(MAX) NOT NULL
)

CREATE TRIGGER tr_Hotel
ON vw_Hotels
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO Hotel_approval
	(
		HotelName
	)
	SELECT i.HotelName FROM inserted AS i
	WHERE i.HotelName NOT IN
	(
		SELECT HotelName FROM Hotels
	)

END

INSERT INTO vw_Hotels(HotelName) VALUES('zimba')
SELECT HotelName,approval_status FROM vw_Hotels


------

CREATE TRIGGER tr_RentVehicles_error
ON RentVehicles
FOR INSERT,UPDATE,DELETE
AS
BEGIN
	PRINT 'Cant perform operation'
END

ALTER TRIGGER tr_RentVehicles_error
ON RentVehicles
FOR INSERT
AS
BEGIN
	DECLARE @VehicleType VARCHAR(40)
	SELECT @VehicleType=VehicleType  FROM inserted
	--IF DATEPART(HH,GETDATE()) = '2022-10-06'
	IF(@VehicleType = 'Cycle') OR (@VehicleType = 'Scooter')
	BEGIN
		PRINT 'cant Show operation'
		ROLLBACK TRANSACTION
	END
END
INSERT INTO RentVehicles
(VehicleType, VehicleModel, VehicleNumber, PersonNumber, PeriodTimeIn, PeriodTimeOut, Price, VehicleLocation, Date, PersonId) VALUES
('Cycle', 'normal', 'GJ12 AB 1245', '12456897', '08:00', '08:15', '12000', 1, '2022-10-27', 4)
-----------------
----------------
CREATE TABLE Registrations_Audit
(
Id INT IDENTITY,
Audit_data TEXT
)
DROP TABLE Registrations_Audit

ALTER TRIGGER tr_Registration_i
ON Registrations
FOR INSERT
AS
BEGIN
	DECLARE @Id INT
	SELECT @Id = Id FROM inserted
	INSERT INTO Registrations_Audit VALUES('INSERT id = ' + CAST(@Id AS varchar(10)) + ' is insert at ' + CAST(GETDATE() AS varchar(20)))
END
SELECT * FROM Registrations_Audit
INSERT INTO Registrations(Name,Email) VALUES('Sumi Patel','sumipatel@gmail.com')
---------------
select * from Registrations

CREATE TRIGGER tr_RentVehicles_1
ON RentVehicles
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	SELECT * FROM inserted
	SELECT * FROM deleted
END

UPDATE RentVehicles SET VehicleModel='Jupiter' WHERE Id = 2
SELECT * FROM RentVehicles
INSERT INTO RentVehicles
(VehicleType,VehicleModel,VehicleNumber,PersonNumber,PeriodTimeIn,PeriodTimeOut,Price,Date,VehicleLocation,PersonId)
VALUES
('Car','Alto','LH01 hj 2689',4821597623, '08:03', '10:05','2500','2022-03-09',6,8)
---------
CREATE TABLE Place_Audit
(
Id INT IDENTITY,
Audit_data TEXT
)
ALTER TRIGGER tr_Place_data
ON Places
FOR INSERT
AS
BEGIN
	DECLARE @Id INT
	SELECT @Id = Id FROM inserted
	INSERT INTO Place_Audit VALUES('INSERT id = ' + CAST(@Id AS varchar(10)) + ' is insert at ' + CAST(GETDATE() AS varchar(20)))
END
SELECT * FROM Place_Audit
select * from Places
DELETE FROM Places  WHERE Id = 58
INSERT INTO Places(PlaceName,Placelocation)VALUES('Gandhi Muesum','Rajkot')
SELECT * FROM  Place_Audit

-------
ALTER TRIGGER tr_Hotels_trans
ON Hotels
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
	DECLARE @Rooms VARCHAR(20)
	SELECT @Rooms = Rooms FROM inserted
	IF(@Rooms = 'luxury')
	BEGIN
		PRINT 'TERMINATE OPERATION'
		ROLLBACK TRANSACTION
	END
END
--UPDATE Hotels SET 
INSERT INTO Hotels(HotelName,CheckIn,CheckOut,PriceWithFood,PriceWithoutFood,Rooms,Date,VehicleLocation,PersonId) 
VALUES('Hypnos','2022-10-07','2022-10-09',8000,3000,'luxury','2022-10-07',8,9)
-------
ALTER VIEW vw_place_visit_1
AS
SELECT p.PlaceName,p.Placelocation,vp.GuidesId,vp.PersonId,vp.Price FROM Places AS p
JOIN VisitPlaces AS vp ON vp.PlacesId = p.Id

UPDATE vw_place_visit_1 SET PlaceName = 'dfhdhfj' WHERE PersonId =13
SELECT * FROM vw_place_visit_1
CREATE TABLE VisitPlaces_1_data
(
Id INT IDENTITY,
Audit_data TEXT
)

ALTER TRIGGER tr_Visitplaces_places
ON vw_place_visit_1
INSTEAD OF INSERT,UPDATE,DELETE
AS
BEGIN
	DECLARE @PersonId INT
	SELECT @PersonId = PersonId FROM inserted
	IF(@PersonId IS NULL)
	BEGIN
		PRINT 'TERMINATE OPERATION'
		ROLLBACK TRANSACTION
	END
--INSERT INTO Visitplaces_1_places VALUES('INSERT id = ' + CAST(@PersonId AS varchar(10)) + ' is insert at ' + CAST(GETDATE() AS varchar(20)))
END
UPDATE vw_place_visit_1 SET PlaceName= 'Dashashwamedh Ghat'  WHERE GuidesId = 2

SELECT * FROM vw_place_visit_1
SELECT * FROM Places
------
INSERT INTO Registrations(Name,Email) VALUES('Balram Vishwanathan','balramvishwanathan@gmail.com')

SELECT * FROM Registrations_Audit

CREATE TRIGGER tr_Hotel_Price
ON DATABASE
FOR ALTER_TABLE
AS
BEGIN
	ALTER TABLE Hotels
	ADD CONSTRAINT CHK_PriceWithFoodHotels CHECK (PriceWithFood >= 6000 AND PriceWithFood <= 15000)
END 

ALTER TRIGGER tr_Hotels_1
ON Hotels
AFTER INSERT
AS
BEGIN
	IF EXISTS (SELECT 1
            FROM inserted i
               WHERE PriceWithFood < 6000 
                  OR PriceWithFood > 15000)
        THROW 98765, N'The Trigger check  ''HJ''', 16;
	
END 


SELECT * FROM Hotels
INSERT INTO Hotels(HotelName,CheckIn,CheckOut,PriceWithFood,PriceWithoutFood,Rooms,Date,VehicleLocation,PersonId)
VALUES('Sanidhya','2022-10-12 12:00','2022-10-14 10:08',1000,4000,'normal','2022-10-12',6,3)
/*
   IF EXISTS (SELECT 1
               FROM inserted i
               WHERE order_limits < 1 
                  OR order_limits > 10)
        THROW 98765, N'The Trigger check Chktrg_OrderRange on the table ''dbo.YourTable'' failed. The column ''order_limits'' must be more than or equal to one and less than or equal to 10.', 16;
END;
*/
-----
ALTER VIEW vw_Rent_Vehicles_Hotels
AS 
SELECT	rv.Id AS RentVehicle_ID,h.Id AS Hotel_ID,HotelName,Rooms,CheckIn,CheckOut,PriceWithFood,PriceWithoutFood,h.PersonId,
		VehicleType,VehicleModel,VehicleNumber,PersonNumber,PeriodTimeIn,PeriodTimeOut,Price,h.Date
		FROM RentVehicles AS rv
		JOIN Hotels AS h ON rv.PersonId = h.PersonId

select * from Hotels
SELECT * FROM vw_Rent_Vehicles_Hotels

UPDATE vw_Rent_Vehicles_Hotels SET HotelName = 'malibu' WHERE Hotel_ID = 18
UPDATE vw_Rent_Vehicles_Hotels SET HotelName = 'Breeze Blows',VehicleModel = 'Artiga' WHERE PersonId = 20
DROP TRIGGER tr_Rent_vehicles_Hotels
ALTER TRIGGER tr_Rent_vehicles_Hotels
ON vw_Rent_Vehicles_Hotels
INSTEAD OF UPDATE
AS 
BEGIN
	IF(UPDATE(Hotel_ID))
	BEGIN
		RAISERROR ('id cant be changed',16,1) 
		RETURN
	
		IF(UPDATE(HotelName))
		BEGIN
			DECLARE @Hotel_ID INT 
			SELECT @Hotel_ID = Id FROM Hotels AS h
			JOIN inserted AS i ON h.HotelName = i.HotelName
		END
		UPDATE Hotels SET @Hotel_ID = Id
		FROM inserted AS i
		JOIN Hotels AS h ON h.Id  = i.Hotel_ID 
	END
	IF(@Hotel_ID IS NULL)
	BEGIN 
		RAISERROR ('invalid hotelname', 16,1)
		RETURN 
	END
		UPDATE Hotels SET @Hotel_ID = Id
		FROM inserted AS i
		JOIN Hotels AS h ON h.Id  = i.Hotel_ID 
END

UPDATE vw_Rent_Vehicles_Hotels SET  HotelName = 'malibu' WHERE Hotel_ID = 18
USE master

use litetravels
CREATE LOGIN Temp_test WITH PASSWORD = N'3KHJ6dhx(0xVYsdf' MUST_CHANGE,
	CHECK_EXPIRATION = ON;
GO
GRANT VIEW SERVER STATE TO Temp_test;
GO
CREATE TRIGGER connection_limit_trigger
ON ALL SERVER WITH EXECUTE AS N'Temp_test'
FOR LOGON 
AS
BEGIN
IF ORIGINAL_LOGIN() = N'Temp_test' AND 
(SELECT COUNT(*) FROM  sys.dm_exec_sessions
	WHERE is_user_process = 1 AND
		original_login_name = N'Temp_test') > 3
ROLLBACK;
END

DROP TRIGGER connection_limit_trigger ON ALL SERVER
DISABLE TRIGGER connection_limit_trigger ON ALL SERVER
----------------------------------------------------------------


USE [LiteTravels]
GO
/****** Object:  Trigger [dbo].[tr_Registration_i]    Script Date: 24-11-2022 1.31.28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[tr_Registration_i]
ON [dbo].[Registrations]
FOR INSERT
AS
BEGIN
	DECLARE @Id INT
	SELECT @Id = Id FROM inserted
	INSERT INTO Registrations_Audit VALUES('INSERT id = ' + CAST(@Id AS varchar(10)) + ' is insert at ' + CAST(GETDATE() AS varchar(20)))
END

SELECT 
    definition   
FROM 
    sys.sql_modules  
WHERE 
    object_id = OBJECT_ID('dbo.tr_Registration_i'); 


SELECT 
		OBJECT_DEFINITION(
		OBJECT_ID(
		'dbo.tr_Registration_i'))
		AS trigger_definition

EXECUTE sp_helptext 'dbo.tr_Registration_i'

SELECT name, is_instead_of_trigger
FROM sys.triggers WHERE type = 'TR'

DROP TRIGGER IF EXISTS tr_RentVehicles_error

--------------------------------------------
CREATE TABLE index_logs
(
log_id INT IDENTITY PRIMARY KEY,
event_data XML NOT NULL,
changed_by SYSNAME NOT NULL
)

CREATE TRIGGER tr_index_changes
ON DATABASE 
FOR 
CREATE_INDEX,
ALTER_INDEX,
DROP_INDEX
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO index_logs(event_data, changed_by) VALUES
	(EVENTDATA(), USER)
END

CREATE NONCLUSTERED INDEX nidx_Name
ON Registrations(Name)
CREATE NONCLUSTERED INDEX nidx_Email
ON Registrations(Email)
SELECT * FROM Registrations;

CREATE TABLE login
(
Id INT ,
Name VARCHAR(20),
Email VARCHAR(40)
)
drop table login
INSERT INTO login SELECT Id, Name,Email FROM Registrations

SELECT * FROM login

CREATE NONCLUSTERED INDEX nix_Name_Email
ON login(Name)
INCLUDE(Email)

CREATE TABLE Hotals
(
Id INT ,
HotelName VARCHAR(40),
Rooms VARCHAR(40),
PriceWithFood MONEY
)
INSERT INTO Hotals SELECT Id,HotelName,Rooms,PriceWithFood FROM Hotels
DROP TABLE Hotals

CREATE NONCLUSTERED INDEX nix_Name_R3
ON Hotals(HotelName)
INCLUDE (PriceWithFood)


SELECT * FROM Hotals

DISABLE TRIGGER tr_TransportMediums
ON TransportMediums

ENABLE TRIGGER tr_TransportMediums
ON TransportMediums

DISABLE TRIGGER ALL ON DATABASE

ENABLE TRIGGER ALL ON DATABASE

select * from RentVehicles_Audit


CREATE TABLE TEST2
(Id INT )

SELECT * FROM TEST2

INSERT INTO TEST2 VALUES
(2),(3),(1),(4),(6),(7),(5),(8),(9)

CREATE TRIGGER PrevantCreateTable
ON DATABASE	
FOR DDL_TABLE_EVENTS
AS
BEGIN
PRINT 'YOU CANNOT CREATE , DROP OR ALTER TABLE IN THIS DATABASE '
ROLLBACK TRANSACTION
END;

CREATE TABLE TEST1
(Id INT )

DROP TABLE TEST2 

DISABLE TRIGGER ALL ON DATABASE
DROP TRIGGER PrevantCreateTable ON ALL DATABASE
ALTER TABLE TEST2
ADD Name NVARCHAR(MAX)
----------------------------------------------------------------------------


USE Market

CREATE DATABASE Market

CREATE TABLE Employee
(
Id INT PRIMARY KEY,
Name VARCHAR(50),
Salary INT,
Gender VARCHAR(12),
DepartmentId INT
)
select * from Employee
--DROP TABLE Employee
INSERT INTO Employee(Id, Name, Salary,Gender, DepartmentId) VALUES
--(1,'Angel',25000,'FEMALE',2),
(2,'Amelie', 52000, 'Female', 2),  
(3,'Antonio', 25000, 'male', 1),  
(4,'Marco', 47000, 'Male', 2),  
(5,'Eliana', 46000, 'Female', 3), 
(6,'Steffan', 82000, 'Male', 3)

CREATE TABLE Employee_Audit_Test
(
Id INT IDENTITY,
Audit_Action TEXT
)

CREATE  TRIGGER tr_InsertEployee
ON Employee
FOR INSERT
AS BEGIN
	DECLARE @Id INT
	SELECT @Id = Id FROM inserted
	INSERT INTO Employee_Audit_Test 
	VALUES('Insert Id = '+ CAST(@Id AS VARCHAR(10)) + ' is added at ' + CAST(GETDATE() AS VARCHAR(22)))
END
INSERT INTO Employee VALUES(8,'Sudha',60000,'female',1)
SELECT * FROM Employee_Audit_Test

CREATE OR ALTER TRIGGER tr_DeleteEmployee
ON Employee
FOR DELETE 
AS 
BEGIN
	DECLARE @Id INT
	SELECT @Id = Id FROM deleted
	INSERT INTO Employee_Audit_Test
	VALUES('DELETE Id' + CAST(@Id AS VARCHAR(10)) + ' IS DELETED AT ' + CAST(GETDATE() AS VARCHAR(20)))
END

DELETE FROM Employee WHERE Id = 7

CREATE OR ALTER TRIGGER trg_Update
ON Employee
FOR UPDATE
AS
BEGIN
		DECLARE @Id INT
		SELECT @Id = Id FROM deleted
		SELECT @Id = Id FROM inserted
	INSERT INTO Employee_Audit_Test 
	VALUES('Update Id ' + CAST(@Id AS VARCHAR(20)) + ' IS UPDATED ' + CAST(GETDATE() AS VARCHAR(20)))
END
SELECT * FROM Employee
SELECT * FROM Employee_Audit_Test

UPDATE Employee SET Name = 'Sima', Salary = '16000', Gender = 'female' WHERE Id = 1

CREATE TABLE #Employees
(
Id INT PRIMARY KEY,
Name VARCHAR(50),
Salary INT,
Gender VARCHAR(12),
DepartmentId INT
)

SELECT * FROM Employee_Audit_Test

SELECT * FROM Employee
CREATE OR ALTER TRIGGER trg_Update
ON Employee
FOR INSERT
AS BEGIN

	DECLARE @Id INT
	SELECT @Id = Id FROM inserted
	SELECT @Id = Id FROM deleted
	INSERT INTO Employee_Audit_Test
	VALUES('Id = ' + CAST(@Id AS VARCHAR(20)) + ' IS INSERTED ' + CAST(GETDATE() AS VARCHAR(20)))
END

INSERT INTO Employee VALUES(11, 'SANJANA',61000, 'female', 3)


CREATE OR ALTER TRIGGER trg_Update
ON Employee
FOR INSERT
AS BEGIN
	PRINT 'CANT PERFORM INSERT OPERATION'
	ROLLBACK TRANSACTION
END

CREATE OR ALTER TRIGGER trg_Update
ON Employee
FOR INSERT, UPDATE, DELETE
AS BEGIN
	PRINT 'ROLLBACKED'
	ROLLBACK TRANSACTION
END
DELETE FROM Employee WHERE Id = 1

SELECT * FROM Employee

CREATE TRIGGER trg_Operation
ON Employee
FOR INSERT,UPDATE, DELETE
AS 
BEGIN
	IF(Id = 2 IS NOT NULL) 
		BEGIN
			PRINT 'SHOW' 
			ROLLBACK TRANSACTION
		END
END

CREATE TABLE Sender
(
Id INT PRIMARY KEY,
Name VARCHAR(20),
SendDay VARCHAR(20)
)

INSERT INTO Sender VALUES(1,'PRIYA', 'MONDAY')
INSERT INTO Sender VALUES(2,'PRERNA', 'TUESDAY')
INSERT INTO Sender VALUES(3,'APARNA', 'WENESDAY')
INSERT INTO Sender VALUES(4,'TARUN', 'THURSDAY')
INSERT INTO Sender VALUES(5,'EVA', 'FRIDAY')
INSERT INTO Sender VALUES(6,'SUNNY', 'SATURDAY')
INSERT INTO Sender VALUES(7,'LENA', 'SUNDAY')
INSERT INTO Sender VALUES(8,'PONDA', 'MONDAY')

SELECT * FROM Sender

CREATE TRIGGER trg_hira
ON Sender
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	If DATEPART(,GETDATE()) = 7
	BEGIN
		PRINT 'KIND'
		ROLLBACK TRANSACTION
	END
END

SELECT Name,is_instead_of_trigger FROM sys.triggers WHERE type = 'TR'
SELECT * FROM sys.triggers
--------------
USE LiteTravels

BEGIN
	DECLARE @VehicleType VARCHAR(20)
	DECLARE @VehicleModel VARCHAR(20)
	DECLARE @Id INT

	SET @VehicleType = 'Scooter'
	SET @VehicleModel = 'Activa'

	IF(@VehicleType = 'Scooter' AND @VehicleModel = 'Activa')
	BEGIN
	PRINT '1'
		SELECT VehicleModel,VehicleType, Id, Price
		FROM RentVehicles
		WHERE @Id = Id OR @VehicleType = VehicleType
	END
	ELSE IF(@VehicleType = 'Scooter' OR @VehicleModel = 'Activa')
	BEGIN
	PRINT '2'
			SELECT VehicleModel,VehicleType, Id, Price
		FROM RentVehicles
		WHERE @Id = Id OR @VehicleType = VehicleType
	END
END

--------------------------------------------------
CREATE OR ALTER TRIGGER tr_VehicleLocations_11
ON VehicleLocations 
AFTER INSERT, UPDATE, DELETE 
AS BEGIN 
	DECLARE @Id INT
	SELECT @Id = Id FROM inserted
	SELECT @Id = Id FROM deleted
   -- SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM INSERTED)  AND EXISTS(SELECT  * FROM DELETED) 
        BEGIN 
			INSERT INTO Audit_data_table
			VALUES ('An existing employee with Id = ' + CAST(@Id AS VARCHAR(10)),'Update' )
		END 
    ELSE IF EXISTS(SELECT * FROM INSERTED)  AND NOT EXISTS(SELECT * FROM DELETED) 
        BEGIN 
			INSERT INTO Audit_data_table 
			VALUES('New employee with Id = ' + CAST(@Id AS VARCHAR(10)),'Added') 
		END 
    ELSE IF    EXISTS(SELECT * FROM DELETED) AND NOT EXISTS(SELECT * FROM INSERTED)
        BEGIN 
			INSERT INTO Audit_data_table(Id,Data)
			VALUES ('An existing employee with Id = ' + CAST(@Id AS VARCHAR(10)),'Deleted')  
		END
END


INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES
('lllll','dfghgsedghsgf',18000);

SELECT * FROM VehicleLocations 
SELECT * FROM Audit_data_table 
-------------------------------------------------
DROP TRIGGER tr_RentVehicle_message
CREATE TABLE Audit_data_table
(
Id INT IDENTITY,
Data TEXT,
Action TEXT
)

DROP TABLE Audit_data_table
CREATE OR ALTER TRIGGER tr_RentVehicle_message
ON RentVehicles 
AFTER INSERT, UPDATE, DELETE 
AS BEGIN 

    --- FILL THE BEGIN/END SECTION FOR YOUR NEEDS.
	SELECT * FROM inserted
	SELECT * FROM deleted
    SET NOCOUNT ON;

    IF EXISTS(SELECT * FROM INSERTED)  AND EXISTS(SELECT * FROM DELETED) 
        BEGIN PRINT 'UPDATE' END 
    ELSE IF EXISTS(SELECT * FROM INSERTED)  AND NOT EXISTS(SELECT * FROM DELETED) 
        BEGIN PRINT 'INSERT' END 
    ELSE IF    EXISTS(SELECT * FROM DELETED) AND NOT EXISTS(SELECT * FROM INSERTED)
        BEGIN PRINT 'DELETED' END
    ELSE BEGIN PRINT 'NOTHING CHANGED'; RETURN; END  -- NOTHING
END

INSERT INTO RentVehicles
(VehicleType, VehicleModel, VehicleNumber, PersonNumber, PeriodTimeIn, PeriodTimeOut, Price, VehicleLocation, Date, PersonId) VALUES
('Car', 'brezza', 'LH01 kl 5421', '54125632', '05:05', '07:10', '15000', 4, '2022-03-09', 45)
SELECT * FROM RentVehicles

UPDATE RentVehicles SET VehicleModel = 'fraunti',PersonNumber = '63259845',Price = '10000' WHERE Id = 22

DELETE FROM RentVehicles WHERE Id = 22


CREATE OR ALTER TRIGGER tr_Registrations_message2
ON Registrations 
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
SELECT * FROM inserted
SELECT * FROM deleted
Declare @Type varchar(50)='';
IF EXISTS (SELECT * FROM inserted) and  EXISTS (SELECT * FROM deleted)
BEGIN
    SELECT @Type = 'UPDATE'
END
ELSE IF EXISTS(SELECT * FROM inserted)
BEGIN
    SELECT @Type = 'INSERT'
END
ElSE IF EXISTS(SELECT * FROM deleted)
BEGIN
    SELECT @Type = 'DELETE'
END
END


INSERT INTO Registrations(Name, Email) VALUES
('Gaurav Soni', 'gauravsoni@gmail.com')

