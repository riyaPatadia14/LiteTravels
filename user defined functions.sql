USE LiteTravels;

--- Inline Table Valued  Function ---

CREATE FUNCTION tvf_RentVehicles
(
@PersonId INT
)
RETURNS TABLE
AS
		RETURN SELECT * FROM RentVehicles WHERE PersonId = @PersonId 


SELECT * FROM _RentVehicles(1);

------------

CREATE FUNCTION tvf_Vehicle
(
@VehicleType VARCHAR(30)
)
RETURNS TABLE
AS
	RETURN	SELECT * FROM RentVehicles AS rv
			WHERE rv.VehicleType = @VehicleType

SELECT  * FROM tvf_Vehicle('Scooter') 

--------
USE LiteTravels
ALTER FUNCTION tvf_Buses
(
@Class  VARCHAR(20)
)
RETURNS TABLE
AS
	RETURN SELECT Class, BusesName, Adult, Child, MAX(Price) AS price FROM Buses
	WHERE Class = @Class
	GROUP BY Class, BusesName, Adult, Child
	HAVING MAX(Price) > 0

SELECT * FROM tvf_Buses('SLEEPER')

------

CREATE FUNCTION tvf_Places
(
@PlaceName VARCHAR(30)
)
RETURNS TABLE
AS 
	RETURN SELECT * FROM Places
	WHERE PlaceName LIKE '%' + @PlaceName + '%'


	SELECT * FROM tvf_Places('ar')

-------

CREATE FUNCTION tvf_UserDashboard
(
@Wallet MONEY
)
RETURNS TABLE
AS
	RETURN SELECT * FROM UserDashboards
	WHERE Wallet BETWEEN 150 AND 500 

SELECT * FROM tvf_UserDashboard(250)

--- Multi-Statement Table-Valued Function ---

CREATE FUNCTION mtvf_Hotels()
RETURNS	@Registrations TABLE	
(
Id INT,
Name VARCHAR(20),
Email NVARCHAR(50)
)
AS
BEGIN
	INSERT INTO @Registrations SELECT Id, Name, Email FROM Registrations
	RETURN
END

SELECT * FROM mtvf_Hotels()

--------
ALTER FUNCTION mtvf_DestinationPlaces()
RETURNS @DestinationPlaces TABLE
(
PlaceName VARCHAR(30),
PlaceLocation NVARCHAR(MAX)
)
AS
BEGIN
	INSERT INTO @DestinationPlaces SELECT PlaceName, PlaceLocation FROM Places
	RETURN
END

SELECT * FROM mtvf_DestinationPlaces()

-------
CREATE TABLE #Hotela
(
HotelName VARCHAR(20),
Rooms VARCHAR(20),
PriceWithFood MONEY,
PriceWithoutFood MONEY
)

INSERT INTO #Hotela SELECT HotelName,Rooms, PriceWithFood, PriceWithoutFood FROM Hotels 

DROP TABLE #Hotela

ALTER FUNCTION mtvf_Hotelas()
RETURNS @Hotela  TABLE
(
HotelName VARCHAR(20),
Rooms VARCHAR(20),
PriceWithFood MONEY,
PriceWithoutFood MONEY
)
AS
BEGIN
	INSERT INTO @Hotela (HotelName,Rooms, PriceWithFood, PriceWithoutFood)
	VALUES('LAVENDER', 'luxury', 8000, 2500)
		INSERT INTO @Hotela (HotelName,Rooms, PriceWithFood, PriceWithoutFood)
	VALUES('Mango', 'normal', 7500, 3500)
		INSERT INTO @Hotela (HotelName,Rooms, PriceWithFood, PriceWithoutFood)
	VALUES('Neem Tree', 'luxury', 9000, 2000)
		INSERT INTO @Hotela (HotelName,Rooms, PriceWithFood, PriceWithoutFood)
	VALUES('SunFlower', 'normal', 6500, 2500)
		INSERT INTO @Hotela (HotelName,Rooms, PriceWithFood, PriceWithoutFood)
	VALUES('Sunshine', 'luxury', 7500, 1500)
		INSERT INTO @Hotela (HotelName,Rooms, PriceWithFood, PriceWithoutFood)
	VALUES('Days of year', 'normal', 5000, 3000)
		INSERT INTO @Hotela (HotelName,Rooms, PriceWithFood, PriceWithoutFood)
	VALUES('West World', 'luxury', 5500, 2500)
		INSERT INTO @Hotela (HotelName,Rooms, PriceWithFood, PriceWithoutFood)
	VALUES('After Life', 'normal', 7700, 3000)
		INSERT INTO @Hotela (HotelName,Rooms, PriceWithFood, PriceWithoutFood)
	VALUES('Winters', 'normal', 6400, 2500)
		INSERT INTO @Hotela (HotelName,Rooms, PriceWithFood, PriceWithoutFood)
	VALUES('Lions', 'luxury', 7800, 3500)
	UPDATE @Hotela SET HotelName = 'Rose', Rooms ='normal' WHERE HotelName = 'LAVENDER'
	DELETE FROM @Hotela WHERE HotelName ='Lions'
	RETURN
END

SELECT * FROM mtvf_Hotelas()

--- Scalar Functtion ---

ALTER FUNCTION fn_Production
(
@Sales FLOAT,
@Production INT,
@Cost NUMERIC
)
RETURNS FLOAT
AS
	BEGIN
		RETURN @Sales + @Production - @Cost
	END

SELECT dbo.fn_Production(12.5,86,13) AS PRODUCTION

------
ALTER FUNCTION fn_Temporary
(
@Sum INT ,
@Avg NUMERIC 
)
RETURNS  FLOAT
AS
	BEGIN 
		DECLARE @Total FLOAT
		SET @Total = 3.5;
		IF(@Sum - @Avg > 1)  SET @Total = @Sum - @Avg;

		RETURN @Total

	END

SELECT	dbo.fn_Temporary(0,0) AS argument_0
SELECT	dbo.fn_Temporary(1,6) AS argument_1
SELECT	dbo.fn_Temporary(18,4.3) AS argument_2

--------------
CREATE OR ALTER FUNCTION fn_data1
(@Position  VARCHAR(MAX))
RETURNS  VARCHAR(MAX)
AS
BEGIN
		DECLARE @query  VARCHAR(MAX)
		SET @query = REPLACE(TRIM(',' from @Position), ' ' ,'') 

	RETURN @query
END

UPDATE DataUse SET Position = dbo.fn_data1(Position) 
SELECT * FROM DataUse
UPDATE Table1 
SET Name = xyz(Name)
---------------------------------------
CREATE TABLE DataUse
(
Id INT IDENTITY,
Fname VARCHAR(20),
Lname NVARCHAR(MAX),
Salary MONEY,
Position VARCHAR(MAX)
)
DROP TABLE DataUse
TRUNCATE TABLE DataUse
INSERT INTO DataUse VALUES('su   mi', 'ade    shra',12000,'SXT022 ,        SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES(',,altaf','she   ikh',13000,'SXT022 ,    SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('Jeni,,','sha  h',12500 , ',,,SXT022 ,SHN054 ,SBD106 ,       SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('   hiren',',,,parmar',13500,'SXT022 ,SHN054 ,SBD106 ,   SMT003 ,   STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('kushbu    ','goda,,',14000,'SXT022 ,SHN054 ,SBD106 ,SMT003 ,    STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('sugan    dha','g  osh',10000,'SXT022 ,SHN054 ,SBD106 ,SMT003 ,    STP033 ,STP035 ,')
INSERT INTO DataUse VALUES(',,kiran',',roy',10500,'SXT022 ,   SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('pranav   ,,,','mukher  ji',11000,'SXT022 ,SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES(',,   isha','soni',11750,',SXT022 ,SHN054 ,    SBD106 ,  SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('    tirth','adeshr  a',12350,'SXT022 ,SHN054 ,   SBD106 ,SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('subham    ',',chagg,',16000,'SXT022 ,SHN054 ,   SBD106 ,    SMT003 ,STP033 ,STP035 .,')
INSERT INTO DataUse VALUES('s   rushti','patadia    ,',15500,'SXT022 ,SHN054 ,   SBD106 ,SMT003 ,STP033 ,STP035 ,')
SELECT * FROM DataUse

---------------------------
CREATE OR ALTER FUNCTION fn_data1
(@Position  VARCHAR(MAX))
RETURNS  VARCHAR(MAX)
AS
BEGIN
		DECLARE @query  VARCHAR(MAX)
		SET @query = REPLACE(TRIM(',' FROM @Position), ' ' ,'') 

	RETURN @query
END

UPDATE DataUse SET Fname=dbo.fn_data1(Fname),Lname=dbo.fn_data1(Lname),Position = dbo.fn_data1(Position) 


CREATE OR ALTER PROCEDURE sp_data1
(
@Table NVARCHAR(MAX),
@Column1 NVARCHAR(MAX),
@Column2 NVARCHAR(MAX),
@Column3 NVARCHAR(MAX)
)
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX)
	SET @sql = N'UPDATE '+ QUOTENAME(@Table) +'SET '+ QUOTENAME(@Column1) +'=dbo.fn_data1('+ QUOTENAME(@Column1) +'),
	'+ QUOTENAME(@Column2) +'=dbo.fn_data1('+ QUOTENAME(@Column2) +'),'+ QUOTENAME(@Column3) +' = dbo.fn_data1('+ QUOTENAME(@column3) +')'

	EXECUTE sp_executesql @sql
	
END

EXECUTE sp_data1 'DataUse','Fname','Lname','Position'

--------------------------------------------------------------

