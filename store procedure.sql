
----Store Procedure ------

USE LiteTravels
------------------
ALTER PROCEDURE spTrauma 
(
@Class VARCHAR(20)
)
AS
BEGIN
SELECT TrainId,TrainName,Class, DateIn, TimeIn, DateOut,Price, Adult, Child  
FROM Trains AS t
JOIN TransportWays AS tm ON tm.TrainId = t.Id
WHERE Class = @Class
END


EXECUTE spTrauma 
@Class = 'EC' 

EXECUTE spTrauma 
@Class = 'SL' 

EXECUTE spTrauma 
@Class = 'CC' 

EXECUTE spTrauma 
@Class = '3AC' 
------------------------
ALTER PROCEDURE spYuk
(
@Source NVARCHAR(MAX),
@Destination NVARCHAR(MAX),
@Name AS VARCHAR(20),
@Wallet AS MONEY,
@Gender AS VARCHAR(20),
@PaymentType VARCHAR(20) 
)
AS
BEGIN
SELECT Name,Wallet, PaymentType,BookingDetails, Source, StartDate, Destination, EndDate, Price 
FROM TransportMediums AS tm
JOIN Registrations AS r ON r.Id = tm.PersonId 
JOIN UserDashboards AS ud ON ud.PersonId = r.Id
WHERE 
@Source = Source  AND
@Destination = Destination AND
@Name = Name AND
@Gender = Gender AND
@Wallet = Wallet AND
@PaymentType = PaymentType
END


EXECUTE spYuk
@Source = 'bhopal' ,
@Destination = 'srinagar',
@Name = 'Ishan Soni' ,
@Gender = 'male' ,
@Wallet = '750 ',
@PaymentType = 'offline'
--------
ALTER PROCEDURE spVisit
(
@PlaceName VARCHAR(30),
@GuideName VARCHAR(20),
@GuideCar NVARCHAR(MAX),
@min_Price MONEY,
@max_Price MONEY
)
AS
BEGIN
SELECT Name,PlaceName, GuideName, GuideCar,MIN(g.Price) AS PRICE , MAX(vs.Price) AS vsPrice
FROM VisitPlaces AS VS
JOIN Places AS p ON p.Id = vs.PlacesId
JOIN Guides AS g ON g.Id =GuidesId
JOIN Registrations AS r ON r.Id = PersonId
WHERE 
PlaceName = @PlaceName AND
GuideName = @GuideName AND
GuideCar = @GuideCar AND
g.Price >= @min_Price AND
vs.Price <= @max_Price
GROUP BY 
Name,PlaceName, GuideName, GuideCar
ORDER BY r.Name ASC; 
END

SELECT * FROM Places
SELECT * FROM VISITPLACES
SELECT * FROM GUIDES


----------------------------
----------------------
ALTER PROCEDURE spWhole
(
@Source NVARCHAR(MAX),
@Destination NVARCHAR(MAX),
@count_Id INT,
@min_PriceWithFood MONEY ,
@max_PriceWithoutFood MONEY ,
@avg_wallet MONEY
)
AS
BEGIN
SELECT COUNT(R.Id) AS Id, Name, Source, Destination, BookingDetails, HotelName, Rooms, h.Date, 
PaymentType,MIN(PriceWithFood) AS PWF, MAX(PriceWithoutFood) AS POF, AVG(Wallet) AS W, Gender
FROM Registrations AS r
JOIN Hotels AS h ON h.PersonId = r.Id
JOIN UserDashboards AS ud ON ud.PersonId = h.PersonId
JOIN TransportMediums AS tm ON tm.PersonId = h.PersonId
WHERE
@Source = Source AND
@Destination = Destination AND
@count_Id = r.Id AND
@min_PriceWithFood = PriceWithFood AND
@max_PriceWithoutFood = PriceWithoutFood AND
@avg_wallet = Wallet
GROUP BY Name, Source, Destination, BookingDetails, HotelName,Rooms, h.Date,PaymentType, Gender
END

EXECUTE spWhole
@Source = 'chennai' ,
@Destination = 'delhi',
@count_Id = 6 ,
@min_PriceWithFood = 9000.00 ,
@max_PriceWithoutFood = 3500.00 ,
@avg_wallet= 200.00

------------------------------
ALTER PROCEDURE spWhole
(
@Source NVARCHAR(MAX),
@Destination NVARCHAR(MAX),
@Gender VARCHAR(20)
)
AS
BEGIN
SELECT Name, Source, Destination, BookingDetails, HotelName, h.Date, 
COUNT(Rooms) AS pt, MIN(PriceWithFood) AS PWF, MAX(PriceWithoutFood) AS POF, AVG(Wallet) AS W, Gender
FROM Registrations AS r
JOIN Hotels AS h ON h.PersonId = r.Id
JOIN UserDashboards AS ud ON ud.PersonId = h.PersonId
JOIN TransportMediums AS tm ON tm.PersonId = h.PersonId
WHERE
@Source = Source AND
@Destination = Destination AND
@Gender = Gender 
GROUP BY Name, Source, Destination, BookingDetails, HotelName, Gender
END

EXECUTE spWhole
@Source = 'chennai',
@Destination = 'delhi',
@Gender = 'Female'


--------------------

ALTER PROCEDURE spWays
(

@VehicleType AS VARCHAR(30),
@VehicleModel AS NVARCHAR(MAX),
@min_Price AS MONEY 
)
AS
BEGIN
SELECT HotelName, Location, VehicleType, VehicleModel,ShopName, MIN(rv.Price) AS Price, h.Date, vl.Price
FROM VehicleLocations AS vl
JOIN RentVehicles AS rv ON rv.VehicleLocation = vl.Id 
JOIN Hotels AS h ON h.VehicleLocation = rv.VehicleLocation
WHERE
@min_Price = vl.Price AND
VehicleType LIKE '%'+ @VehicleType + '%' AND
VehicleModel LIKE '%' + @VehicleModel + '%' 
GROUP BY HotelName, Location, VehicleType, VehicleModel, h.Date, vl.Price,ShopName
END

EXECUTE spWays
@VehicleType = 'Scooter',
@VehicleModel = 'Activa' ,
@min_Price = 40000
GO
----------------------

ALTER PROCEDURE spLike
(
@Price AS MONEY,
@VehicleType AS VARCHAR(30),
@vehicleModel AS NVARCHAR(MAX)
)
AS
BEGIN
SELECT Name, VehicleType, VehicleModel, rv.Price, HotelName, h.Date, Source, Destination
FROM Registrations AS r
JOIN RentVehicles AS rv ON r.Id = rv.PersonId
JOIN Hotels AS h ON h.PersonId =  rv.PersonId
JOIN TransportMediums AS tm ON tm.PersonId = h.PersonId
WHERE
@Price = rv.Price AND
@VehicleType = VehicleType AND
VehicleModel LIKE '%' + @VehicleModel + '%'
END

EXECUTE spLike
@Price = 6000.00,
@VehicleType = 'Cycle',
@vehicleModel = 'normal'
---------------------------------

ALTER PROCEDURE spModel
(
@VehicleModel NVARCHAR(MAX)  OUT
)
AS
SET NOCOUNT ON
BEGIN
SELECT VehicleModel,VehicleType,ShopName,Location, vl.Price
FROM RentVehicles AS rv 
JOIN VehicleLocations AS vl ON rv.VehicleLocation = vl.Id
WHERE
@VehicleModel = VehicleModel
END;

EXECUTE spModel
   @VehicleModel= 'Amaze'

------------------------------
sp_helptext spWhole

-------------------------

EXECUTE sp_rename 'spHope', 'spWhole' 
--Caution: Changing any part of an object name could break scripts and stored procedures.
-------------------

ALTER PROCEDURE spCrop 
AS 
BEGIN
SELECT b.Id, Name, BusesName, Class, Source, Destination
FROM Registrations AS r
JOIN Buses AS b ON b.PersonId = r.Id
JOIN TransportMediums AS tm ON tm.PersonId = b.PersonId
END;
EXECUTE spCrop
--------------------------------------------------------
CREATE PROCEDURE spDope
(
@tm_Id INT,
@tw_Id INT
)
AS 
BEGIN
DECLARE @OutPut INT
SET @OutPut = @tm_Id + @tw_Id 
SELECT tw.Id, VehicleType, VehicleModel, Source, Destination
FROM RentVehicles AS rv
JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
JOIN TransportMediums AS tm ON rv.PersonId = tm.PersonId
JOIN TransportWays AS tw ON tw.Id = tm.TransportWay
WHERE
@tm_Id = tm.Id AND
@tw_Id = tw.Id
PRINT 'oUTpUT' + CAST(@OutPut AS VARCHAR)
END
GO

DECLARE @tm_Id INT, @tw_Id INT
SET @tm_Id = 2
SET @tw_Id = 13
EXECUTE spDope 
@tm_Id,  @tw_Id 

EXECUTE spDope 2, 13

EXECUTE spDope @tm_Id=2, @tw_Id=13

SELECT * FROM TransportWays
SELECT * FROM TransportMediums

------------------------------------------

ALTER PROCEDURE spSand
(
@Id INT,
@Name NVARCHAR(50),
@Email VARCHAR(20)
)
AS
BEGIN
UPDATE Registrations SET
      Name = @Name, 
	  Email= @Email
WHERE Id = @Id
END


EXECUTE spSand 7, 'Chintan Thumra', 'chintanthumra@gmail.com'
EXECUTE spSand @Id =7, @Name ='Chintan Thumra', @Email  = 'ChintanThumra@gmail.com'

--------------------------------------------

ALTER PROCEDURE spSlope
  @BusesName VARCHAR(30),
  @Id INT OUTPUT
AS
BEGIN
  SELECT @Id = COUNT(Id)
  FROM    Buses
  WHERE     BusesName = @BusesName
END

DECLARE @cream INT
EXECUTE spSlope 'neeta', @cream OUTPUT
PRINT @cream

DECLARE @cream INT
EXECUTE spSlope 'neeta', @cream OUTPUT
PRINT @cream

--------------------------------------------------

DECLARE @cream INT
EXECUTE spSlope 'neeta' , @cream OUTPUT
IF(@cream IS NULL)
PRINT '@cream IS NULL'
ELSE
PRINT '@cream IS NOT NULL'

---------------------------------------------

DECLARE @cream INT
EXECUTE spSlope @Id = @cream OUTPUT,  @BusesName = 'neeta'
PRINT @cream

-----------------------------------------------

ALTER PROCEDURE spProma
(
@r_Id NVARCHAR(MAX) OUTPUT
)
AS
BEGIN
SELECT @r_Id = COUNT(Rooms) 
FROM Hotels
END

DECLARE @rapido INT
EXECUTE spProma @rapido OUTPUT
PRINT @rapido

-----------------------------------------------------

CREATE PROCEDURE spFund
AS
BEGIN
RETURN(SELECT COUNT(Id) FROM Registrations)
END

DECLARE @koola INT
EXECUTE @koola = spFund
PRINT @koola

-------------------------------------------
ALTER PROCEDURE spLona
(
@Id INT,
@Name VARCHAR(20) OUTPUT
)
AS
BEGIN
SELECT @Name = Name FROM Registrations WHERE Id  = @Id
END
GO

-- For calling the procedure:
DECLARE @EmployeeName VARCHAR(30)
EXECUTE spGetEmplloyeeNameById1 3, @EmployeeName OUTPUT
PRINT @EmployeeName

DECLARE @Juga VARCHAR(20)
EXECUTE spLona 11, @Juga OUTPUT
PRINT @Juga

-----------------------------------Private/Local Temporary Stored Procedures
CREATE PROCEDURE #spOman
AS
BEGIN
SELECT * FROM Registrations
END

EXECUTE #spOman
DROP PROCEDURE #spOman
-------------------Public/Global Temporary Stored Procedures
CREATE PROCEDURE ##spKolam
AS
BEGIN
SELECT * FROM RentVehicles
END
EXECUTE ##spKolam
DROP PROCEDURE ##spKolam

--------------------------------------

sp_help spTrauma
sp_help Registrations
sp_help BusesNames

SELECT * FROM syscomments

sp_depends spLike
-- Stored Procedure without with encryption option
CREATE Procedure sp_GetEmployeeDetailsById
(
  @ID INT
)
AS
BEGIN
  SELECT  Name, Gender, CAST(DOB AS DATE) AS DOB 
  FROM   Employee 
  WHERE   ID = @ID
END

SELECT * FROM SYSCOMMENTS WHERE ID = OBJECT_ID('spProma') 
sp_helptext spProma


sp_depends RentVehicles


ALTER PROCEDURE spLike
(
@Price AS MONEY,
@VehicleType AS VARCHAR(30),
@vehicleModel AS NVARCHAR(MAX)
)
AS
BEGIN
SELECT Name, VehicleType, VehicleModel, rv.Price, HotelName, h.Date, Source, Destination, CAST(PeriodTimeIn AS time) AS PeriodTimeIn
FROM Registrations AS r	
JOIN RentVehicles AS rv ON r.Id = rv.PersonId
JOIN Hotels AS h ON h.PersonId =  rv.PersonId
JOIN TransportMediums AS tm ON tm.PersonId = h.PersonId
WHERE
@Price = rv.Price AND
@VehicleType = VehicleType AND
VehicleModel LIKE '%' + @VehicleModel + '%'
END
GO


EXECUTE spLike
@Price = 6000.00,
@VehicleType = 'Cycle',
@vehicleModel = 'normal'
------------------------------------------

CREATE Procedure spOla
(
  @ID INT
)
WITH RECOMPILE
AS
BEGIN
  SELECT Name, Email
  FROM Registrations 
  WHERE ID = @ID
END

EXECUTE spOla @Id = 5

-----------------------------------
CREATE OR ALTER PROCEDURE spSuman
					@Id INT NULL,
					@Name VARCHAR(20) NULL

AS 
BEGIN
	IF(@Id IS NOT NULL) OR (@Name IS NOT NULL)
		BEGIN
			SELECT * FROM Registrations
			WHERE 
			Id = @Id OR Name = @Name
		END
	ELSE
		BEGIN
			SELECT * FROM Registrations
		END
END

EXECUTE spSuman
@Id = NULL,
@Name = 'Sanjana Vora'

EXECUTE spSuman
@Id = 1,
@Name = NULL

EXECUTE spSuman
@Id = NULL,
@Name = NULL

EXECUTE spSuman
@Id = 1,
@Name = 'Sanjana Vora'

---------------------

CREATE OR ALTER PROCEDURE spSuman
					@Id INT NULL,
					@Name VARCHAR(20) NULL

AS 
BEGIN
	
			SELECT * FROM Registrations
			WHERE 
			Id = @Id OR 
			Name LIKE '%' + @Name + '%';
			
END

EXECUTE spSuman
@Id = NULL,
@Name = 't'

--------------------

CREATE OR ALTER PROCEDURE spProgra
					(
					@Id INT NULL,
					@VehicleType VARCHAR(30) NULL,
					@HotelName NVARCHAR(MAX) NULL,
					@min_Price MONEY NULL,
					@max_PriceWithFood MONEY NULL
					)
AS
BEGIN
	IF(@HotelName ='T') OR (@VehicleType ='Cycle')
		BEGIN
			SELECT HotelName, VehicleType, VehicleModel, rv.Price, rv.Date
			FROM Hotels As h
			LEFT OUTER JOIN RentVehicles AS rv ON rv.PersonId = h.PersonId
			WHERE	VehicleType LIKE + '%' + @VehicleType + '%' OR
					@min_Price = rv.Price OR
					@Id = h.Id OR
					@max_PriceWithFood = PriceWithFood OR
					HotelName LIKE + '%' + @HotelName +'%'
			ORDER BY HotelName ASC	
		END
	ELSE
		BEGIN
			SELECT HotelName, VehicleType, VehicleModel, rv.Price, rv.Date
			FROM Hotels As h
			LEFT OUTER JOIN RentVehicles AS rv ON rv.PersonId = h.PersonId 
			ORDER BY HotelName ASC	
		END
END

EXECUTE spProgra
@max_PriceWithFood = 5000,
@min_Price = 1000,
@Id = NULL,
@VehicleType = 'Cycle',
@HotelName = 'T' 

EXECUTE spProgra
@max_PriceWithFood = NULL,
@min_Price = NULL,
@Id = NULL,
@VehicleType = NULL,
@HotelName = NULL

EXECUTE spProgra
@max_PriceWithFood = 8000,
@min_Price = 1800,
@Id = NULL,
@VehicleType = 'C',
@HotelName = 'T' 

EXECUTE spProgra
@max_PriceWithFood = 5000,
@min_Price = 1000,
@Id = NULL,
@VehicleType = 'Cycle',
@HotelName = 'O' 
----------------------------
CREATE OR ALTER PROCEDURE spEnum
							(
							@PlaceName VARCHAR(30) NULL,
							@min_Price MONEY NULL,
							@Id INT
							)
AS
BEGIN
	IF(@PlaceName IS NULL) OR (@PlaceName IS NOT NULL) 
	BEGIN
			SELECT vs.Id, PlaceName, Placelocation, GuideName , GuideCar, vs.Price
			FROM VisitPlaces AS vs
			JOIN Places AS p ON p.Id = vs.PlacesId
			JOIN Guides AS g ON g.Id = vs.GuidesId
			WHERE	PlaceName LIKE '%' + @PlaceName + '%' OR
					@min_Price = vs.Price OR
					@Id = vs.Id 
	END
	ELSE
	BEGIN
			SELECT vs.Id, PlaceName, Placelocation, GuideName , GuideCar, vs.Price
			FROM VisitPlaces AS vs
			JOIN Places AS p ON p.Id = vs.PlacesId
			JOIN Guides AS g ON g.Id = vs.GuidesId
	END
END

EXECUTE spEnum
@PlaceName = 'Z',
@min_Price = 1000,
@Id  = NULL

-------------------------------

CREATE OR ALTER PROCEDURE spDron
							(
							@PersonId INT NULL,
							@FlightName VARCHAR(30) NULL,
							@Source NVARCHAR(MAX) NULL
							)
AS
BEGIN
	WHILE @PersonId <= 5
		SET @PersonId = @PersonId + 1
		IF(@PersonId IS NOT NULL) OR (@PersonId BETWEEN 5 AND 20)
		BEGIN
			SELECT f.Id, Source ,Destination, StartDate, EndDate, FlightName, Class, f.Price, Adult, Child, tm.PersonId
			FROM TransportMediums AS  tm
			LEFT OUTER JOIN Flights AS f ON f.PersonId= tm.PersonId 
			WHERE	@PersonId = tm.PersonId OR
					FlightName LIKE + '%'+ @FlightName OR
					Source LIKE + '_____' + @Source
			
		END
		ELSE
		BEGIN
			SELECT f.Id, Destination, StartDate, EndDate, FlightName, Class, f.Price, Adult, Child, tm.PersonId
			FROM TransportMediums AS  tm
			LEFT OUTER JOIN Flights AS f ON f.PersonId= tm.PersonId 
		END
END

EXECUTE spDron
@FlightName = NULL,
@PersonId = NULL,
@Source = NULL

EXECUTE spDron
@FlightName = 'r',
@PersonId = 6,
@Source = 'a'

EXECUTE spDron
@FlightName = NULL,
@PersonId = 23,
@Source = NULL

----------------------
DECLARE @Id INT = 0;

WHILE @Id < 5
BEGIN
    SET @Id = @Id + 1;
    IF @Id = 3
        CONTINUE;	
    SELECT * FROM Registrations
END

------------------------------

--CREATE OR ALTER PROCEDURE spTomatina
----Store Procedure Practice ----


DECLARE 
@VehicleType  VARCHAR(30),
@Price MONEY

DECLARE cursorRentVehicles CURSOR

FOR 
SELECT VehicleType, Price
FROM RentVehicles


OPEN  cursorRentVehicles

SELECT * FROM RentVehicles 

DECLARE 
@VehicleType  VARCHAR(30),
@Price MONEY
FETCH NEXT FROM cursorRentVehicles  
INTO 
@VehicleType,
@Price
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @VehicleType + CAST(@Price AS VARCHAR);
	FETCH NEXT FROM cursorRentVehicles INTO
	@VehicleType,
	@Price
END

CLOSE cursorRentVehicles

DEALLOCATE cursorRentVehicles

DECLARE 

@HotelName NVARCHAR(MAX),
@ShopName  NVARCHAR(MAX),
@Location  NVARCHAR(MAX),
@Date DATE,
@PriceWithFood MONEY

DECLARE cursorCharax CURSOR
FOR
SELECT HotelName, ShopName, Location, Date, PriceWithFood
FROM Hotels AS h
JOIN VehicleLocations AS vl ON vl.Id = h.VehicleLocation


OPEN cursorCharax 

DECLARE 
@HotelName NVARCHAR(MAX),
@ShopName  NVARCHAR(MAX),
@Location  NVARCHAR(MAX),
@Date DATE,
@PriceWithFood MONEY
FETCH NEXT FROM cursorCharax
INTO
@HotelName,
@ShopName,
@Location ,
@Date,
@PriceWithFood
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @Location + CAST(@PriceWithFood AS VARCHAR);
FETCH NEXT FROM cursorCharax INTO
@HotelName,
@ShopName,
@Location ,
@Date,
@PriceWithFood
END


CLOSE cursorCharax

DEALLOCATE cursorCharax

------------------------------------------

-------------try catch---------------------

CREATE PROCEDURE spOkla(
@a DECIMAL, 
@b DECIMAL,
@c DECIMAL OUTPUT )
AS
BEGIN
BEGIN TRY
SET @c = @a / @b;
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS en,
ERROR_SEVERITY() AS ese,
ERROR_STATE() AS es,
ERROR_PROCEDURE() AS ep,
ERROR_LINE() AS el,
ERROR_MESSAGE() AS em
END CATCH
END

DECLARE @r DECIMAL
EXECUTE spOkla 10, 2, @r OUTPUT 
PRINT @r


DECLARE @r2 DECIMAL
EXECUTE spOkla 10, 0, @r2 OUTPUT
PRINT @r2


CREATE PROC usp_report_error
AS
    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_LINE () AS ErrorLine  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_MESSAGE() AS ErrorMessage;  
GO

CREATE TABLE persons
(
    person_id  INT
    PRIMARY KEY IDENTITY, 
    first_name NVARCHAR(100) NOT NULL, 
    last_name  NVARCHAR(100) NOT NULL
);

CREATE TABLE deals
(
    deal_id   INT
    PRIMARY KEY IDENTITY, 
    person_id INT NOT NULL, 
    deal_note NVARCHAR(100), 
    FOREIGN KEY(person_id) REFERENCES persons(
    person_id)
);

insert into 
    persons(first_name, last_name)
values
    ('John','Doe'),
    ('Jane','Doe');

insert into 
    deals(person_id, deal_note)
values
    (1,'Deal for John Doe');

CREATE PROCEDURE spSales
(@person_id INT)
AS
BEGIN
BEGIN TRY
BEGIN TRANSACTION
DELETE FROM persons
WHERE person_id = @person_id
COMMIT TRANSACTION
END TRY
BEGIN CATCH
EXECUTE usp_report_error

IF(XACT_STATE()) = -1
BEGIN
PRINT N'the transaction is in uncommitable state' + 'rollback transaction'
		COMMIT TRANSACTION;
		END;
IF (XACT_STATE()) = 1
BEGIN
PRINT	N'the transaction is in commitable state'+'committing transaction'
		COMMIT TRANSACTION;
		END;
END CATCH
END;

EXECUTE spSales 2

EXECUTE spSales 1


----------------------------------


EXECUTE sp_addmessage
@msgnum = 50005,
@severity = 1,
--User-defined error messages must have a severity level between 1 and 25.
@msgtext = 'Sona chandi chamanprash';

SELECT * FROM sys.messages WHERE message_id = 50005

RAISERROR ( 50005,1,1)

EXECUTE sp_dropmessage
@msgnum =50005

RAISERROR ( 'Whoops, an error occurred.',1,1)

DECLARE 
@ErrorMessage NVARCHAR(4000),
@ErrorSeverity INT,
@ErrorState INT
BEGIN TRY
RAISERROR ('error occured in the try block', 17,1);
END TRY
BEGIN CATCH 
SELECT
@ErrorMessage = ERROR_MESSAGE(),
@ErrorSeverity = ERROR_SEVERITY(),
@ErrorState = ERROR_STATE()

RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
END CATCH

	DECLARE @MessageText NVARCHAR(MAX)
	SET @MessageText  = N'cannot delete the sales  order %s' ;
	RAISERROR(
	@MessageText,
	16,
	1,
	N'2001'
	)

	THROW 50005, N'AN ERROR OCCURED',1;
	THROW 50005, N'An error occurred', 1;
	CREATE TABLE t1
	(
	id int primary key
	);

	BEGIN TRY
	INSERT INTO t1(id)VALUES(8);
	INSERT INTO t1(id)VALUES(6);
	END TRY
	BEGIN CATCH
	PRINT('Raise the caught error again');
	THROW;
	END CATCH

	EXECUTE sys.sp_addmessage
	@msgnum = 50010,
	@severity = 16,
	@msgtext =
	N'the order number %s cannot be deleted because it does not exist',
	@lang = 'us_english';

	DECLARE @MessageText NVARCHAR(2048);
	SET @MessageText = FORMATMESSAGE(50010,N'1001');

	THROW 50010, @MessageText, 1

	DECLARE 
	@table NVARCHAR(128),
	@sql NVARCHAR(MAX);

	SET	@table = N'Registrations';

	SET @sql = N'SELECT * FROM	' + @table;

	EXECUTE sp_executesql @sql

	SELECT * FROM Registrations

CREATE OR ALTER PROCEDURE usp_query_toopn(
	@table NVARCHAR(128),
	@topN INT,
	@byCloumn NVARCHAR(128)
)
AS
BEGIN
	DECLARE
		@sql NVARCHAR(MAX),
		@topNStr NVARCHAR(MAX);

	SET @topNStr = CAST(@topN as nvarchar(max));

	SET @sql = N'SELECT TOP ' + @topNStr + '  * FROM ' + @table + ' ORDER BY ' + @byCloumn + ' DESC';

	EXECUTE sp_executesql @sql;

END;


EXECUTE usp_query_toopn
'Hotels', 10, 'PriceWithFood'
----------------------------

CREATE OR ALTER PROCEDURE usp_query(
	@table NVARCHAR(128)	
)
AS
BEGIN
	
	DECLARE @sql NVARCHAR(MAX);

	SET @sql = N'SELECT * FROM ' + @table;

	EXECUTE sp_executesql @sql

END

EXECUTE usp_query 'Places'


-------------------

CREATE OR ALTER PROCEDURE usp_tim
(
	@schema NVARCHAR(128),
	@table NVARCHAR(128)
)
AS
	BEGIN
		DECLARE 
			@sql NVARCHAR(MAX);

		SET @sql = N'SELECT * FROM ' + QUOTENAME(@schema) + '.' + QUOTENAME(@table);

		EXECUTE sp_executesql @sql;

	END;

EXECUTE usp_tim 'Registrations', 'RentVehicles'

EXECUTE sp_executesql
N'SELECT * 
	FROM Hotels 
	WHERE 
		PriceWithFood > @PriceWithFood	AND
		VehicleLocation  = @VehicleLocation
	ORDER BY
		PriceWithFood DESC',
N'@PriceWithFood DECIMAL(20,1),	
@VehicleLocation INT',
@PriceWithFood = 100,
@VehicleLocation = 1;

----------------------------------
----------------------------------
CREATE OR ALTER PROCEDURE spJuga
							(
							@Id INT NULL
							)
AS
BEGIN
	DECLARE @PlaceName VARCHAR(30);
	SET @PlaceName = '';
	SELECT vs.Id, vs.Price, Placelocation, g.GuideName, g.GuideCar
	FROM VisitPlaces AS vs
	JOIN Places AS p ON p.Id = vs.PlacesId
	JOIN Guides AS g ON g.Id = vs.GuidesId
	WHERE	@Id = vs.Id
END

--DECLARE @PlaceName VARCHAR(30);
EXECUTE spJuga 15

----Store Procedure----

USE LiteTravels;
GO
--------------------- CREATE PROCEDURE ----------------
SELECT r.Name, Email
FROM Registrations AS  r
ORDER BY r.Name;

CREATE PROCEDURE spRegister
AS
BEGIN
SELECT r.Name,Email
FROM Registrations AS r
ORDER BY r.Name
END;

EXECUTE spRegister;
DROP PROCEDURE spRegister;
-----------------------------

SELECT * FROM Registrations;	
SELECT * FROM Hotels;				
SELECT * FROM UserDashboards;			
SELECT * FROM Guides;
SELECT * FROM Places;
SELECT * FROM VisitPlaces;
SELECT * FROM VehicleLocations;
SELECT * FROM TransportMediums;
SELECT * FROM RentVehicles ;
SELECT * FROM TransportWays;
SELECT * FROM Trains;
SELECT * FROM Flights;
SELECT * FROM Buses;

--------------------------------------

SELECT HotelName,CheckIn, CheckOut,Rooms, PriceWithFood, PriceWithoutFood, Date
FROM Hotels AS h 
ORDER BY HotelName;

SELECT * FROM spHotels

CREATE OR ALTER PROCEDURE spHotels 
AS
BEGIN
SELECT HotelName,CheckIn, CheckOut, Rooms, PriceWithFood, PriceWithoutFood, Date
FROM Hotels AS h
ORDER BY HotelName
END;

EXECUTE spHotels;

DROP PROCEDURE spHotels;

-----------

SELECT * FROM Registrations;			
SELECT * FROM Hotels;					 
SELECT * FROM UserDashboards;					
SELECT * FROM Guides;	
SELECT * FROM Places;	
SELECT * FROM VisitPlaces;	
SELECT * FROM TransportMediums;	
SELECT * FROM RentVehicles ;	
SELECT * FROM VehicleLocations;	
SELECT * FROM TransportWays;	
SELECT * FROM Flights;
SELECT * FROM Trains;	
SELECT * FROM Buses;				

------------
CREATE PROCEDURE spGuides
AS
BEGIN
SELECT *
FROM Guides
ORDER BY GuideName
END;

EXECUTE spGuides; 

------------------------

CREATE PROCEDURE spPlaces
AS
BEGIN
SELECT *
FROM Places
ORDER BY PlaceName
END;

EXECUTE sp_Places; 


------------------------

CREATE PROCEDURE spVisitPlaces
AS
BEGIN
SELECT *
FROM VisitPlaces 
ORDER BY Id
END;

EXECUTE spVisitPlaces; 

----------------

------------------------

CREATE PROCEDURE spVehicleLocations
AS
BEGIN
SELECT *
FROM VehicleLocations
ORDER BY ShopName
END;

EXECUTE spVehicleLocations; 
DROP PROCEDURE spVehicleLocations
----------------

------------------------

CREATE PROCEDURE spTransportMediums
AS
BEGIN
SELECT *
FROM TransportMediums
ORDER BY Source, Destination
END;

EXECUTE spTransportMediums; 

----------------

------------------------

CREATE PROCEDURE spTransportWays
AS
BEGIN
SELECT *
FROM TransportWays
ORDER BY Id
END;

EXECUTE spTransportWays; 

----------------

------------------------

CREATE PROCEDURE spRentVehicles
AS
BEGIN
SELECT VehicleType, VehicleModel, VehicleNumber, PersonNumber, Date,PersonId
FROM RentVehicles
ORDER BY VehicleModel
END;

EXECUTE spRentVehicles; 

----------------

----------------

CREATE PROCEDURE spUserDashboards
AS
BEGIN
SELECT BookingDetails,PaymentType, Wallet, Gender, PersonId
FROM UserDashboards
ORDER BY Wallet
END;

EXECUTE spUserDashboards; 
-------------

CREATE PROCEDURE spBuses
AS 
BEGIN
SELECT *
FROM Buses
ORDER BY BusesName
END;
EXECUTE spBuses;

-------------

CREATE PROCEDURE spTrains
AS 
BEGIN
SELECT *
FROM Trains
ORDER BY TrainName
END;

EXECUTE spTrains;

-------------

CREATE PROCEDURE spFlights
AS 
BEGIN
SELECT *
FROM Flights
ORDER BY FlightName
END;
EXECUTE spFlights;
-------------

----------- Parameters -----------------

CREATE PROCEDURE spHotels
(@min_PriceWithFood AS MONEY)
AS
BEGIN
SELECT HotelName,CheckIn, CheckOut, Rooms, PriceWithFood, PriceWithoutFood, Date
FROM Hotels AS h
 WHERE
        PriceWithFood >= @min_PriceWithFood
ORDER BY HotelName
END;

EXECUTE spHotels 10000;

ALTER PROCEDURE spHotels 
(
@min_PriceWithFood AS MONEY,
@max_PriceWithoutFood AS MONEY
)
AS
BEGIN
SELECT HotelName,CheckIn, CheckOut, Rooms, PriceWithFood, PriceWithoutFood, Date 
FROM Hotels
WHERE 
		PriceWithFood >= @min_PriceWithFood AND
		PriceWithoutFood >= @max_PriceWithoutFood
ORDER BY HotelName
END;

EXECUTE spHotels 10000, 5000;

EXECUTE spHotels 
@min_PriceWithFood = 10000, 
@max_PriceWithoutFood = 5000;

------------------

ALTER PROCEDURE spRentVehicles
(
@avg_Price AS MONEY,
@min_VehicleNumber AS VARCHAR,
@max_PersonNumber AS INT
)
AS
BEGIN
SELECT VehicleType, VehicleModel, VehicleNumber, PersonNumber, Date,PersonId, Price
FROM RentVehicles
WHERE
Price >= @avg_Price AND
VehicleNumber >= @min_VehicleNumber AND
PersonNumber >= @max_PersonNumber

ORDER BY VehicleModel
END;

EXECUTE spRentVehicles 
@avg_Price = '5000',
@min_VehicleNumber = 'PJ05 hj 1245',
@max_PersonNumber = '11111111';

SELECT * FROM RentVehicles
DROP PROCEDURE spRentVehicles
-------------------

EXECUTE spRegister
EXECUTE spFlights
EXECUTE spTrains
EXECUTE spBuses
EXECUTE spGuides
EXECUTE spPlaces
EXECUTE spVisitPlaces
EXECUTE spUserDashboards
EXECUTE spTransportMediums
EXECUTE spTransportWays
EXECUTE spVehicleLocations

----------------------------

ALTER PROCEDURE spVehicleLocations
(
@Location AS NVARCHAR(MAX),
@max_Price AS MONEY = 0,
@min_Price AS MONEY = 5000,
@ShopNames AS NVARCHAR(MAX)
)
AS
BEGIN
SELECT
Location, ShopName, Price
FROM VehicleLocations
WHERE 
Location LIKE '%' + @Location + '%' AND
Price >= @min_Price AND
Price <= @max_Price AND
ShopName LIKE '%' + @ShopNames + '%'
ORDER BY 
Location
END;

EXECUTE spVehicleLocations
@Location = 'vadodara',
@min_Price = 100,
@max_Price = 1000000,
@ShopNames = 'indian'

-------------------------------------------

SELECT PersonId,r.Name, Gender, Wallet 
FROM Registrations AS r
JOIN UserDashboards AS ud ON ud.PersonId = r.Id
ORDER BY PersonId;

ALTER PROCEDURE spUser
AS
BEGIN
SELECT PersonId, r.Name, Gender, Wallet
FROM Registrations AS r
JOIN UserDashboards AS ud ON ud.PersonId = r.Id
ORDER BY PersonId
END;

--DROP PROCEDURE spUser


ALTER PROCEDURE spUser
(
@Gender AS VARCHAR(20)
)
AS
BEGIN
SELECT PersonId, r.Name, Gender, Wallet
FROM Registrations AS r
JOIN UserDashboards AS ud ON ud.PersonId = r.Id
WHERE Gender = @Gender
ORDER BY PersonId
END;

EXECUTE spUser
@Gender = 'Female';
--------------------------------------
SELECT * FROM RentVehicles

ALTER PROCEDURE spDraw 
(
@VehicleType AS VARCHAR(30) ,
@min_Price AS MONEY = 0,
@max_PriceWithFood AS MONEY = 999999,
@min_PriceWithoutFood AS MONEY = 0
)
AS
BEGIN
SELECT r.Name, HotelName, Price,VehicleModel, PriceWithFood, PriceWithoutFood
FROM Registrations AS r
JOIN Hotels AS h ON h.PersonId = r.Id
JOIN RentVehicles as rv ON  rv.VehicleLocation = h.VehicleLocation
WHERE 
VehicleType = @VehicleType AND
Price >= @min_Price AND
PriceWithFood >= @max_PriceWithFood AND
PriceWithoutFood >= @min_PriceWithoutFood 
ORDER BY h.PersonId
END

DROP PROCEDURE spDraw

EXECUTE spDraw

@VehicleType = 'car',
@min_Price = 1000 ,
@max_PriceWithFood =  1000,
@min_PriceWithoutFood = 1000


ALTER PROCEDURE spPro
(
@min_Prices AS MONEY = 0,
@PlaceNames AS VARCHAR(30) = NULL,
@GuideCars NVARCHAR(MAX)
)
AS
BEGIN
SELECT PlaceName, GuideName, GuideCar, g.Price
FROM Places AS p
JOIN VisitPlaces AS vp ON vp.PlacesId = p.Id
JOIN Guides AS g ON g.Id = vp.GuidesId
WHERE
g.Price>= @min_Prices AND
(@PlaceNames IS NULL OR PlaceName <= @PlaceNames )AND
GuideCar LIKE +'%' + @GuideCars + '%'
ORDER BY PlaceName
END;

EXECUTE spPro 
@min_Prices = 5000,
@GuideCars = 's'

--------------------- Variables ----------------
--1
DECLARE @VehicleModel VARCHAR(20);

DECLARE @Price AS MONEY
SET @Price = 12000; 

SELECT VehicleModel,Price,PersonNumber
FROM RentVehicles
WHERE Price =@Price
ORDER BY PersonId;

SELECT * FROM RentVehicles
----------------------
--2
DECLARE 
@GuideCar NVARCHAR(MAX),
@Price AS MONEY

SET @Price = 12000
SELECT GuideCar, GuideName,Price
FROM Guides
WHERE Price = @Price
ORDER BY Id;
select * from guides
-----------
--3
DECLARE 
@HotelName NVARCHAR(MAX),
@Rooms NVARCHAR(MAX)

SET @Rooms = 'Luxury'

SELECT HotelName, Rooms,PriceWithFood
FROM Hotels
WHERE Rooms = @Rooms 
ORDER BY HotelName

----------
---1
DECLARE @PersonId INT 
SET  @PersonId = (
SELECT
COUNT(*) 
FROM
Hotels
)
SELECT @PersonId AS PersonId;
PRINT @PersonId

PRINT CAST(@PersonId AS INT)
SET NOCOUNT ON
------------------
--2
DECLARE 
@VehicleType VARCHAR(30),
@Price MONEY,
@PersonId INT
SET
@Price = (
SELECT
SUM(Price)
FROM RentVehicles
)
SELECT @Price AS PersonId
PRINT @Price
PRINT CAST(@Price AS MONEY)
SET NOCOUNT ON
----------------
--3
DECLARE
@PriceWithFood MONEY,
@PriceWithoutFood MONEY
SET
@PriceWithFood  = (
SELECT
AVG(PriceWithFood)
--,SUM(PriceWithoutFood)
FROM Hotels
)
SELECT @PriceWithFood AS PriceWithFood 
SET NOCOUNT ON 
--SELECT @PriceWithoutFood AS PriceWithoutFood

-------------------
--1
DECLARE @Date DATE
SET @Date = '2022-10-27'
SELECT
VehicleModel, Date
FROM RentVehicles
WHERE Date = @Date
SET NOCOUNT ON --SET NOCOUNT ON it means there is no messages which shows the number of rows affected
SELECT * FROM RentVehicles
---------------------
--2
DECLARE @Wallet AS MONEY 
SET @Wallet = 150 
SELECT 
BookingDetails, Gender, PaymentType
FROM UserDashboards
WHERE Wallet = @Wallet 
--------------------------
--3
DECLARE @VehicleLocation AS INT
SET @VehicleLocation = 15 
SELECT ShopName, Location, VehicleModel, rv.Price
FROM VehicleLocations AS vl
JOIN RentVehicles AS rv ON vl.Id = rv.VehicleLocation
WHERE VehicleLocation = @VehicleLocation

------------------------
--1
DECLARE 
@HotelName AS NVARCHAR(MAX),
@PriceWithoutFood AS MONEY; 
SET @PriceWithoutFood = 3500; 
SELECT HotelName, Rooms, PriceWithFood, PriceWithoutFood, Date
FROM Hotels
WHERE
PriceWithoutFood = @PriceWithoutFood
ORDER BY HotelName

SELECT * FROM RentVehicles
------------------------------
--2
DECLARE 
@Source AS NVARCHAR(MAX),
@Price MONEY,
@StartDate DATE
SET
@StartDate = '2022-10-06'
SELECT Source, Destination, Price, StartDate
FROM TransportMediums
WHERE StartDate = @StartDate
ORDER BY Source
----------------------
--3
DECLARE 
@VehicleModel AS NVARCHAR(MAX),
@Price AS MONEY,
@VehicleType AS VARCHAR(30)
SET @VehicleType = 'Car'
SELECT VehicleModel, Price, VehicleType
FROM RentVehicles
WHERE VehicleType = @VehicleType
ORDER BY VehicleModel

------------------
--1
DECLARE 
@Source AS NVARCHAR(MAX),
@Destination AS NVARCHAR(MAX),
@Price AS MONEY;

SELECT 
@Source = Source,
@Destination = Destination,
@Price = Price
FROM
TransportMediums
WHERE Id = 11

SELECT
 @Source AS Source,
 @Destination AS Destination,
 @Price AS Price
-----------------------
--2
DECLARE 
@FlightName AS VARCHAR(30),
@Price AS MONEY,
@Adult AS INT,
@Child AS INT
SET @Adult = '2'
SELECT @FlightName = FlightName,@Price= Price,@Child = Child
FROM Flights 
WHERE 
Id = 12
SELECT
@FlightName AS FlightName,
@Price AS Price,
@Adult AS Adult,
@Child AS Child
-------------
--3
DECLARE 
@GuidesId AS INT,
@PersonId AS INT,
@PlacesId AS INT,
@Price AS MONEY
SET @PlacesId = 1
SELECT @Price = Price,
@GuidesId = GuidesId,
@Price = Price,
@PersonId = PersonId
FROM VisitPlaces 
WHERE
Id = 9
SELECT
@GuidesId AS GuidesId,
@PlacesId AS PlaceId,
@Price AS Price,
@PersonId AS PersonId

-----------
ALTER PROCEDURE spBuses
(
@Id INT
)
AS
BEGIN
DECLARE 
@BusesName AS VARCHAR(30),
@Price AS MONEY;
SET
@BusesName = '';
SELECT 
@BusesName = @BusesName + Price + CHAR(10)  
FROM Buses
WHERE Id = @Id
ORDER BY Price 
PRINT @BusesName
END;

EXECUTE spBuses 5
select * from buses
----------------- output ---------------

ALTER PROCEDURE spTransportMediums
(
@Source NVARCHAR(MAX),
@Id INT OUTPUT
)
AS 
BEGIN
SELECT 
Source, Destination 
FROM TransportMediums AS tm
WHERE
Source = @Source
SELECT @Id = @@ROWCOUNT
END
--@Id INT OUTPUT
EXECUTE spTransportMediums
@Source = 'Ahmedabad',
 @Id = 1

-----------

DECLARE @count INT ;

EXECUTE	spTransportMediums
@Source = 'Ahmedabad',
@Id = @count OUTPUT;


DECLARE @count INT ;

SELECT @count AS 'Number';

--------
ALTER PROCEDURE spBuses
(
@PersonId INT ,
@Class VARCHAR(20) OUTPUT
)
AS 
BEGIN
SELECT
BusesName, Price, Class
FROM Buses AS b
WHERE 
Class = @Class
SELECT PersonId = @PersonId
END

EXECUTE spBuses
@Class = 'seating',
@PersonId = 4
SELECT * FROM Buses

-------------------------------------

BEGIN
    SELECT
        Id,
        BusesName,
		Price
    FROM
        Buses
    WHERE
        Price > 5000;

    IF @@ROWCOUNT = 0
        PRINT 'No Buses with price greater than 99999 found';
END
select * from buses

----------------BEGIN END

BEGIN
	DECLARE @TrainName VARCHAR(30)
	SELECT TOP 9
	@TrainName = TrainName
	FROM Trains
	ORDER BY Id DESC;

	IF @@ROWCOUNT <> 0
	BEGIN
		PRINT 'Class name is  ' +  @TrainName
		END
		ELSE
		BEGIN
			PRINT 'PRINT'
		END
	END;
SELECT * FROM TRAINS
------------------------------------

BEGIN
    DECLARE @HotelName NVARCHAR(MAX);

    SELECT TOP 5
        @HotelName = HotelName
    FROM
        Hotels
    ORDER BY
        Id DESC;
    
    IF @@ROWCOUNT <> 0
    BEGIN
        PRINT 'The most expensive product is ' + @HotelName
    END
    ELSE
    BEGIN
        PRINT 'No product found';
    END;
END
SELECT TOP 20* FROM HOTELS
--------------------------- BEGIN END

BEGIN
    DECLARE @PersonId INT;

    SELECT 
        @PersonId = SUM(PriceWithFood * PriceWithoutFood)
    FROM
        Hotels h
        INNER JOIN Registrations r ON h.PersonId = r.Id
    WHERE
        YEAR(Date) = 2022;

    SELECT @PersonId AS Id;

    IF @PersonId = 1
    BEGIN
        PRINT 'Great! The sales amount in 2022 is greater than 1,000,000';
    END
END

----------------------------------

BEGIN
	DECLARE @PersonId INT;

	SELECT
		@PersonId = SUM(Price + PersonNumber)
	FROM RentVehicles AS rv
	WHERE
		YEAR(Date)	= 2022;

	SELECT @PersonId AS Id;

	IF @PersonId = 2
	BEGIN
		PRINT 'FU'
	END

END


-------------------------- IF ELSE

BEGIN
	DECLARE @Id INT;
	SELECT
		@Id = SUM(PriceWithFood + PriceWithoutFood)
	FROM Hotels AS h
	INNER JOIN Registrations AS r ON r.Id = h.PersonId
	WHERE
		YEAR(Date) = 2022
	SELECT @Id AS T

	IF @Id >11
	BEGIN
		PRINT 'show'
	END

	ELSE 
	BEGIN
	PRINT 'TRY'
END
END
SELECT * FROM HOTELS
--------------------------------

----------------------- IF ELSE

BEGIN
    DECLARE @x INT = 10,
            @y INT = 20;

    IF (@x > 0)
    BEGIN
        IF (@x < @y)
            PRINT 'x > 0 and x < y';
        ELSE
            PRINT 'x > 0 and x >= y';
    END			
END


BEGIN
	DECLARE @a INT = 125,
			@b INT = 45;

	IF (@a > 0)
	BEGIN
		IF (@a < @b)
			PRINT 'a > 0 AND a < b';
		ELSE
			PRINT 'b > 0 AND a >= b'
	END
END



---------------------- WHILE 

DECLARE @counter INT = 1;

WHILE @counter <= 5
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END
-----------------

DECLARE @VEHICLEMODEL INT = 1;

WHILE @VEHICLEMODEL <= 45
BEGIN
PRINT @VEHICLEMODEL;
SET @VEHICLEMODEL = @VEHICLEMODEL + 5
END

---------------------- BREAK

DECLARE @HotelName NVARCHAR(MAX) = 0;

WHILE @HotelName <= 5
BEGIN
    SET  @HotelName =  @HotelName + 1;
    IF  @HotelName = 4
        BREAK;
    PRINT  @HotelName;
END
--------------
DECLARE @ID INT = 0;

WHILE @ID <= 18
BEGIN
	SET @ID = @ID + 1;
	IF @ID = 12
		BREAK;
	PRINT @ID;
END
------------------- CONTINUE 
DECLARE @Id INT = 0;

WHILE @Id < 5
BEGIN
    SET @Id = @Id + 1;
    IF @Id = 3
        CONTINUE;	
    PRINT @Id;
END
--------------
DECLARE @VEHICLENAME NVARCHAR = 0;
WHILE  @VEHICLENAME < 8
BEGIN
	SET @VEHICLENAME = @VEHICLENAME + 1
	IF @VEHICLENAME = 3
		CONTINUE;
	PRINT @VEHICLENAME;
END

--------------------

--DECLARE 
--    @VehicleModel NVARCHAR(MAX), 
--    @Price MONEY;

--DECLARE cursor_VehicleModel CURSOR
--FOR SELECT 
--        VehicleModel, 
--        Price
--    FROM 
--       RentVehicles;

--OPEN cursor_VehicleModel

----------------------

-------------------

BEGIN
    DECLARE @Name VARCHAR(20);

    SELECT TOP 1
        @Name = Name
    FROM
        Registrations
    ORDER BY
        Id ASC;
    
    IF @@ROWCOUNT <> 0
    BEGIN
        PRINT 'The most expensive product is ' + @Name
    END
    ELSE
    BEGIN
        PRINT 'No product found';
    END;
END
SELECT * FROM Registrations

----------------------------------------
CREATE OR ALTER PROCEDURE sp_Lamba
(
@HotelName NVARCHAR(MAX) = NULL,
@PersonId INT = NULL,
@Rooms NVARCHAR(MAX) OUTPUT,
@PriceWithFood MONEY = NULL,
@PriceWithoutFood MONEY = NULL
)
AS
BEGIN
SELECT HotelName, Rooms, CheckIn, CheckOut, Date, PersonId, VehicleLocation, 
CASE
	WHEN SUM(PriceWithFood) > 5000 THEN 'blah'
	WHEN AVG(PriceWithoutFood)  = 1200 THEN 'blah blah'
	ELSE 'RATE ACCORDING TO IT'
END RATE
FROM Hotels
WHERE YEAR(Date) = 2022 OR
@Rooms = Rooms OR
@HotelName = HotelName OR
@PersonId = PersonId OR
@PriceWithoutFood = PriceWithoutFood OR
@PriceWithFood =  PriceWithFood
GROUP BY HotelName, Rooms, CheckIn, CheckOut, Date, PersonId, VehicleLocation
HAVING AVG(PriceWithoutFood)  < 1000  OR SUM(PriceWithFood) > 5000
ORDER BY HotelName 
END

EXECUTE sp_Lamba
@Rooms = 'luxury', @HotelName = 'taj'


DROP PROCEDURE sp_lamba


SELECT HotelName, Rooms, CheckIn, CheckOut, Date, PersonId, VehicleLocation, 
CASE
    WHEN PriceWithFood > 30 THEN 'The quantity is greater than 30'
    WHEN PriceWithoutFood = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM Hotels; 
---------------------
USE [LiteTravels]
GO

DECLARE	@return_value int,
		@r_Id nvarchar(max)

EXEC	@return_value = [dbo].[spProma]
		@r_Id = @r_Id OUTPUT

SELECT	@r_Id as N'@r_Id'

SELECT	'Return Value' = @return_value

GO
drop procedure spProma
----------------------------------
----11-11-2022---
USE LiteTravels

CREATE OR ALTER PROCEDURE sp_Apii
					(
						@PlaceName NVARCHAR(MAX),
						@PlaceLocation NVARCHAR(MAX) OUT, 
						@Id INT = NULL
						-- Assign parameter_name = null or Define parameter_name null or comparsison ==
					)
AS
BEGIN
	SELECT Id, PlaceName, PlaceLocation
	FROM Places
	WHERE @PlaceName = PlaceName
END

EXECUTE sp_Apii
@PlaceName = 'taj mahal',
@PlaceLocation = 'Agra'

---------------------------

CREATE OR ALTER PROCEDURE sp_Eman
					(
						@PersonId INT = NULL,
						@Id INT = OUT,
						@Price MONEY = NULL,
						@PlacesId INT = NULL
					)	
AS
BEGIN
	SELECT *
	FROM VisitPlaces AS vp 
	WHERE PersonId = COALESCE(@PersonId, PersonId) 
END

EXECUTE sp_Eman
@Id = 5, @Price = 16000.00,@PersonId = NULL,@PlacesId = 19

EXECUTE sp_Eman
@Id = 5
/*
Note: if the PersonId column has NULL values this will not include these values. 
You will have to add additional logic for PersonId IS NULL
*/
EXECUTE sp_Eman
@Id = 5, @Price = 1600, @PersonId = 5, @PlacesId = 19

EXECUTE sp_Eman
@Id = NULL 

---------------------------------

CREATE OR ALTER PROCEDURE sp_Puri
					(
						@PersonId INT = NULL,
						@Id INT = OUT,
						@Price MONEY = NULL,
						@PlacesId INT = NULL
					)	
AS
BEGIN
	SELECT *
	FROM VisitPlaces AS vp 
	WHERE PersonId = ISNULL(@PersonId, PersonId) 
END

EXECUTE sp_Puri
@Id = 5, @Price = 16000.00

EXECUTE sp_Puri
@Id = 25, @Price = 16000.00,@PersonId = NULL,@PlacesId = 19

EXECUTE sp_Puri
@Id = 25, @Price = 16000.00,@PersonId = 5,@PlacesId = 19

-------------------

CREATE OR ALTER PROCEDURE sp_laragon
(
@PlaceName NVARCHAR(MAX) = NULL,
@PersonId INT = NULL
)
AS
BEGIN 
	SELECT vp.Id,PlaceName, Placelocation, Price
	FROM VisitPlaces AS vp
	JOIN Places AS p ON p.Id = vp.PersonId
	WHERE PersonId = ISNULL(@PersonId, PersonId) AND
	PlaceName LIKE + '%' + ISNULL(@PlaceName,PlaceName) + '%'
END

EXECUTE sp_laragon
@PlaceName = 'k'

EXECUTE sp_laragon
@PersonId = 10

EXECUTE sp_laragon
@PersonId = 5,
@PlaceName = 'r'

EXECUTE sp_laragon
@PersonId = NULL,
@PlaceName = 'l'

EXECUTE sp_laragon
@PersonId = 6,
@PlaceName = NULL

EXECUTE sp_laragon
@PlaceName = NULL,
@PersonId = NULL
---------------------------

CREATE OR ALTER PROCEDURE sp_paypal
(
@Price MONEY = NULL,
@Id INT = NULL
)
AS
BEGIN
SELECT Id, VehicleType, VehicleModel, Price
FROM RentVehicles
WHERE Price BETWEEN 1200 AND 8000 OR @Id = Id ORDER BY Price ASC
END

EXECUTE sp_paypal
@Price = 800

EXECUTE sp_paypal
@Id = 5

EXECUTE sp_paypal
@Id = 7, @Price = 17000


EXECUTE sp_paypal
@Id = 5, @Price = NULL

EXECUTE sp_paypal
@Id = NULL, @Price = NULL



CREATE OR ALTER PROCEDURE sp_kittu
(
@Price MONEY = NULL,
@Id INT = NULL
)
AS
BEGIN
SELECT Id, BusesName, Class, Price
FROM Buses
WHERE Price NOT BETWEEN 1500 AND 10000 OR @Id = Id ORDER BY Price ASC
END

EXECUTE sp_kittu
@Id = NULL, @Price = 3000

EXECUTE sp_kittu
@Id = 5017, @Price = NULL

EXECUTE sp_kittu
@Id = NULL, @Price = NULL

------------------
CREATE OR ALTER PROCEDURE sp_gang
							(
							@PersonId INT = NULL,
							@VehicleType NVARCHAR(MAX) = NULL,
							@Room NVARCHAR(MAX) = NULL
							)
AS
BEGIN
	IF(@VehicleType IS NOT NULL) AND (@Room IS NOT NULL) 
		BEGIN
			PRINT 'show'
			SELECT h.PersonId,VehicleType, VehicleModel, rv.Date, ShopName, Location, HotelName, PriceWithFood,PriceWithoutFood,Rooms
			FROM RentVehicles AS rv
			JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
			JOIN Hotels AS h ON h.Id = rv.VehicleLocation
			WHERE	@PersonId = h.PersonId OR
					@VehicleType = VehicleType OR
					@Room = Rooms 
		END
	ELSE IF(@VehicleType IS NOT NULL) AND (@Room IS NULL)
		BEGIN
			PRINT 'show2'
			SELECT h.PersonId,VehicleType, VehicleModel, rv.Date, ShopName, Location, HotelName, PriceWithFood,PriceWithoutFood,Rooms
			FROM RentVehicles AS rv
			JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
			JOIN Hotels AS h ON h.Id = rv.VehicleLocation
			WHERE	@PersonId = h.PersonId OR
					@VehicleType = VehicleType OR
					@Room = Rooms 
		END
	ELSE IF(@VehicleType IS NULL) AND (@Room IS NOT NULL)
		BEGIN
			PRINT 'show3'
			SELECT h.PersonId,VehicleType, VehicleModel, rv.Date, ShopName, Location, HotelName, PriceWithFood,PriceWithoutFood,Rooms
			FROM RentVehicles AS rv
			JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
			JOIN Hotels AS h ON h.Id = rv.VehicleLocation
			WHERE	@PersonId = h.PersonId OR
					@VehicleType = VehicleType OR
					@Room = Rooms 
		END
	ELSE IF(@VehicleType IS NULL) AND (@Room IS NULL)
		BEGIN
			PRINT 'show4'
			SELECT h.PersonId,VehicleType, VehicleModel, rv.Date, ShopName, Location, HotelName, PriceWithFood,PriceWithoutFood,Rooms
			FROM RentVehicles AS rv
			JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
			JOIN Hotels AS h ON h.Id = rv.VehicleLocation
		END
END

EXECUTE sp_gang
@PersonId = NULL,
@VehicleType = NULL,
@Room = 'LUXURY'

EXECUTE sp_gang
@PersonId = NULL,
@VehicleType = 'cycle',
@Room = NULL

EXECUTE sp_gang
@PersonId = 6,
@VehicleType = 'cycle',
@Room = 'luxury'

EXECUTE sp_gang
@PersonId = 9,
@VehicleType = NULL,
@Room = NULL

EXECUTE sp_gang
@PersonId = NULL,
@VehicleType = NULL,
@Room = NULL
--------------------------

CREATE OR ALTER PROCEDURE sp_oval
							(
							@PersonId INT = NULL,
							@VehicleType NVARCHAR(MAX) = NULL,
							@Room NVARCHAR(MAX) = NULL
							)
AS
BEGIN
SET NOCOUNT ON
DECLARE @sql AS NVARCHAR(MAX)

SET @sql =CASE
WHEN (@VehicleType IS NOT NULL) AND (@Room IS NOT NULL) 
THEN'BOTH IS NOT NULL'

WHEN (@VehicleType IS NOT NULL) AND (@Room IS NULL)
THEN 'IS NOT NULL AND IS NULL'

WHEN (@VehicleType IS NULL) AND (@Room IS NOT NULL)
THEN 'IS NULL AND IS NOT NULL'

WHEN (@VehicleType IS NULL) AND (@Room IS NULL)
THEN ' BOTH IS NULL'
END
PRINT @sql
SELECT h.PersonId,VehicleType, VehicleModel, rv.Date, ShopName, Location, HotelName, PriceWithFood,PriceWithoutFood,Rooms
			FROM RentVehicles AS rv
			JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
			JOIN Hotels AS h ON h.Id = rv.VehicleLocation
			WHERE	@PersonId = h.PersonId OR
					@VehicleType = VehicleType OR
					@Room = Rooms 

END

EXECUTE sp_oval
@PersonId = NULL,
@VehicleType = NULL,
@Room = 'LUXURY'

EXECUTE sp_oval
@PersonId = NULL,
@VehicleType = 'cycle',
@Room = NULL

EXECUTE sp_oval
@PersonId = 6,
@VehicleType = 'cycle',
@Room = 'luxury'

EXECUTE sp_oval
@PersonId = 9,
@VehicleType = NULL,
@Room = NULL

EXECUTE sp_oval
@PersonId = NULL,
@VehicleType = NULL,
@Room = NULL
