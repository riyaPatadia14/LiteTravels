------------- CTE -----------------------------
USE LiteTravels


;WITH
	cte_Vehicles(VehicleType, VehicleModel,Price,Date, Name)
	AS
	(
	SELECT
	VehicleType + ' ' + VehicleModel,
	SUM(Price) AS Price, YEAR(Date), Name
	FROM Registrations AS r
	JOIN RentVehicles AS rv ON rv.PersonId = r.Id
	GROUP BY VehicleType + ' '  + VehicleModel,
	YEAR(Date), 
	Name
	)
SELECT VehicleType ,VehicleModel,Price, Date, Name FROM cte_Vehicles WHERE YEAR(Date) = 2022

-----

;WITH
	cte_RentVehicles(VehicleType, VehicleModel,Price,Date)
	AS
	(
	SELECT VehicleType, VehicleModel, SUM(Price) AS Price,Date
	FROM RentVehicles AS rv
	GROUP BY VehicleType, VehicleModel,Date
	)
	SELECT rv.* FROM cte_RentVehicles
	JOIN RentVehicles AS rv ON rv.Date = cte_RentVehicles.Date
	ORDER BY Id
	
	
-------

WITH 
	cte_Place(Id,PlaceName, PlaceLocation, GuideCar, GuideName, Price)
	AS
	(
	SELECT vp.Id, MIN(vp.Price) AS Price, PlaceName, PlaceLocation, GuideCar, GuideName
	FROM VisitPlaces AS vp
	JOIN Places AS p ON p.Id = vp.PlacesId
	JOIN Guides AS g ON g.Id = vp.GuidesId
	GROUP BY vp.Id, vp.Price, PlaceName, PlaceLocation, GuideCar, GuideName
	)
	SELECT vp.Id, MIN(vp.Price) AS Price, PlaceName, PlaceLocation, GuideCar, GuideName
	FROM VisitPlaces AS vp
	JOIN Places AS p ON p.Id = vp.PlacesId
	JOIN Guides AS g ON g.Id = vp.GuidesId
	GROUP BY vp.Id, vp.Price, PlaceName, PlaceLocation, GuideCar, GuideName

	-------

WITH
	cte_Transports AS(
	SELECT 
	TrainName, SUM(Adult * Child + PersonId) AS GroupPerson, DateIn,TimeIn, TimeOut, Class, AVG(Price) AS Price
	FROM Trains
	GROUP BY TrainName, DateIn,TimeIn, TimeOut, Class
	)
	SELECT cte_Transports.*
	FROM cte_Transports
-------
WITH cte_Flight AS(
	SELECT DISTINCT
	FlightName, Class, Adult * Price AS CountId,
	ROW_NUMBER() OVER(PARTITION BY FlightName ORDER BY  Adult * Price DESC)
	AS RANK
	FROM Flights
	)
SELECT FlightName, Class,CountId FROM cte_Flight WHERE RANK = 1

------
USE LiteTravels
;WITH cte_UserDashboard AS
(
SELECT DISTINCT BookingDetails,Wallet
FROM UserDashboards
WHERE Wallet >= 800
),
cte_Hotels AS
(
SELECT BookingDetails,Wallet,HotelName,SUM(PriceWithFood) AS PWF
FROM Hotels AS h
LEFT JOIN UserDashboards AS ud ON ud.PersonId = h.PersonId
GROUP BY HotelName,BookingDetails,Wallet
HAVING Wallet >= 800
)
SELECT HotelName,PWF,BookingDetails,Wallet 
FROM cte_Hotels
------
--SELECT * FROM Hotels
--SELECT * FROM RentVehicles
--SELECT * FROM Places
--WITH cte_Vehicle AS
--(
--IF(PlaceName LIKE '____') OR (PlaceName LIKE '%i%') 
--SELECT vp.Id,Placelocation,vp.Price, g.GuideCar,g.GuideName FROM Places AS p
--JOIN VisitPlaces AS vp ON vp.PlacesId = p.Id
--JOIN Guides AS g ON g.Id = vp.PlacesId

--)
---------

;WITH cte_Transports
AS
(
SELECT Source, Destination,AVG(tm.PersonId) AS ATMPersonId, BusesName, Class, Adult
FROM TransportMediums AS tm
JOIN Buses AS b ON b.PersonId = tm.PersonId 
GROUP BY Source, Destination,BusesName, Class, Adult
)
SELECT MAX(ATMPersonId) AS MPersonId FROM cte_Transports

--------------

;WITH cte_UserBoard
AS
(
SELECT r.Id,Name,BookingDetails, AVG(Wallet) AS wallet,BusesName,Class,SUM(Adult + Child) AS GroupPerson, Price
FROM UserDashboards AS ud
JOIN Registrations AS r ON r.Id = ud.PersonId
JOIN Buses AS b ON b.PersonId = ud.PersonId
GROUP BY r.Id,Name,BookingDetails,BusesName,Class, Price
HAVING AVG(Wallet) > 800 AND SUM(Adult + Child) > 1
)
SELECT * FROM cte_UserBoard

-----------------------------------------
;WITH cte_TransportMed
AS
(
SELECT Id,PersonId,Source, Destination, Price, StartDate, EndDate
FROM TransportMediums
WHERE PersonId > 20
UNION ALL
SELECT tm.Id,tm.PersonId,tm.Source, tm.Destination,tm.Price, tm.StartDate, tm.EndDate
FROM TransportMediums AS tm
JOIN cte_TransportMed AS ctm ON ctm.Id= tm.PersonId
)
SELECT * FROM cte_TransportMed

-----------------------------------------
;WITH cte_Pla
AS
(
SELECT Id,PlacesId,Price,PersonId
FROM VisitPlaces
WHERE PersonId IS NULL
UNION ALL
SELECT vp.Id,vp.PlacesId,vp.Price,vp.PersonId
FROM VisitPlaces AS vp
JOIN cte_Pla AS cp ON cp.Id= vp.PersonId 
)
SELECT * FROM cte_Pla

----------------------
SELECT  
  p.PersonId, p.HotelName, p.[Date], p.[luxury], p.[normal]

FROM
  Hotels as h
PIVOT
(
  MAX(PriceWithFood)
  FOR Rooms IN ([luxury], [normal])
) p

------------------------------

	SELECT
		MAX(PriceWithFood) AS PriceWithFood,
		HotelName,
		Date,
		RANK () OVER ( 
			PARTITION BY Id
			ORDER BY PriceWithFood DESC
		) price_rank 
	FROM
		Hotels

	PIVOT
		(
			SUM(PriceWithoutFood)
			FOR Rooms IN([luxury],[normal])
		)As tt

	GROUP BY HotelName,Date,Id,PriceWithFood
	HAVING MAX(PriceWithFood) > 9000


-----------------------------------------------
SELECT PersonId, HotelName, Date,
       MAX(CASE WHEN Rooms = 'luxury' THEN PriceWithFood END) AS us,
       MAX(CASE WHEN Rooms = 'normal' THEN PriceWithoutFood END) AS ap
FROM (SELECT h.*,
             RANK() OVER (PARTITION BY PersonId, HotelName, Date 
                          ORDER BY PriceWithFood DESC
                         ) as rnk
      FROM Hotels AS h
     ) a

GROUP BY PersonId, HotelName, Date 


------------------------------------------------

SELECT * FROM Hotels
PIVOT
(
MAX(PriceWithFood)
FOR Rooms IN([luxury],[normal])
)As tt



SELECT 
	CASE WHEN HotelName IS NULL THEN 'Total' ELSE HotelName END HotelName,
		SUM([normal_2022-06-17])[normal_2022-06-17],
		SUM([normal_2022-09-26])[normal_2022-09-26],
		SUM([luxury_2022-02-12])[luxury_2022-02-12],
		SUM([luxury_2022-05-18])[luxury_2022-05-18],
		SUM([normal_2022-01-30])[normal_2022-01-30],
		SUM([luxury_2022-09-19])[luxury_2022-09-19],
		SUM([normal_2022-04-16] + [normal_2022-05-08] + [normal_2022-09-13])  ST,
		SUM([luxury_2022-06-14])[luxury_2022-06-14]
	FROM 
	(
		SELECT 
		Rooms + '_'  + CONVERT(VARCHAR(10),CAST(Date AS DATETIME),120) Date,
		PriceWithFood,
		HotelName
		FROM Hotels
	) AS HORTELS
	PIVOT
	(
		COUNT(PriceWithFood)
		FOR Date IN
		([normal_2022-06-17],[normal_2022-09-26],
		[luxury_2022-02-12],[luxury_2022-05-18],
		[normal_2022-01-30],[luxury_2022-09-19],
		[normal_2022-04-16],[normal_2022-05-08],
		[luxury_2022-06-14],[normal_2022-09-13])) piv
		GROUP BY GROUPING SETS((HotelName), ());
	
	SELECT * FROM Hotels
-------------------------------------------------------------------------------


-------------------- RECURSIVE CTE ----------------------------

CREATE TABLE ##Employees
(
  EmployeeID int NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  ManagerID int NULL
)

INSERT INTO ##Employees VALUES (1, 'Ken', 'Thompson', NULL)
INSERT INTO ##Employees VALUES (2, 'Terri', 'Ryan', 1)
INSERT INTO ##Employees VALUES (3, 'Robert', 'Durello', 1)
INSERT INTO ##Employees VALUES (4, 'Rob', 'Bailey', 2)
INSERT INTO ##Employees VALUES (5, 'Kent', 'Erickson', 2)
INSERT INTO ##Employees VALUES (6, 'Bill', 'Goldberg', 3)
INSERT INTO ##Employees VALUES (7, 'Ryan', 'Miller', 3)
INSERT INTO ##Employees VALUES (8, 'Dane', 'Mark', 5)
INSERT INTO ##Employees VALUES (9, 'Charles', 'Matthew', 6)
INSERT INTO ##Employees VALUES (10, 'Michael', 'Jhonson', 6) 

;WITH 
	cte_Employee(EmpId, FName, LName, MngId,EmpLevel)
	AS
	(
		SELECT EmployeeID, FirstName, LastName, ManagerID, 1
		FROM ##Employees
		WHERE ManagerID IS NULL
		UNION ALL
		SELECT e.EmployeeID, e.FirstName, e.LastName, e.ManagerID,ct.EmpLevel +1 
		FROM ##Employees AS e
		JOIN cte_Employee AS ct ON ct.EmpId= e.ManagerID
	)
SELECT
  FName + ' ' + LName AS FullName, 
  EmpLevel,
  (SELECT FirstName + ' ' + LastName FROM ##Employees 
    WHERE EmployeeID = cte_Employee.MngId) AS Manager
FROM cte_Employee 
ORDER BY EmpLevel, MngId


-------------------------------

USE LiteTravels

--- RECURSIVE cte
--DW = Datepart WeekDay
WITH cte_numbers(n, weekday) 
AS (
    SELECT 0,DATENAME(DW, 0)
    UNION ALL
    SELECT n + 1, DATENAME(DW, n + 1) FROM cte_numbers WHERE n < 6
	)
	SELECT weekday FROM cte_numbers;

-------

WITH cte_Hotels
AS
(
	SELECT Id,HotelName, Rooms, PriceWithFood ,PersonId
	FROM Hotels 
	UNION ALL
	SELECT h.Id,h.HotelName, h.Rooms, h.PriceWithFood, h.PersonId
	FROM Hotels AS h
	JOIN cte_Hotels AS ch ON ch.PersonId = h.PersonId
)
SELECT * FROM cte_Hotels

--------

;WITH cte_Mediums
AS
(
		SELECT Source, Destination, StartDate, EndDate,Price, TransportWay,Id,PersonId
		FROM TransportMediums
		WHERE TransportWay IS NOT NULL

		UNION ALL
		SELECT tm.Source, tm.Destination, tm.StartDate, tm.EndDate,tm.Price, tm.TransportWay,tm.Id,tm.PersonId
		FROM TransportMediums AS tm
		JOIN cte_Mediums AS cm ON cm.Id = tm.PersonId
	
)
SELECT * FROM  cte_Mediums

----
SELECT * FROM VisitPlaces

;WITH cte_VsPlaces
AS
(
	SELECT PlacesId,PersonId, Id
	FROM VisitPlaces
	WHERE PersonId IS NULL
	UNION ALL
	SELECT vp.PlacesId, vp.PersonId, vp.Id
	FROM VisitPlaces AS vp
	JOIN cte_VsPlaces AS cvp ON cvp.Id = vp.PersonId
)
SELECT * FROM cte_VsPlaces

-------

;WITH cte_Vehicles
AS
(
	SELECT VehicleType,VehicleModel,PersonId,Id
	FROM RentVehicles
	UNION ALL
	SELECT rv.VehicleType,rv.VehicleModel,rv.PersonId,rv.Id
	FROM RentVehicles AS rv
	JOIN cte_Vehicles AS cv ON rv.VehicleType = cv.VehicleModel
)
	SELECT * FROM cte_Vehicles

--------------

DECLARE @RowNo INT = 1;
;WITH ROWCTE AS
(
	SELECT @RowNo AS RowNo
	UNION ALL
	SELECT RowNo + 1
	FROM ROWCTE
	WHERE RowNo < 10
)
SELECT * FROM ROWCTE

-------

;WITH ROWCTE(ROWNO) AS
(
	SELECT 
	ROW_NUMBER() OVER(ORDER BY Name ASC) AS ROWNO
	FROM sys.databases
	WHERE database_id <= 10
)
SELECT * FROM ROWCTE

------------ PIVOT, UNPIVOT, DYNAMIC PIVOT ---------------------------------

--------

;WITH cte_VisitPlace
AS
(
SELECT PlacesId, Placelocation
FROM VisitPlaces AS vp
JOIN Places AS p ON p.Id = vp.PlacesId
)
SELECT * FROM cte_VisitPlace
PIVOT
(
COUNT(PlacesId)
FOR Placelocation IN
(
[Kolkata],
[Amritsar],
[Ladakh],
[Kashmir],
[Maharashtra],
[Delhi],
[Ahmedabad])
) AS pivot_table

---------

;WITH cte_pivot_vehicle
AS
(
SELECT PersonId,VehicleType
FROM RentVehicles
)
SELECT * FROM cte_pivot_vehicle
PIVOT
(
COUNT(PersonId)
FOR VehicleType IN
(
[cycle],
[scooter],
[bike],
[Car])
) AS pivot_table_type

---------
--------------

;WITH cte_Place
AS
(
SELECT PlaceName,Price
FROM VisitPlaces AS vp
JOIN Places AS p ON p.Id = vp.PlacesId
WHERE PlacesId IS NOT NULL
)
SELECT * FROM cte_Place
PIVOT
(
MAX(Price) 
FOR PlaceName IN
(
[Village View],
[Zuluk],
[Red Fort],
[Sabarmati Ashram],
[Palolem Beach],
[Thiksey Monastery],
[Victoria Memorial],
[Nehru Kund],
[Central Museum],
[Nubra Valley],
[Don Bosco Museum],
[Mysore Palace],
[Narkanda],
[Dashashwamedh Ghat],
[Howrah Bridge])
) AS pivot_table_Place

--------

SELECT TrainName,Classes,Amount FROM Trains
UNPIVOT
(
Amount
FOR Classes IN (Adult,Child)
) AS unpivot_table_track

select * from Trains

------
;WITH cte_Pivot
AS
(
SELECT TrainName,Price
FROM Trains
)
SELECT * FROM
(
SELECT Class ,Price FROM Trains
) AS ty
PIVOT
(
MAX(Price)
FOR Class  IN
([ec],[3ac],[cc],[sl])
) AS pivot_table
UNION ALL
SELECT * FROM 
(
SELECT Class,Price FROM Trains
)AS oi
PIVOT
(
MIN(Price)
FOR Class  IN
([ec],[3ac],[cc],[sl])
) AS pivot_table

------
--16-11-2022---

USE Temporary;
CREATE DATABASE Temporary
CREATE TABLE pvt
(
Id INT IDENTITY,
Name VARCHAR(20),
Gender VARCHAR(20),
Employee INT,
Department INT,
Sales INT
)
DROP TABLE pvt
INSERT INTO pvt	VALUES('Sanjana','female',1,2,50)
INSERT INTO pvt VALUES('Purva','female',5,3,60)
INSERT INTO pvt VALUES('Pravin','male',4,5,45)
INSERT INTO pvt VALUES('Gaurav','male',3,9,65)
INSERT INTO pvt VALUES('abhishek','male',1,3,70)
INSERT INTO pvt VALUES('mukesh','male',NULL,8,85)
UPDATE pvt SET Name ='Sameera' , Gender = 'female' WHERE Id = 7
INSERT INTO pvt VALUES('Mihir','male',1,6,100)

SELECT * FROM pvt


SELECT Id, Parts, Production FROM 
(
SELECT Id, Name, Gender, Employee, Department,Sales FROM pvt
)p
UNPIVOT
(
Production FOR Parts IN
(Employee, Department,Sales)
) AS unpivot_table_pvt
-------
USE LiteTravels
----------
;WITH cte_Model
AS
(
SELECT Id,PersonId,VehicleLocation ,VehicleType,VehicleModel
FROM RentVehicles
WHERE PersonId >= 20
)
SELECT Id, V_TYPE, v_Model  
FROM
(
SELECT Id,PersonId,VehicleLocation ,VehicleType,VehicleModel FROM cte_Model
)p
UNPIVOT
(
V_Model FOR V_Type IN
(PersonId, VehicleLocation)
) AS unpivot_table_ctemodel

------

;WITH cte_Dash
AS
(
SELECT Id, PersonId, VisitedPlaces
FROM UserDashboards
WHERE VisitedPlaces BETWEEN 1 AND 5
)
SELECT Id, P_Id, VP_Id
FROM
(
SELECT Id, PersonId, VisitedPlaces FROM cte_Dash
)p
UNPIVOT
(
P_Id FOR VP_Id IN (PersonId, VisitedPlaces )
) AS unpivot_table_ctedash

------

;WITH cte_Place
AS
(
SELECT Id, PlaceLocation
FROM Places
--WHERE PlaceLocation LIKE '%k%'
)
SELECT * FROM Places
PIVOT
(
COUNT(Id)
FOR PlaceLocation IN 
(
[Ladakh],
[Srinagar],
[Kutch],
[Shimla],
[Sikkim],
[Andaman Islands],
[Munnar],
[Coorg],
[Manali])
) AS pivot_table_cteplace

--------

;WITH cte_board
AS
(
SELECT BookingDetails, Wallet
FROM UserDashboards
--WHERE Id BETWEEN 5 AND 10
)
SELECT * FROM cte_board
PIVOT
(
SUM(Wallet)
FOR BookingDetails IN
(
[vadodara],[rajkot],[surat],[delhi],[mumbai],[haryana]
)
) AS pivot_table_cte_board


-------

;WITH cte_Visit
AS
(
SELECT Id,PersonId, PlacesId
FROM VisitPlaces
WHERE PersonId IS NULL
)
SELECT Id, P_Id, Pla_Id FROM 
(
SELECT Id, PersonId, PlacesId FROM cte_Visit
)p
UNPIVOT
(
P_Id FOR Pla_Id IN (PersonId,PlacesId)
) AS unpivot_table_ctevisit

----------

DECLARE @columns NVARCHAR(MAX) = '';
DECLARE	@sql	 NVARCHAR(MAX) = '';

SELECT 
	@columns += QUOTENAME(Name) + ','

FROM Registrations
ORDER BY Name

SET @columns = LEFT(@columns, LEN(@columns) - 1);

SET @sql = ' 
SELECT * FROM 
(
	SELECT *
	FROM Registrations AS r
)t
PIVOT
(
COUNT(Id)
FOR Name IN (' + @columns + ')
) AS pivot_table_r' 


EXECUTE sp_executesql @sql

-------

ALTER PROCEDURE sp_ll
AS
BEGIN
SELECT * FROM
(
SELECT Class ,Price FROM Trains
) AS ty
PIVOT
(
MAX(Price)
FOR Class  IN
([ec],[3ac],[cc],[sl])
) AS pivot_table
END
EXECUTE sp_ll


SELECT *  INTO #Demo FROM RentVehicles

ALTER PROCEDURE sp_vm
(
@VehicleModel NVARCHAR(MAX) NULL,
@PersonId INT NULL
)
AS
BEGIN
SELECT * FROM
(
SELECT VehicleModel,VehicleLocation,PersonId,VehicleType,Price
FROM #Demo
WHERE @VehicleModel= VehicleModel OR @PersonId =PersonId
) AS pot
PIVOT
(
MAX(PersonId)
FOR VehicleModel IN
([Activa])
) AS pivot_table
END

EXECUTE sp_vm @VehicleModel = 'Activa' ,@PersonId = 25

CREATE PROCEDURE sp_find
AS
BEGIN
DECLARE @FlightName VARCHAR(20)
DECLARE @Adult INT
DECLARE @PersonId INT
SET @PersonId = 5
SELECT * FROM
(
SELECT FlightName,Class,Price,Adult,Child,DateIn,PersonId  FROM #PAJAMAS
) AS pajamas
PIVOT
(
COUNT(Adult)
FOR FlightName IN
([crab],[frog],[shom])
) AS nme
END

DECLARE @FlightName VARCHAR(20)
DECLARE @Adult INT
DECLARE @PersonId INT
EXECUTE sp_find 

-------

EXECUTE sp_executesql N'SELECT * FROM RentVehicles'

DECLARE @table NVARCHAR(128);
DECLARE @sql NVARCHAR(MAX);

SET @table = N' Registrations'

SET @sql = N'SELECT * FROM ' + @table;

EXECUTE sp_executesql @sql


ALTER PROCEDURE sp_dynamic
					(
					@table NVARCHAR(128)
					)
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX)
	SET @sql = N'SELECT * FROM ' + @table
	EXECUTE sp_executesql @sql

END

EXECUTE sp_dynamic 'dbo.Places'

---------

CREATE OR ALTER PROCEDURE sp_dynapro
							(
							@table NVARCHAR(128),
							@TopN INT,
							@ByColumn VARCHAR(50)
							)
AS
BEGIN
	DECLARE @TopNStr NVARCHAR(50) 
	DECLARE @sql NVARCHAR(MAX)
	SET @TopNStr = CONVERT(VARCHAR(50),@TopN)

	SET @sql = N'SELECT TOP ' + @TopNStr + ' * FROM ' + @table + ' ORDER BY ' + @ByColumn + '  DESC';

	EXECUTE sp_executesql @sql
END

EXECUTE sp_dynapro
'Hotels',
10,
'HotelName'

-------

CREATE TABLE test
(Id INT)
select * from test
EXECUTE sp_dynamic 'Places'DROP TABLE test

SELECT * FROM Places DROP TABLE test 
------

CREATE OR ALTER PROCEDURE sp_goat
(
@table NVARCHAR(128),
@schema NVARCHAR(128)
)
AS
BEGIN
DECLARE
@sql NVARCHAR(MAX)
SET @sql = N'SELECT * FROM ' + QUOTENAME(@schema) + ' . ' + QUOTENAME(@table);
EXECUTE sp_executesql @sql

END

EXECUTE sp_goat 'RentVehicles','dbo';DROP TABLE dbo.test

-------

EXECUTE sp_executesql 
N'SELECT * FROM Buses 
WHERE Price > @Price 
AND 
PersonId = @PersonId
ORDER BY Price DESC',
N'@Price INT,
@PersonId INT'
,@Price = 100
,@PersonId = 1;

-------

CREATE OR ALTER PROCEDURE sp_crosha
(
@table NVARCHAR(128),
@schema NVARCHAR(50),
@byColumn NVARCHAR(50),
@topN  INT
)
AS
BEGIN
DECLARE @sql NVARCHAR(MAX)
DECLARE @topNStr VARCHAR(50)
SET @topNStr = CONVERT(NVARCHAR(50),@topN)
SET @sql = N'SELECT * FROM ' + QUOTENAME(@schema) + ' . ' + QUOTENAME(@table) 
SET @sql = N'SELECT TOP ' + @topNStr + ' * FROM ' + @table + ' ORDER BY ' + @ByColumn + '  DESC';
EXECUTE sp_executesql @sql
END

EXECUTE sp_crosha 'VehicleLocations','dbo', 'Location',10

-------


CREATE FUNCTION tvf_VehicleLoca
(
@ShopName VARCHAR(30)
)
RETURNS TABLE
AS 
	RETURN SELECT * FROM
	(
	 SELECT Id,ShopName FROM VehicleLocations
	) AS OP
	PIVOT
	( COUNT(Id)
	FOR ShopName IN
	([abdul],[rehan],[indian],[abdil],[rang])
	) AS pivottable

	SELECT * FROM tvf_VehicleLoca('ar')

-------

CREATE VIEW vw_vp_place
AS
SELECT PlaceName,Placelocation,Price,PersonId,PlacesId 
FROM Places AS p
JOIN VisitPlaces AS vp ON vp.PlacesId = p.Id
WHERE PersonId IS NOT NULL AND vp.Id >= 30


;WITH cte_lj
AS
(
	SELECT * FROM vw_vp_place
)
SELECT P_Name,v_Name FROM
(
SELECT PlacesId,PersonId FROM cte_lj
)AS L
UNPIVOT
(
P_Name FOR v_Name IN(PlacesId,PersonId)
) AS UNPIVOT_TABLE


----------
CREATE PROCEDURE sp_ukanda
AS
BEGIN
SELECT P_Id,V_Id  FROM
(
SELECT PlacesId,PersonId
FROM vw_vp_place
) AS I
UNPIVOT
(
P_Id FOR V_Id IN(PlacesId,PersonId)
) AS op
END

EXECUTE sp_ukanda


;WITH cte_olam
AS
(
	SELECT PersonId,PlaceName  FROM vw_vp_place
)
	SELECT * FROM cte_olam
	--) AS l
PIVOT
(
 MAX(PersonId) 
 FOR PlaceName IN([Nubra Valley],[Sabarmati Ashram],[Village View ],[Palolem Beach],[Tea garden ],[Nandi Hills ])
) AS olm
-----
SELECT * FROM UserDashboards
SELECT PaymentType,
CASE WHEN Online <> 0 THEN 'No' ELSE 'Yes' END AS Online,
CASE WHEN Offline <> 1 THEN 'No' ELSE 'Yes' END AS Offline
FROM UserDashboards
PIVOT
(
COUNT(PersonId)
FOR Gender IN([Online],[Offline])
) AS jk

--------

SELECT VehicleType,
CASE WHEN Cycle > 0 THEN 'No' ELSE 'yes' END AS Cycle,
CASE WHEN Scooter < 0 THEN 'No' ELSE 'yes' END AS Scooter,
CASE WHEN Car <> 0 THEN 'No' ELSE 'yes' END AS Car,
CASE WHEN Bike >= 0 THEN 'No' ELSE 'yes' END AS Bike
FROM RentVehicles
PIVOT
(
COUNT(Id)
FOR VehicleModel IN([Cycle],[Scooter],[Car],[Bike])
) AS lmm

----------

;WITH cte_munmun AS
(
SELECT Id,SUM(Adult + Child) AS groupperson, MAX(Price) AS price,MIN(PersonId) AS PID, BusesName, Class
FROM Buses
GROUP BY Id,BusesName, Class
HAVING SUM(Adult + Child) > 1 AND MAX(Price) > 1000 AND MIN(PersonId) > 0 
)SELECT O_id, PRICE FROM
(
SELECT Id,
CASE WHEN Price < 0 THEN 'No' ELSE 'yes' END AS Car,
CASE WHEN Id >= 0  THEN 'No' ELSE 'yes' END AS Bike
FROM cte_munmun
) AS KOM
UNPIVOT
(
O_id FOR PRICE IN(Id)
) AS pot

--------

SELECT Class, O_id, PRICE FROM
(
SELECT Class,
CASE WHEN COUNT(*) = 1 THEN 
CASE WHEN MAX(PersonId) = 'personid' THEN 'YES' ELSE 'NO' END ELSE 'YES' END AS 'personid',
CASE WHEN COUNT(*) = 1 THEN
CASE WHEN MIN(Id) = 'id'THEN 'YES' ELSE 'NO' END ELSE 'YES' END AS 'id'
FROM Buses
GROUP BY Class
) AS OL
UNPIVOT(
O_id 
FOR PRICE IN(PersonId,Id)
) AS tableunpivot


---------------------------


SELECT Vtype,Vmodel
FROM
(
SELECT Id,PersonId FROM RentVehicles
)AS t
UNPIVOT
(
Vmodel
FOR Vtype IN(Id,PersonId)
)AS i



SELECT Class, O_id, PRICE FROM
(

FROM Buses
GROUP BY Class
) AS OL
UNPIVOT(
O_id 
FOR PRICE IN(PersonId,Id)
) AS tableunpivot
-------------------------------------------
	SELECT
		MAX(PriceWithFood) AS PriceWithFood,
		HotelName,
		Date,
		RANK () OVER ( 
			
			ORDER BY PriceWithFood DESC
		) price_rank 
	FROM
		Hotels

	PIVOT
		(
			MIN(PriceWithoutFood)
			FOR Rooms IN([luxury],[normal])
		)As tt

	GROUP BY HotelName,Date,PriceWithFood
	HAVING MAX(PriceWithFood) > 9000

	CREATE TABLE Temp1
	(
	CName VARCHAR(20),
	Value VARCHAR(20)
	)

	INSERT INTO Temp1 Values 
	('Fname','Hiren'),
	('Lname','Patel'),
	('ID'	,'1'),
	('Fname','Kailash'),
	('Lname','Mali'),
	('ID'	,'2'),
	('Fname','Riya'),
	('Lname','Patadiya'),
	('ID'	,'3');
	
	SELECT * FROM 
	(
		SELECT * FROM Temp1
	)AS TempPivot
	PIVOT
	(
		MIN(Value)
		FOR Cname IN([FName], [LName],[Id])
	)AS d

	SELECT * FROM
	(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY Cname ORDER BY Value) AS [RANK]
	FROM Temp1
	)t
	PIVOT
	(
	MIN(Value)
	FOR Cname IN([Id],[FName],[LName])
	)AS y
----------

SELECT Pivoted.*,DurationCalc.Duration
FROM
(
   SELECT PVT.PersonId,
             COALESCE(PVT.[2022-03-05], 0) AS [2022-03-05],
             COALESCE(PVT.[2022-03-15], 0) AS [2022-03-15],
             COALESCE(PVT.[2022-04-13], 0) AS [2022-04-13],
             COALESCE(PVT.[2022-07-06], 0) AS [2022-07-06],
             COALESCE(PVT.[2022-05-17], 0) AS [2022-05-17]
FROM
(
SELECT  rv.Date, PersonId,Id
FROM RentVehicles AS rv
) AS Sales
PIVOT
(
SUM(Id) 
FOR Date IN([2022-03-05],[2022-03-15],[2022-04-13],[2022-07-06],[2022-05-17])) AS PVT
) AS Pivoted JOIN
(
SELECT xj_c_m.PersonId, SUM(CASE ISNULL(rlup.vehiclelocation,0) WHEN 0 THEN 1 ELSE 0 END) AS Duration
FROM
(
SELECT PersonId,SUM(VehicleLocation) AS vehiclelocation, rv.Date
FROM RentVehicles AS rv
GROUP BY rv.Date,PersonId
) AS rlup 
RIGHT JOIN
(
SELECT * FROM 
(
SELECT rv.Date FROM RentVehicles AS rv GROUP BY rv.Date
)rv_months 
CROSS JOIN
(
SELECT PersonId FROM RentVehicles GROUP BY PersonId
)rv_companies
)xj_c_m ON xj_c_m.PersonId = rlup.PersonId
AND xj_c_m.Date = rlup.Date
GROUP BY xj_c_m.PersonId
) DurationCalc ON Pivoted.PersonId = DurationCalc.PersonId

SELECT Id,PersonId,Date FROM RentVehicles

----


DECLARE @column  NVARCHAR(MAX) = ''
DECLARE @sql NVARCHAR(MAX) = '';

SELECT @column += QUOTENAME(PlaceName) + ','
FROM Places ORDER BY PlaceName;
SET @column = LEFT(@column, LEN(@column) - 1);

SET @sql ='
SELECT * FROM   
(
	SELECT Id,PlaceName FROM Places AS p
) AS t
PIVOT
(
COUNT(Id)
FOR PlaceName IN('+ @column +')
) AS pivot_table;';	

EXECUTE sp_executesql @sql

---------

DECLARE @columns NVARCHAR(MAX) = '' 
DECLARE @sqls NVARCHAR(MAX) = ''

SELECT @columns += QUOTENAME(FlightName) + ','
FROM Flights ORDER BY FlightName

SET @columns = LEFT(@columns, LEN(@columns) - 1);

SET @sqls =
'SELECT * FROM
(
SELECT Id, FlightName FROM Flights AS b
) AS t
PIVOT 
(
COUNT(Id)
FOR FlightName IN ('+ @columns +')
) AS pivot_table_b';

EXECUTE sp_executesql @sqls
---------

DECLARE @columns NVARCHAR(MAX) = ''
DECLARE @sqls NVARCHAR(MAX) = ''

SELECT @columns += QUOTENAME(PlaceName) + ','
FROM Places ORDER BY PlaceName

SET @columns = LEFT(@columns, LEN(@columns) - 1); 

SET @sqls = 
'
SELECT * FROM
(
SELECT PlacesId, PlaceName FROM Places AS p
JOIN VisitPlaces AS vp ON vp.PlacesId = p.Id
) AS k
PIVOT
(
COUNT(PlacesId)
FOR PlaceName IN ('+ @columns + ')
) AS pivot_table_vp_p;
'
EXECUTE sp_executesql @sqls

--------

DECLARE @col NVARCHAR(MAX) = '' 
DECLARE @query NVARCHAR(MAX) = ''

SELECT @col += QUOTENAME(HotelName) + ',' FROM Hotels ORDER BY HotelName

SET @col = LEFT(@col ,LEN(@col) - 1); 

SET @query =
'
SELECT * FROM
(
SELECT PriceWithFood, HotelName
FROM Hotels AS h
) AS t
PIVOT
(
MAX(PriceWithFood)
FOR HotelName IN('+ @col +')
) AS kola'

EXECUTE sp_executesql @query 

--------

DECLARE @squel NVARCHAR(MAX) = ''
DECLARE @coalum NVARCHAR(MAX) = ''

SELECT @coalum += QUOTENAME(GuideName) + ',' FROM Guides

SET @coalum = LEFT(@coalum ,LEN(@coalum) - 1);

SET @squel = 
'SELECT * FROM (SELECT Price, GuideName FROM Guides AS g) AS jk
PIVOT
(
AVG(Price)
FOR GuideName IN ('+ @coalum +')
) AS lopa
'

EXECUTE sp_executesql @squel

create table temp
(
    date datetime,
    category varchar(3),
    amount money
)

insert into temp values ('1/1/2012', 'ABC', 1000.00)
insert into temp values ('2/1/2012', 'DEF', 500.00)
insert into temp values ('2/1/2012', 'GHI', 800.00)
insert into temp values ('2/10/2012', 'DEF', 700.00)
insert into temp values ('3/1/2012', 'ABC', 1100.00)


DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX);

SET @cols = STUFF((SELECT distinct ',' + QUOTENAME(c.category) 
            FROM temp c))
    
set @query = 'SELECT date, ' + @cols + ' from 
            (
                select date
                    , amount
                    , category
                from temp
           ) x
            pivot 
            (
                 max(amount)
                for category in (' + @cols + ')
            ) p '


execute(@query)

DECLARE @coal NVARCHAR(MAX) = ''
DECLARE @squrl NVARCHAR(MAX) = ''
DECLARE @coal1 NVARCHAR(MAX) = ''

SELECT @coal += QUOTENAME(HotelName) + ',' FROM Hotels ORDER BY HotelName
SELECT @coal1 += QUOTENAME(Date) + ',' FROM Hotels ORDER BY Date
SET @coal = LEFT(@coal,LEN(@coal) - 1)
SET @coal1 = LEFT(@coal1, LEN(@coal1) - 1)

SET @squrl = 'SELECT ' + @coal + ' , ' + @coal1 +' FROM
				(
					SELECT Date, PriceWithFood,PriceWithoutFood,HotelName FROM Hotels
				) AS xy
				PIVOT
				(
					MIN(PriceWithFood)
					FOR HotelName IN ('+ @coal +')

				) AS opa
				PIVOT
				(
				MAX(PriceWithoutFood)
					FOR Date IN ('+ @coal1 +')
				) AS ola
				'

EXECUTE sp_executesql @squrl
---------

SELECT * FROM
				(
					SELECT * FROM Hotels
				) AS xy
				PIVOT
				(
					MIN(PriceWithFood)
					FOR HotelName IN ([taj],[raja],[wednesday],[goatny])

				) AS opa
				PIVOT
				(
				MAX(PriceWithoutFood)
					FOR Date IN ([2022-10-03],[2022-06-17],[2022-04-16],[2022-02-14])
				) AS ola


-------

DECLARE @colu NVARCHAR(MAX) = ''; 
DECLARE @sqly NVARCHAR(MAX) = '';

SELECT @colu = @colu + QUOTENAME(HotelName) +  ',' FROM (SELECT DISTINCT HotelName FROM Hotels ) AS temp
SELECT @colu = SUBSTRING(@colu, 0,LEN(@colu))
SET @sqly = '

	SELECT * FROM Hotels

PIVOT
(
MAX(PriceWithFood) FOR HotelName IN(' + @colu + ')
) AS piv
UNION ALL
	SELECT * FROM Hotels
PIVOT
(
MIN(PriceWithFood) FOR HotelName IN(' + @colu + ')
) AS piv1 
UNION ALL
	SELECT * FROM Hotels
PIVOT
(
COUNT(PriceWithFood) FOR HotelName IN(' + @colu + ')
) AS piv2
UNION ALL
	SELECT * FROM Hotels
PIVOT
(
SUM(PriceWithFood) FOR HotelName IN(' + @colu + ')
) AS piv2
UNION ALL
	SELECT * FROM Hotels 
PIVOT
(
AVG(PriceWithFood) FOR HotelName IN(' + @colu + ')
) AS piv2
'


EXECUTE sp_executesql @sqly

SELECT * FROM Hotels

PIVOT
(
MAX(PriceWithFood) FOR HotelName IN([RAJA],[NIMO],[TAJ],[WEDNESDAY])
) AS piv
SELECT I_D,P_D FROM
(
SELECT Id,PersonId FROM Hotels
) as o
UNPIVOT
(
I_D
FOR P_D IN(Id,PersonId) )AS UNPIVOTTABLE1

---------------

USE LiteTravels
SELECT 
	CASE WHEN HotelName IS NULL THEN 'Total' ELSE HotelName END HotelName,
		SUM([normal_2022-06-17])[normal_2022-06-17],
		SUM([normal_2022-09-26])[normal_2022-09-26],
		SUM([luxury_2022-02-12])[luxury_2022-02-12],
		SUM([luxury_2022-05-18])[luxury_2022-05-18],
		SUM([normal_2022-01-30])[normal_2022-01-30],
		SUM([luxury_2022-09-19])[luxury_2022-09-19],
		SUM([normal_2022-04-16] + [normal_2022-05-08] + [normal_2022-09-13])  ST,
		SUM([luxury_2022-06-14])[luxury_2022-06-14]
	FROM 
	(
		SELECT 
		Rooms + '_'  + CONVERT(VARCHAR(10),CAST(Date AS DATETIME),120) Date,
		PriceWithFood,
		HotelName
		FROM Hotels
	) AS HORTELS
	PIVOT
	(
		COUNT(PriceWithFood)
		FOR Date IN
		([normal_2022-06-17],[normal_2022-09-26],
		[luxury_2022-02-12],[luxury_2022-05-18],
		[normal_2022-01-30],[luxury_2022-09-19],
		[normal_2022-04-16],[normal_2022-05-08],
		[luxury_2022-06-14],[normal_2022-09-13])) piv
		GROUP BY GROUPING SETS((HotelName), ());
	
	SELECT * FROM Hotels

---------------------------------------------------

DECLARE @query1 NVARCHAR(MAX) = ''
DECLARE @colu1 NVARCHAR(MAX) = ''

SELECT @colu1 = @colu1 + QUOTENAME(Rooms) +  '_' + QUOTENAME(CONVERT(DATETIME,Date)) + QUOTENAME(PriceWithFood) + QUOTENAME(HotelName) FROM 
(SELECT DISTINCT Rooms,Date,PriceWithFood,HotelName FROM Hotels ) AS temp
SELECT @colu1 = SUBSTRING(@colu1, 0,LEN(@colu1))
SET @query1=
'
SELECT 

CASE WHEN HotelName IS NULL THEN Total ELSE HotelName END HotelName,

	SUM([normal_2022-06-17])[normal_2022-06-17],
		SUM([normal_2022-09-26])[normal_2022-09-26],
		SUM([luxury_2022-02-12])[luxury_2022-02-12],
		SUM([luxury_2022-05-18])[luxury_2022-05-18],
		SUM([normal_2022-01-30])[normal_2022-01-30],
		SUM([luxury_2022-09-19])[luxury_2022-09-19],
		SUM([normal_2022-04-16] + [normal_2022-05-08] + [normal_2022-09-13])  ST,
		SUM([luxury_2022-06-14])[luxury_2022-06-14]
FROM 
	(
		SELECT 
		Rooms , Date,
		PriceWithFood,
		HotelName
		FROM Hotels
	) AS HORTELS
	PIVOT
	(
		COUNT(PriceWithFood)
		FOR Date IN
		('+ @colu1 +')) piv
		GROUP BY GROUPING SETS((HotelName), ());'

EXECUTE sp_executesql @query1

-----------

--SELECT
--	CASE WHEN EmpName IS NULL THEN 'Total' ELSE EmpName END EmpName ,
--	SUM([JAN_Kailash])[FEB_Praveen],
--	SUM([MAR_Naresh]) [APR_Yogesh],
--	SUM([MAY_Kailash])[JUN_Praveen],
--	SUM([JUL_Naresh]),
--	SUM([JUL_Naresh])[AUG_Yogesh]
--	FROM
--	(
--	SELECT 
--		Month + '_' + CONVERT(VARCHAR(10),CAST(EmpName AS varchar(MAX)),120) EmpName,
--		Salary
--		FROM DyPivotEmp
--	)  dpe
--	PIVOT
--	(
--	COUNT(Salary)
--	FOR EmpName IN
--	([JAN_Kailash],[FEB_Praveen],[MAR_Naresh],[APR_Yogesh],[MAY_Kailash],[JUN_Praveen],[JUL_Naresh],[AUG_Yogesh]))ppt
--	GROUP BY GROUPING SETS((EmpName), ())


--CREATE TABLE DyPivotEmp
--(
--Id INT IDENTITY,
--    EmpName varchar(MAX),
--    Month varchar(MAX),
--    Salary money
--)

----drop table DyPivotEmp

--INSERT INTO DyPivotEmp(EmpName,Month,Salary) VALUES 
--('Kailash', 'JAN', 8000.00),
--('Praveen', 'FEB', 5000.00),
--('Naresh', 'MAR', 800.00),
--('Yogesh', 'APR', 5100.00),
--('Kailash', 'MAY', 8000.00),
--('Praveen', 'JUN', 5000.00),
--('Naresh', 'JUL', 800.00),
--('Yogesh', 'AUG', 5100.00),
--('Kailash', 'SEP', 8000.00),
--('Praveen', 'OCT', 5000.00),
--('Naresh', 'NOV', 800.00),
--('Yogesh', 'DEC', 5100.00),
--('Kailash', 'FEB', 8000.00),
--('Praveen', 'JAN', 5000.00),
--('Naresh', 'JAN', 800.00),
--('Yogesh', 'MAY', 5100.00)


--INSERT INTO DyPivotEmp(EmpName,Month,Salary) VALUES 
--('Kailash', 'JAN_23', 8000.00)


--UPDATE DyPivotEmp SET Month = 'JUN' WHERE 

SELECT * FROM DyPivotEmp

TRUNCATE TABLE DyPivotEmp
---------------------------------------------------------
CREATE OR ALTER PROCEDURE Sp_Dynaminpivot
AS
BEGIN
	-- First make column in sequance which is in Category column ----  

	DECLARE @Month VARCHAR(MAX)='',
			@SqlQuery VARCHAR(MAX);
	WITH Cat
	AS
	(
		SELECT DISTINCT Month FROM DyPivotEmp
		
	)
	SELECT @Month+=Month +',' FROM Cat
	SET @Month=LEFT(@Month,LEN(@Month)-1)
	
	PRINT @Month
   --- Then put that list of Category change in SqlQuery
	SET @SqlQuery=
	'
		SELECT * FROM 
		( 
			SELECT EmpName, Salary,Month FROM DyPivotEmp
		) Main
		PIVOT
		(
			SUM(Salary) FOR Month IN (' + @Month + ')
		) As p
	'
	EXEC (@SqlQuery)
END

EXEC Sp_Dynaminpivot

SELECT * FROM DyPivotEmp

DECLARE @col NVARCHAR(MAX) = '' 
DECLARE @query NVARCHAR(MAX) = ''
DECLARE @Rooms NVARCHAR(MAX) = ''
DECLARE @Date NVARCHAR(MAX) = ''

SELECT @col += QUOTENAME(@Rooms) + '_' + CAST(@Date AS NVARCHAR(MAX))  FROM Hotels ORDER BY HotelName
--SELECT @col += QUOTENAME(HotelName) + ',' FROM Hotels ORDER BY HotelName
SELECT @col = SUBSTRING(@col, 0,LEN(@col))

--SET @col = LEFT(@col ,LEN(@col) - 1); 

SET @query =
'
SELECT 
	CASE WHEN HotelName IS NULL THEN Total ELSE HotelName END HotelName,
		SUM('+ @col +')
	FROM 
	(
		SELECT 
		Rooms,Date,
		PriceWithFood,
		HotelName
		FROM Hotels
	) AS HORTELS
	PIVOT
	(
		COUNT(PriceWithFood)
		FOR Date IN
		('+ @col +') piv
		GROUP BY GROUPING SETS((HotelName), ());'
	
EXECUTE sp_executesql @query

------------------------------------------------------------------

--SELECT @col += QUOTENAME(HotelName) + ',' FROM Hotels ORDER BY HotelName

--SET @col = LEFT(@col ,LEN(@col) - 1); 

--SET @query =
--'
--SELECT * FROM
--(
--SELECT PriceWithFood, HotelName
--FROM Hotels AS h
--) AS t
--PIVOT
--(
--MAX(PriceWithFood)
--FOR HotelName IN('+ @col +')
--) AS kola'

--EXECUTE sp_executesql @query
--------
create table test_table
 (
 date nvarchar(10),
 category char(3),
 amount money
 )

 insert into test_table values ('1/1/2012','ABC',1000.00)
 insert into test_table values ('2/1/2012','DEF',500.00)
 insert into test_table values ('2/1/2012','GHI',800.00)
 insert into test_table values ('2/10/2012','DEF',700.00)
 insert into test_table values ('3/1/2012','ABC',1100.00)

 DECLARE @DynamicPivotQuery AS NVARCHAR(MAX),
@PivotColumnNames AS NVARCHAR(MAX),
@PivotSelectColumnNames AS NVARCHAR(MAX)

--Get distinct values of the PIVOT Column
SELECT @PivotColumnNames= ISNULL(@PivotColumnNames + ',','')
+ QUOTENAME(category)
FROM (SELECT DISTINCT category FROM test_table) AS cat

--Get distinct values of the PIVOT Column with isnull
SELECT @PivotSelectColumnNames 
= ISNULL(@PivotSelectColumnNames + ',','')
+ 'ISNULL(' + QUOTENAME(category) + ', 0) AS '
+ QUOTENAME(category)
FROM (SELECT DISTINCT category FROM test_table) AS cat

--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
N'SELECT date, ' + @PivotSelectColumnNames + '
FROM test_table
pivot(sum(amount) for category in (' + @PivotColumnNames + ')) as pvt';

--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery

---------------------
DECLARE @columns NVARCHAR(MAX)
DECLARE @sql NVARCHAR(MAX);

SET @columns = N'';
SELECT @columns += N',' + QUOTENAME(StartDate)
  FROM (SELECT StartDate FROM TransportMediums 
  GROUP BY StartDate) AS x;

SET @sql = N'SELECT * , [' + STUFF(@columns, 1, 2, '') + '
FROM
(
  SELECT PersonId,StartDate FROM TransportMediums 
) AS j
PIVOT
(
  SUM(PersonId) FOR StartDate IN ('+ STUFF(REPLACE(@columns, ', [', ',['), 1, 1, '') + ')
) AS p;';
PRINT @sql;
EXEC sp_executesql @sql;


SELECT * FROM TransportMediums

DECLARE @col1 NVARCHAR(MAX)
DECLARE @sql1 NVARCHAR(MAX)

SET @col1 = N'';
SELECT @col1 += N',' + QUOTENAME()
-------------------------


---------------------------------------------

DECLARE @columns NVARCHAR(MAX), @sql NVARCHAR(MAX);             

SET @Columns = (SELECT  N', tm.' + QUOTENAME(REPLACE(CONVERT(VARCHAR(10), tm.StartDate, 111), '/', '-'))
                FROM TransportMediums AS tm
                GROUP BY tm.StartDate
                ORDER BY tm.StartDate
                FOR XML PATH(''), TYPE
                ).value('.', 'NVARCHAR(MAX)');

SET @sql = N'SELECT  ' + STUFF(@columns, 1, 2, '') + ', Total = ' + STUFF(REPLACE(@columns, ', tm.[', ' + tm.['), 1, 3, '') + '
FROM
(
  SELECT tm.StartDate, tm.PersonId FROM TransportMediums AS tm
) AS j
PIVOT
(
  SUM(PersonId) FOR StartDate IN ('+ STUFF(REPLACE(@columns, ', tm.[', ',['), 1, 1, '') + ')
) AS tm;';
PRINT @sql;
EXEC sp_executesql @sql;

------------ TEMPORARY -------------

CREATE TABLE #StudentMarks(
StudID INT NOT NULL ,
SubjectID INT,
Score INT
)

INSERT INTO #Subjects (SubjectID, SubjectName) VALUES (51,'MATH'),
(52,'PHYSICS'),
(53,'SCIENCE'),
(54,'ART')

INSERT INTO #StudentMarks(StudID, SubjectID, Score) VALUES
(1, 51, 400),(1, 52, 350),(1, 53, 499),(1, 54, 403),
(2, 51, 410),(2, 52, 390),(2, 53, 477),(2, 54, 411),
(3, 51, 250),(3, 52, 300),(3, 53, 488),(3, 54, 476),
(4, 51, 288),(4, 52, 259),(4, 53, 399),(4, 54, 400)

SELECT SM.StudID, S.SubjectName, SM.Score 
FROM #StudentMarks SM 
INNER JOIN #Subjects S
ON Sm.SubjectID = S.SubjectID

SELECT StudID, ISNULL([MATH],0) AS [MATH], ISNULL([PHYSICS],0) AS [PHYSICS],ISNULL([SCIENCE],0) AS [SCIENCE],ISNULL([ART],0) AS [ART]
FROM 
(
SELECT SM.StudID,S.SubjectName, SM.Score
FROM
#StudentMarks AS SM 
INNER JOIN #Subjects AS S
ON SM.SubjectID = S.SubjectID
) AS tbl
PIVOT
(
SUM(Score)
FOR SubjectName IN
([MATH],[PHYSICS],[SCIENCE],[ART])
) AS hi
UNION ALL
SELECT *
FROM 
(
SELECT SM.StudID,S.SubjectName, SM.Score
FROM
#StudentMarks AS SM 
INNER JOIN #Subjects AS S
ON SM.SubjectID = S.SubjectID
) AS tbl
PIVOT
(
COUNT(Score)
FOR SubjectName IN
([MATH],[PHYSICS],[SCIENCE],[ART])
) AS hi
UNION ALL
SELECT *
FROM 
(
SELECT SM.StudID,S.SubjectName, SM.Score
FROM
#StudentMarks AS SM 
INNER JOIN #Subjects AS S
ON SM.SubjectID = S.SubjectID
) AS tbl
PIVOT
(
MIN(Score)
FOR SubjectName IN
([MATH],[PHYSICS],[SCIENCE],[ART])
) AS hi

-------

DECLARE @colnameList varchar(200)
SET @colnameList = NULL
SELECT @colnameList = COALESCE(@colnameList + ',','') + SubjectName
FROM #Subjects;
DECLARE @SQLQuery NVARCHAR(MAX)
SET @SQLQuery =
'SELECT StudID , '+@colnameList+'
FROM
( SELECT SM.StudID, S.SubjectName, SM.Score 
FROM #StudentMarks SM 
INNER JOIN #Subjects S
ON Sm.SubjectID = S.SubjectID
) AS tbl
PIVOT 
( Sum(Score)
FOR SubjectName IN ('+@colnameList+') ) as pvt'

EXEC(@SQLQuery)

---------

 CREATE table Name_employee(  
 prod_type NVARCHAR(20),  
 WEEK   NVARCHAR(20),  
 COD_ACCT NVARCHAR(20),  
 BBH NVARCHAR(20)  
 );

 INSERT INTO Name_employee VALUES 
 ('Salary',   '41306',    '12313',    'Vikas'),  
 ('Salary', '41306',    '311',  'Ramesh'),  
 ('Salary', '41306',    '55',   'Vicky'),  
 ('Salary', '41306',    '44',   'Vicky'),  
 ('Salary', '41313',    '33',   'Vikas'),  
 ('Salary', '41313',    '22',   'Vikas'),  
 ('Salary', '41313',    '11',   'Ramesh'),  
 ('Salary', '41313',    '99',   'Vicky'),  
 ('Salary', '41320',    '88',   'Vicky'),  
 ('Salary', '41320',    '76',   'Vikas'),  
 ('Salary', '41320',    '545',  'Ramesh'),  
 ('Savings',    '41306',    '3',    'Vicky'),  
 ('Savings',    '41306',    '27',   'Ramesh'),  
 ('Savings',    '41306',    '324',  'Ramesh'),  
 ('Savings',    '41306',    '887',  'Vikas'),  
 ('Savings',    '41313',    '998',  'Vicky'),  
 ('Savings',    '41313',    '6754', 'Vikas'),  
 ('Savings',    '41313',    '3457', 'Ramesh'),  
 ('Savings',    '41313',    '5434', 'Vicky'),  
 ('Savings',    '41320',    '6554', 'Ramesh'),  
 ('Savings',    '41320',    '3322', 'Ramesh'),  
 ('Savings',    '41320',    '6542', 'Vikas')  
 ;

 select 
  case when bbh is null then 'Grand Total' else bbh end bbh,
  sum([Salary_2013-02-03]) [Salary_2013-02-03], 
  sum([Salary_2013-02-10]) [Salary_2013-02-10], 
  sum([Salary_2013-02-17]) [Salary_2013-02-17],
  sum([Salary_2013-02-03]+[Salary_2013-02-10]+[Salary_2013-02-17]) ST,
  sum([Savings_2013-02-03]) [Savings_2013-02-03],
  sum([Savings_2013-02-10]) [Savings_2013-02-10], 
  sum([Savings_2013-02-17]) [Savings_2013-02-17],
  sum([Savings_2013-02-03]+[Savings_2013-02-10]+[Savings_2013-02-17]) STT
from 
(
  select 
    prod_type +'_'+
    convert(varchar(10), cast(cast(week as int) as datetime), 120) week, 
    cod_acct, 
    bbh
  from Name_employee
) src
pivot
(
  count(cod_acct)
  for week in ([Salary_2013-02-03], [Salary_2013-02-10], 
               [Salary_2013-02-17], [Savings_2013-02-03],
               [Savings_2013-02-10], [Savings_2013-02-17])
) piv
group by grouping sets((bbh), ())
----------------------------------------------

-------------subquery

SELECT Source, Destination,tm.PersonId, BusesName, Class, b.PersonId, Adult
FROM Buses AS b
JOIN TransportMediums AS tm ON tm.PersonId = b.PersonId
WHERE Adult > 
(
SELECT AVG(Adult) FROM Buses
)

------

SELECT MAX(ATMPersonId) AS MPersonId
FROM
(
SELECT Source, Destination,AVG(tm.PersonId) AS ATMPersonId, BusesName, Class, Adult
FROM TransportMediums AS tm
JOIN Buses AS b ON b.PersonId = tm.PersonId 
GROUP BY Source, Destination,BusesName, Class, Adult
) AS PersonId


--;WITH RECURSIVE cte_chain
--AS
--(
--SELECT
--Id,
--Source, Destination,PersonId
--Source + ' ' + Destination AS Chain
--FROM TransportMediums
----WHERE PersonId IS NOT NULL
--UNION ALL
--SELECT
--tm.Source, tm.Destination,tm.Id,tm.PersonId,
--chain + '->' + tm.Source + ' ' + tm.Destination AS Chain
--FROM cte_chain AS cc 
--JOIN TransportMediums AS tm ON cc.Id = tm.PersonId
--)
--SELECT Source, Destination , chain FROM cte_chain



DECLARE @columns NVARCHAR(MAX) = '';
SELECT 
	@columns  += QUOTENAME(VehicleModel) + ','
	FROM RentVehicles
	ORDER BY VehicleModel;
SET @columns = LEFT(@columns,LEN(@columns) - 1)

PRINT @columns;


---------subquery

SELECT HotelName,h.Rooms ,h.PriceWithFood,h.PriceWithoutFood,h.Date
FROM Hotels AS h
WHERE PersonId IN 
(
SELECT PersonId FROM RentVehicles WHERE VehicleType = 'Scooter'
)
ORDER BY h.Date DESC

----------
select * from UserDashboards
select * from TransportMediums

SELECT Source,Destination, EndDate, StartDate
FROM TransportMediums
WHERE Price >
(
SELECT
AVG(Price)
FROM RentVehicles
WHERE PersonId IN
(
SELECT PersonId 
FROM UserDashboards
WHERE BookingDetails = 'mumbai'
	
) )
ORDER BY Price ASC

-----------

SELECT Source, Destination, EndDate,StartDate
FROM TransportMediums
WHERE Price >= ANY
(
SELECT AVG(Price) FROM RentVehicles GROUP BY  PersonId
)

--------

SELECT BusesName,Class
FROM Buses
WHERE PersonId >= ALL
(
SELECT COUNT(PersonId) FROM Hotels GROUP BY  PersonId
)

--------

SELECT VehicleModel, VehicleType,Price
FROM
    RentVehicles AS rv
WHERE
    EXISTS (
        SELECT
            HotelName, Rooms, PriceWithFood,PriceWithoutFood
        FROM
            Hotels AS h
        WHERE
            h.PersonId = rv.PersonId
        AND YEAR (Date) = 2022
    )
ORDER BY
   VehicleModel, VehicleType

----------

SELECT BookingDetails, Wallet
FROM
    UserDashboards AS ud
WHERE
    NOT EXISTS (
        SELECT
            PersonId
        FROM
            TransportMediums AS tm
        WHERE
            tm.PersonId = ud.PersonId
        AND YEAR (StartDate) = 2022
    )
ORDER BY
    BookingDetails, Wallet

--------------------

SELECT 
   AVG(Person_Count) Personid
FROM
(
    SELECT 
	VehicleLocation, 
        COUNT(PersonId) Person_Count
    FROM 
	RentVehicles
    GROUP BY 
	VehicleLocation
) t;	

--------

SELECT Source,Destination, PersonId, Price
FROM TransportMediums AS tm
WHERE Price IN(
SELECT MAX(Price) 
FROM Flights AS f
WHERE tm.Price = f.Price
GROUP BY Price
)
ORDER BY Source,Destination, PersonId

--------

ALTER PROCEDURE spProbla
(
@No1 INT,
@No2 INT
)
AS
BEGIN
	DECLARE @Result INT
	SET @Result = 0
	IF(@No2 = 0)
	BEGIN
		RAISERROR('SECOND NO CANT BE ZERO',18,3);
	END
	ELSE
	BEGIN
		SET @Result = @No1/@No2
		PRINT 'Result is: ' + CAST(@Result AS VARCHAR)
	END
	IF(@@ERROR <> 0)
	BEGIN
		PRINT 'ERROR OCCURED';
	END
	ELSE
	BEGIN
		PRINT 'RESULT IS:' + CAST(@Result AS VARCHAR)
	END
END

EXECUTE spProbla @No1= 100, @No2= 0
/*

Error Number - Msg 50000, 
Error Severity Level- 18, 
Error State - State 3, Procedure spProbla, Line 12 [Batch Start Line 305]

*/
