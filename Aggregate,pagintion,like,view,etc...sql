---------- Sample Aggregate Function ----------------

----CAST(ROUND(VARP()))
SELECT
    CAST(ROUND(VARP(PriceWithoutFood),2) as DEC(10,2)) pof
FROM
    Hotels;

----CAST(ROUND(VAR()))
SELECT
    CAST(ROUND(VAR(PriceWithoutFood),2) as DEC(10,2)) pof
FROM
    Hotels;

---------- CAST(ROUND(STDEV()))
SELECT
    CAST(ROUND(STDEV(PriceWithoutFood),2) as DEC(10,2)) pof
FROM
    Hotels;


-----CAST(ROUND(AVG()))
SELECT
    CAST(ROUND(AVG(PriceWithFood),2) AS DEC(10,2))
    pwf
FROM
    Hotels;

------STRING_AGG()
SELECT
    Name, 
    STRING_AGG(email,';') email_list
FROM
   Registrations
GROUP BY
    Name

-------GROUPING_ID()
SELECT COUNT_BIG(*) AS data, BusesName 
FROM Buses
GROUP BY BusesName
HAVING COUNT_BIG(*) > 0

-----GROUPING()
SELECT COUNT_BIG(*) AS data, HotelName
FROM Hotels
GROUP BY HotelName
HAVING COUNT_BIG(*) > 0

-----COUNT_BIG()

SELECT COUNT_BIG(*) AS data, VehicleModel
FROM RentVehicles
GROUP BY VehicleModel
HAVING COUNT_BIG(*) > 0

---- CHECHKSUM_AGG()

SELECT CHECKSUM_AGG(PersonId) AS pn, Price
FROM RentVehicles
GROUP BY Price
HAVING CHECKSUM_AGG(PersonId) > 1


----------------- MAX, MIN, SUM, AVG, COUNT -------------------------------
SELECT * FROM RentVehicles;
SELECT * FROM Registrations;
SELECT * FROM VehicleLocations;
SELECT * FROM UserDashboards;
SELECT * FROM Hotels;

SELECT	r.Name,HotelName ,SUM(PriceWithFood) AS pwf, AVG(PriceWithoutFood) AS pof,
		BookingDetails, MIN(Wallet) AS w, MAX(rv.Price) AS price, VehicleModel,COUNT(PersonNumber) AS pn
		FROM Registrations AS r
		JOIN Hotels AS h ON r.Id = h.PersonId
		JOIN UserDashboards AS ud ON ud.PersonId = r.Id
		--JOIN VehicleLocations AS vl ON vl.Location= rv.VehicleLocation
		JOIN RentVehicles AS rv ON rv.PersonId = r.Id
		GROUP BY r.Name,HotelName,BookingDetails, VehicleModel
		HAVING 
		SUM(PriceWithFood) > 1000  AND AVG(PriceWithoutFood) > 1000  AND
		MIN(Wallet) > 100  AND MAX(rv.Price) > 100  AND COUNT(PersonNumber) > 0
---------------

---------------
SELECT * FROM Registrations;--**			
SELECT * FROM Hotels;--					 
SELECT * FROM UserDashboards;

SELECT r.Name,h.HotelName,Rooms,AVG(Wallet) AS w, Gender, PaymentType, SUM(PriceWithFood) AS pwf, MAX(PriceWithoutFood) AS pof
FROM Registrations AS r
JOIN Hotels AS h ON r.Id = h.PersonId
JOIN UserDashboards AS ub ON ub.PersonId = r.Id 
GROUP BY Gender, PaymentType,r.Name,h.HotelName,Rooms
HAVING AVG(Wallet) > 150 AND SUM(PriceWithFood) >5000 AND MAX(PriceWithoutFood) > 1500


-------- SINGLE
SELECT h.HotelName,Rooms,SUM(PriceWithFood) AS pwf, AVG(PriceWithoutFood) AS pof, MAX(PersonId) AS pi,MIN(VehicleLocation) AS vl
FROM Hotels AS h
GROUP BY h.HotelName,Rooms
HAVING SUM(PriceWithFood) > 7000 AND AVG(PriceWithoutFood) > 1000 AND MAX(PersonId) > 5 AND MIN(VehicleLocation) > 3

---------------------- JOIN MAX ----------------------

SELECT r.Name, rv.VehicleModel,ShopName,vl.Location ,MAX(PriceWithFood) AS pwf, MAX(PriceWithoutFood) AS pof, MAX(rv.Price) AS price
FROM Registrations AS r
JOIN RentVehicles AS rv ON r.Id = rv.PersonId
JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation 
JOIN Hotels AS h ON h.VehicleLocation = vl.Id
GROUP BY r.Name, rv.VehicleModel, ShopName, vl.Location
HAVING MAX(PriceWithFood) > 1000 AND MAX(PriceWithoutFood) > 6000 AND MAX(rv.Price) > 200

--------

SELECT r.Name,f.FlightName, t.TrainName, b.BusesName,MAX(tm.Price) AS price
FROM Registrations AS r
JOIN TransportMediums AS tm ON tm.PersonId = r.Id
JOIN TransportWays AS tw ON tw.Id = tm.TransportWay 
JOIN Flights AS f ON r.Id = f.PersonId
JOIN Trains AS t ON t.PersonId = r.Id
JOIN Buses AS b ON b.PersonId = r.Id
GROUP BY r.Name, f.FlightName, t.trainName, b.BusesName
HAVING MAX(tm.Price) > 1500

------------------

SELECT r.Name,HotelName, MAX(PriceWithFood) AS pwf, MAX(PriceWithoutFood) AS pof
FROM Registrations AS r
JOIN Hotels AS h ON h.PersonId =r.Id
GROUP BY r.Name, HotelName
HAVING MAX(PriceWithFood) > 1000 AND MAX(PriceWithoutFood) > 7200

------------------- SINGLE MAX --------------------------

SELECT MAX(Wallet),BookingDetails
FROM UserDashboards AS ud
GROUP BY BookingDetails
HAVING MAX(Wallet) > 1000

--------
SELECT HotelName, MAX(PriceWithFood) AS pwf, MAX(PriceWithoutFood) AS pof
FROM Hotels AS h
GROUP BY HotelName
HAVING MAX(PriceWithFood) > 7500 

-----------------------------------

SELECT Class, MAX(Price) AS p FROM Buses AS b GROUP BY Class HAVING MAX(Price) > 1200
SELECT Class, MIN(Price) AS p FROM Buses AS b GROUP BY Class HAVING MIN(Price) > 1

------------------------- JOIN MIN -----------------------
SELECT * FROM TransportMediums

SELECT r.Name, MIN(tm.Price) AS price,HotelName, Location
FROM Registrations AS r
JOIN RentVehicles AS rv ON rv.PersonId =r.Id
JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
JOIN Hotels AS h ON h.PersonId = r.Id
JOIN TransportMediums AS tm ON tm.PersonId = r.Id
GROUP BY r.Name, HotelName, Location
HAVING MIN(tm.Price) > 1500
ORDER BY MIN(tm.Price) ASC

-------------------------------

SELECT r.Name, MIN(tm.Price) AS price
FROM Registrations AS r
JOIN transportMediums AS tm ON tm.PersonId = r.Id
JOIN Buses AS b ON b.PersonId = r.Id
JOIN Flights AS f ON f.PersonId =r.Id
JOIN Trains AS t ON t.PersonId = r.Id
GROUP BY r.Name
HAVING MIN(tm.Price) > 2000

---------------------
SELECT r.Name,vp.PlacesId, MIN(Wallet) AS wallet
FROM UserDashboards AS ud
JOIN Registrations AS  r ON r.Id =ud.PersonId
JOIN VisitPlaces AS vp  ON vp.Id = r.Id
GROUP BY r.Name,vp.PlacesId
HAVING MIN(Wallet) > 500

----------------- SINGLE MIN -------------------------

SELECT VehicleType, MIN(Price) AS price
FROM RentVehicles AS rv
GROUP BY VehicleType
HAVING MIN(Price) > 0

---------------------------------------------

SELECT Class, MIN(Price) AS price
FROM Trains AS t
GROUP BY Class
HAVING MIN(Price) > 0

-----------------------------

SELECT MIN(Price) AS bn FROM Buses HAVING MIN(Price) >0

--------------- JOIN AVG ------------------------
SELECT r.Name, AVG(PriceWithFood) AS pwf , Rooms 
FROM Hotels AS h
JOIN Registrations AS r ON r.Id = h.PersonId
GROUP BY Rooms,r.Name
HAVING AVG(PriceWithFood) > 0
ORDER BY Rooms DESC

-----------------
SELECT r.Name, AVG(Price) AS price , VehicleType 
FROM RentVehicles AS rv
JOIN Registrations AS r ON r.Id = rv.PersonId
GROUP BY VehicleType,
CUBE(r.Name)
HAVING AVG(Price) > 0

--------------- SINGLE AVG -----------------

SELECT AVG(Price) AS price , VehicleType 
FROM RentVehicles AS rv
GROUP BY VehicleType
HAVING AVG(Price) > 0
-----------------------------------------------
SELECT AVG(Wallet) AS w , PaymentType 
FROM UserDashboards AS ub
GROUP BY PaymentType
HAVING AVG(Wallet) > 0
-------------------------------------------------
SELECT Rooms,AVG(PriceWithFood) AS pwf, AVG(PriceWithoutFood) AS pof
FROM Hotels AS h
GROUP BY Rooms
HAVING AVG(PriceWithFood) > 0
----------------------------------------------
SELECT AVG(Price) AS price ,Class 
FROM Trains AS t
GROUP BY Class
HAVING AVG(Price) > 0
----------------------------------------------
SELECT AVG(Price) AS p FROM Buses HAVING AVG(Price) >0
SELECT SUM(Price) AS p  FROM Buses HAVING AVG(Price) > 0
SELECT * FROM Buses

---------------------- JOIN SUM --------------------------
SELECT * FROM UserDashboards
SELECT * FROM Hotels
SELECT * FROM Registrations

SELECT r.Name,ub.PaymentType, h.HotelName, SUM(PriceWithFood) AS pwf, SUM(PriceWithoutFood) AS pof, Wallet
FROM Hotels AS h
JOIN Registrations AS r ON r.Id = h.PersonId 
JOIN UserDashboards AS ub ON ub.PersonId = r.Id
--WHERE Wallet > 700
GROUP BY 
GROUPING SETS
(
(r.Name,ub.PaymentType, h.HotelName, Wallet),
(r.Name,ub.PaymentType, h.HotelName),
(r.Name,ub.PaymentType),
(ub.PaymentType, h.HotelName, Wallet),
(h.HotelName, Wallet),
(r.Name, Wallet),
(r.Name),
(ub.PaymentType),
(h.HotelName),
(Wallet),
()
)
HAVING SUM(PriceWithFood) > 8000 AND SUM(PriceWithoutFood) >5000
ORDER BY Name ASC

----------

SELECT Class, SUM(Price) AS p, r.Name
FROM Buses AS b
JOIN Registrations AS r ON b.PersonId = r.Id
GROUP BY CUBE(Class, r.Name)
HAVING SUM(Price) > 0
ORDER BY r.Name;


------------

SELECT r.Name, PaymentType, Gender, SUM(Wallet) AS w
FROM UserDashboards AS ub
JOIN Registrations AS r ON r.Id = ub.PersonId
GROUP BY r.Name, PaymentType, Gender
HAVING SUM(Wallet) > 0

----- SINGLE TABLE SUM ----

SELECT * FROM Registrations;
SELECT * FROM Hotels;
SELECT * FROM UserDashboards;

--------------------
SELECT PaymentType,Gender, SUM(Wallet) AS w
FROM UserDashboards AS ub
GROUP BY PaymentType,Gender
HAVING SUM(Wallet) > 0
--------------------
SELECT Class, SUM(Price) AS c
FROM Flights AS f
GROUP BY Class
HAVING SUM(Price) > 0;
-----------------------
SELECT Class, SUM(Price) AS c
FROM Trains AS t
GROUP BY Class
HAVING SUM(Price) > 0;
----------------
SELECT Class, SUM(Price) AS c
FROM Buses AS b
GROUP BY Class
HAVING SUM(Price) > 0;
------------
SELECT SUM(Wallet) AS w , PaymentType
FROM UserDashboards
GROUP BY PaymentType
HAVING SUM(Wallet) >0;

----- THREE AND FOUR AND FIVE TABLE COUNT -------

SELECT * FROM Registrations;
SELECT * FROM Hotels;
SELECT * FROM UserDashboards;

SELECT ub.Wallet,r.Name,h.HotelName, COUNT(ub.PaymentType) AS pt
FROM UserDashboards AS ub
JOIN Hotels AS h ON h.PersonId = ub.PersonId
JOIN Registrations AS r ON r.Id = h.PersonId
--WHERE 
GROUP BY ub.Wallet,r.Name,h.HotelName
HAVING COUNT(ub.PaymentType) > 0
ORDER BY h.HotelName ASC
----------------
SELECT * FROM Registrations;
SELECT * FROM RentVehicles;
SELECT * FROM VehicleLocations;
SELECT * FROM Hotels;

SELECT r.Name, hotelName,vl.Location, COUNT(h.Rooms) AS hr, VehicleModel
FROM VehicleLocations AS vl 
JOIN RentVehicles AS rv ON rv.VehicleLocation = vl.Id
JOIN Registrations AS r ON r.Id = rv.PersonId
JOIN Hotels AS h ON h.VehicleLocation = vl.Id
--WHERE Location ='Ahmedabad'
GROUP BY  r.Name, hotelName,vl.Location, VehicleModel
HAVING COUNT(h.Rooms) > 0
ORDER BY r.Name ASC
-------------------------
SELECT * FROM Registrations;
SELECT * FROM TransportMediums;
SELECT * FROM TransportWays;
SELECT * FROM Trains;
SELECT * FROM Flights;
SELECT * FROM Buses

----------- find bus, train, flight of Order by or(particular person and) source ---------------

SELECT tm.Source, COUNT(tw.Id) AS ti, r.Name, b.BusesName,f.FlightName, t.TrainName 
FROM TransportMediums AS tm
JOIN TransportWays AS tw ON tm.TransportWay = tw.Id
JOIN Buses AS b ON b.Id = tw.BusesId
JOIN Trains AS t ON t.Id = tw.TrainId
JOIN Flights AS f ON f.Id = tw.FlightId
JOIN Registrations AS r ON r.Id = tm.PersonId
--WHERE Name = 'Shubham Mistry'
GROUP BY tm.Source,r.Name, b.BusesName,f.FlightName, t.TrainName 
HAVING COUNT(tw.Id) > 0
ORDER BY Source ASC
-------------------
SELECT * FROM Guides;
SELECT * FROM Places;
SELECT * FROM VisitPlaces;

SELECT vs.Id, COUNT(vs.PlacesId) AS Id, p.PlaceName, g.GuideName, r.Name
FROM VisitPlaces AS vs
JOIN Guides AS g ON g.Id = GuidesId
JOIN Places AS p ON p.Id = PlacesId
JOIN Registrations AS r ON r.Id = vs.PersonId
GROUP BY vs.Id,p.PlaceName, g.GuideName, r.Name
HAVING COUNT(vs.PlacesId) > 0
ORDER BY p.PlaceName ASC

----- TWO TABLE COUNT -------

SELECT * FROM TransportWays
SELECT * FROM TransportMediums

SELECT COUNT(tw.Id) AS data,tm.Id
FROM TransportWays AS tw 
FULL OUTER JOIN TransportMediums AS tm ON tm.TransportWay = tw.Id 
GROUP BY tm.Id
HAVING COUNT(tw.Id) > 0
ORDER BY
---------------

SELECT * FROM VehicleLocations;
SELECT * FROM RentVehicles

SELECT COUNT(rv.VehicleLocation) AS l, vl.ShopName
FROM RentVehicles AS rv
JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
GROUP BY vl.ShopName
HAVING COUNT(rv.VehicleLocation) > 1
ORDER BY vl.ShopName DESC
-------
SELECT COUNT(b.Adult) AS b,tw.Id
FROM TransportWays AS tw
JOIN Buses AS b ON b.Id = tw.Id
GROUP BY  tw.Id 
HAVING COUNT(b.Adult) > 0 

-------------
SELECT * FROM Flights
SELECT Class, COUNT(r.Id) AS adult
FROM Flights AS f
JOIN Registrations AS r ON r.Id = f.PersonId
GROUP BY Class
HAVING COUNT(r.Id) > 1
------------
SELECT Adult,Child,t.Class, COUNT(r.Id) AS price
FROM Trains AS t
JOIN Registrations AS r ON r.Id = t.PersonId
GROUP BY Adult,Child,t.Class
HAVING COUNT(r.Id) > 1
ORDER BY COUNT(t.Class) ASC 

SELECT * FROM TransportWays
---------------
SELECT r.Name, COUNT(Class) AS class
FROM Buses AS b
JOIN Registrations AS r ON r.Id = b.PersonId
GROUP BY r.Name
HAVING COUNT(Class) = 1

----- SINGLE TABLE COUNT ----
-------
SELECT HotelName, COUNT(PriceWithFood) AS pwf, COUNT(PriceWithoutFood) AS pof
FROM Hotels AS h
GROUP BY HotelName
HAVING COUNT(PriceWithFood) >0
------------
SELECT Name,COUNT(Id) AS Id
FROM  Registrations AS r
GROUP BY  Name
HAVING COUNT(Id) = 1
ORDER BY COUNT(Name) DESC;
-----------
SELECT Rooms,COUNT(Id) AS Id
FROM  Hotels AS h
GROUP BY  Rooms
HAVING COUNT(Id) > 1
ORDER BY COUNT(HotelName) ASC;
--------------
SELECT PaymentType,COUNT(Id) AS Id
FROM  UserDashboards AS ub
GROUP BY  PaymentType
HAVING COUNT(Id) > 1
-----------------
SELECT GuideName ,COUNT(GuideCar) AS Id
FROM Guides AS g
GROUP BY GuideName
HAVING COUNT(GuideCar) > 0
ORDER BY COUNT(GuideName) ASC;
----------------------
SELECT p.Id, COUNT(PlaceName) AS Id
FROM Places AS p
GROUP BY p.Id
HAVING COUNT(PlaceName) > 0
ORDER BY COUNT(PlaceName) ASC;
---------------
SELECT vp.Id, COUNT(GuidesId) AS Id
FROM VisitPlaces AS vp
GROUP BY vp.Id
HAVING COUNT(GuidesId) > 0
---------------------
SELECT Price,COUNT(vl.Id) AS Id
FROM VehicleLocations AS vl 
GROUP BY Price
HAVING COUNT(vl.Id) > 1
-----------------
SELECT tm.Price, COUNT(tm.Id) AS Id
FROM TransportMediums AS tm
GROUP BY tm.Price
HAVING COUNT(tm.Id) > 1
--------------------
SELECT rv.VehicleType, COUNT(rv.Id) AS Id
FROM RentVehicles AS rv 
GROUP BY rv.VehicleType
HAVING COUNT(rv.Id) > 1
---------------------
SELECT tw.BusesId, COUNT(tw.Id) AS Id
FROM TransportWays AS tw 
GROUP BY tw.BusesId
HAVING COUNT(tw.Id) > 2
-----------------------
SELECT f.Class, COUNT(F.Id) AS fi
FROM Flights AS f
GROUP BY f.Class
HAVING COUNT(f.Id) > 1 
---------------
SELECT t.Class, COUNT(t.PersonId) AS ti
FROM Trains AS t
GROUP BY t.Class
HAVING COUNT(t.PersonId) >1
-----------------
SELECT b.Class,COUNT(b.Id) AS bi
FROM Buses AS b
GROUP BY b.Class
HAVING COUNT(b.Id) > 1
ORDER BY COUNT(b.Id) ASC

----------------

SELECT ud.Wallet, COUNT(r.Id) AS ui
FROM UserDashboards AS ud
JOIN Registrations AS r ON r.Id = ud.PersonId
GROUP BY ud.Wallet
HAVING COUNT(ud.Wallet) > 1
ORDER BY ud.Wallet ASC

----------- RAND()-------
SELECT RAND(6) AS rand

--------------- SELECT * INTO New_table FROM Parent_table_data----------
	
SELECT * INTO Logins FROM Registrations
----------- EXISTS ----------
SELECT Name 
FROM Registrations
WHERE EXISTS (SELECT HotelName FROM Hotels WHERE Registrations.Id = Hotels.PersonId ); 
---------------- MINUS ----------------
SELECT Id FROM Registrations
MINUS
SELECT PersonId FROM RentVehicles 

---------------- EXCEPT ------------------
SELECT Id FROM Registrations
EXCEPT
SELECT PersonId FROM RentVehicles 

------------- INTERSECT ------------

SELECT Id FROM Registrations
INTERSECT 
SELECT PersonId FROM RentVehicles 

-------------- DISTINCT ------------------

SELECT DISTINCT VehicleModel FROM RentVehicles

-------------- SELECT TOP OR LIMIT ------------
SELECT TOP 10* FROM RentVehicles

SELECT TOP 8* FROM Buses

-----------------  IS NULL AND IS NOT NULL ----------------

SELECT * 
FROM RentVehicles 
WHERE VehicleModel IS NULL;

SELECT * 
FROM RentVehicles 
WHERE VehicleModel IS NOT NULL;


------------------- LIKE ---------------------
---start with p
SELECT * FROM Places WHERE PlaceName LIKE 'p%';
---last letter with j
SELECT * FROM Places WHERE PlaceName LIKE '%j';
---in between ea 
SELECT * FROM Places WHERE PlaceName LIKE '%ea%';
---second letter with a
SELECT * FROM Places WHERE PlaceName LIKE '_a%';
---starts with m
SELECT * FROM Places WHERE PlaceName LIKE 'm_%';
---start with m and ends with e
SELECT * FROM Places WHERE PlaceName LIKE 'm%e';
---not start with r
SELECT * FROM Places WHERE PlaceName NOT LIKE 'r%';

------------------ BETWEEN AND NOT BETWEEN -----------------------
SELECT * 
FROM Buses
WHERE Price
BETWEEN 1850 AND 2000

SELECT * 
FROM Trains
WHERE Price
NOT BETWEEN 1200 AND 8000

-------------------- IN AND NOT IN ---------------------------

SELECT *
FROM Buses
WHERE BusesName <> 'samyak'
AND BusesName <> 'patel'  
AND BusesName <> 'carat'
AND BusesName <> 'lion';

SELECT *
FROM RentVehicles
WHERE VehicleModel
NOT IN('Activa','Normal','Amaze');

SELECT * FROM RentVehicles 
WHERE VehicleModel IN('Activa','Amaze','Bullet','normal')
ORDER BY VehicleModel;

SELECT * FROM Registrations 
WHERE Name IN('Sanjana Vora', 'Bipin Padhiyar', 'Shivam Soni', 'Tanvi Desai');

SELECT * 
FROM Trains
WHERE TrainName = 'lent'
OR TrainName = 'express'
OR TrainName = 'flow'
OR TrainName = 'silver'
------------------ UNION ----------------------

SELECT PersonId FROM RentVehicles
UNION
SELECT Id FROM Registrations
ORDER BY PersonId

SELECT Id FROM Buses
UNION
SELECT BusesId FROM TransportWays  

SELECT Id FROM Registrations
UNION ALL
SELECT Id FROM TransportMediums
ORDER BY Id ASC

----------------------- VIEW ----------------------

CREATE VIEW [offline BookinDetails] AS 
SELECT Gender, Wallet
FROM UserDashboards
WHERE PaymentType = 'offline';

SELECT * FROM [offline BookinDetails];

CREATE OR REPLACE VIEW [offline BookinDetails] AS 
SELECT Gender, Wallet,PersonId
FROM UserDashboards
WHERE PaymentType = 'offline';

DROP VIEW [offline BookingDetails];

SELECT HotelName, Rooms, PriceWithFood
FROM Hotels
ORDER BY HotelName
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;
---------- RAND()-------
SELECT RAND(6) AS rand

--------------- SELECT * INTO New_table FROM Parent_table_data----------
SELECT * FROM Logins
SELECT * INTO Logins FROM Registrations
----------- EXISTS ----------
SELECT Name 
FROM Registrations
WHERE EXISTS (SELECT HotelName FROM Hotels WHERE Registrations.Id = Hotels.PersonId); 
---------------- MINUS ----------------
SELECT Id FROM Registrations
MINUS
SELECT PersonId FROM RentVehicles 

---------------- EXCEPT ------------------
SELECT * FROM Registrations
SELECT * FROM RentVehicles

SELECT Id FROM Registrations
EXCEPT
SELECT PersonId FROM RentVehicles 

------------- INTERSECT ------------
SELECT * FROM Registrations
SELECT * FROM RentVehicles

SELECT Id FROM Registrations
INTERSECT 
SELECT PersonId FROM RentVehicles 

-------------- DISTINCT ------------------

SELECT DISTINCT VehicleModel FROM RentVehicles

-------------- SELECT TOP OR LIMIT ------------
SELECT TOP 10* FROM RentVehicles

SELECT TOP 8* FROM Buses

-----------------  IS NULL AND IS NOT NULL ----------------

SELECT * 
FROM VisitPlaces 
WHERE PersonId IS NULL;

SELECT * 
FROM VisitPlaces 
WHERE PersonId IS NOT NULL;


------------------- LIKE ---------------------
---start with p
SELECT * FROM Places WHERE PlaceName LIKE 'p%';
---last letter with j
SELECT * FROM Places WHERE PlaceName LIKE '%j';
---in between ea 
SELECT * FROM Places WHERE PlaceName LIKE '%ea%';
---second letter with a
SELECT * FROM Places WHERE PlaceName LIKE '_a%';
---starts with m
SELECT * FROM Places WHERE PlaceName LIKE 'm_%';
---start with m and ends with e
SELECT * FROM Places WHERE PlaceName LIKE 'm%e';
---not start with r
SELECT * FROM Places WHERE PlaceName NOT LIKE 'r%';
---letter start with 'M' and has the letter 'A' with position fourth-to-last character
SELECT * FROM Places WHERE PlaceName LIKE 'M_%a%';
---name contains exactly five characters
SELECT * FROM Places WHERE PlaceName LIKE '_____';
---letter 'M' and has the letter 'A' as the third-to-last character.
SELECT * FROM Places WHERE PlaceName LIKE 'M%A__';
---The square brackets with a list of characters [list of characters]
--[TA] represents a single character that must be one of the characters specified in the list.
SELECT * FROM Places WHERE PlaceName LIKE '[TA]%';
---The square brackets with a character range [character-character]
--[A-M] represent a single character that must be within a specified range.
SELECT * FROM Places WHERE PlaceName LIKE '[A-M]%';
---The square brackets with a caret sign (^) followed by a range [^Character List or Range]
--[^A-N] represent a single character that is not in the specified range or character list.
SELECT * FROM Places WHERE PlaceName LIKE '[^A-N]%';
--------------------------
/*
the  ESCAPE clause specified that the character ! is the escape character. It instructs the LIKE operator 
to treat the % character as a literal string instead of a wildcard. 
Note that without the ESCAPE clause, the query would return an empty result set.
*/
CREATE TABLE feedbacks (
   feedback_id INT IDENTITY(1, 1) PRIMARY KEY, 
    comment     VARCHAR(255) NOT NULL
);
INSERT INTO feedbacks(comment)
VALUES('Can you give me 30% discount?'),
      ('May I get me 30USD off?'),
      ('Is this having 20% discount today?');

SELECT 
   feedback_id, 
   comment
FROM 
   feedbacks
WHERE 
   comment LIKE '%30!%%' ESCAPE '!';
------------------ BETWEEN AND NOT BETWEEN -----------------------
SELECT * 
FROM Buses
WHERE Price
BETWEEN 1850 AND 2000

SELECT * 
FROM Trains

SELECT * 
FROM Trains
WHERE Price
NOT BETWEEN 1200 AND 8000

SELECT * 
FROM Flights
WHERE FlightName
BETWEEN  'bird' AND 'indigo' 


SELECT * 
FROM Registrations ORDER BY Name

SELECT * 
FROM Registrations
WHERE Name
BETWEEN  'Asthaa Sheikh' AND 'Ishan Soni' 

-------------------- IN AND NOT IN ---------------------------
-----------NOT IN

SELECT *
FROM Buses
WHERE BusesName <> 'samyak'
AND BusesName <> 'patel'  
AND BusesName <> 'carat'
AND BusesName <> 'lion';

SELECT *
FROM RentVehicles
WHERE  VehicleModel <> 'Activa'
AND VehicleModel <> 'Normal'
AND VehicleModel <> 'Bullet'

SELECT * 
FROM RentVehicles
WHERE VehicleModel 
NOT IN('Pulzar', 'Amaze', 'Baleno')

SELECT *
FROM RentVehicles
WHERE VehicleModel
NOT IN('Activa','Normal','Amaze');

---------------IN

SELECT * 
FROM VehicleLocations
WHERE ShopName IN('uma', 'mohammad', 'hydear')

SELECT * FROM RentVehicles 
WHERE VehicleModel IN('Activa','Amaze','Bullet','normal')
ORDER BY VehicleModel;

SELECT * FROM Registrations 
WHERE Name IN('Sanjana Vora', 'Bipin Padhiyar', 'Shivam Soni', 'Tanvi Desai');

SELECT * 
FROM VehicleLocations
WHERE ShopName = 'abdul'
OR ShopName = 'indory'
OR ShopName = 'bhavani'
-------------------
SELECT * 
FROM Trains
WHERE TrainName = 'lent'
OR TrainName = 'express'
OR TrainName = 'flow'
OR TrainName = 'silver'
------------------ UNION ----------------------

SELECT PersonId FROM RentVehicles
UNION
SELECT Id FROM Registrations
ORDER BY PersonId

SELECT * FROM RentVehicles

SELECT Id FROM Buses
UNION
SELECT BusesId FROM TransportWays  

SELECT Id FROM Registrations
UNION ALL
SELECT Id FROM TransportMediums
ORDER BY Id ASC

------------- VIEW
ALTER VIEW [BusesNames] AS
SELECT Price, PersonId, BusesName, Class
FROM Buses
WHERE Price > ( SELECT AVG(Price) FROM Buses) 
--ORDER BY PersonId

SELECT * FROM [BusesNames]
DROP VIEW Busesnames
-------------------------OFFSET
SELECT BusesName,Price 
FROM Buses 
ORDER BY Id OFFSET 10 ROWS
SELECT BusesName,Price 
FROM Buses 
--------------------FETCH NEXT
SELECT BusesName,Price
FROM Buses
ORDER BY Id 
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY
SELECT BusesName,Price
FROM Buses
-----------------------------------------------------------------------------------------------------------
-----PAGINATION------

DECLARE @PageIndex INT = 1--its Holds Paging Value
DECLARE @PageSize INT = 2--its Holds Row Value

--WHILE(@PageIndex < 5)
BEGIN 
	SELECT * FROM(
	SELECT  ROW_NUMBER() OVER (ORDER BY [Price] DESC) AS RowNo , Id, VehicleModel, [Price] FROM RentVehicles
	) AS t
	
	WHERE RowNo >= (((@PageIndex-1) * @PageSize) + 1) AND RowNo <= (@PageIndex * @PageSize)
	SET @PageIndex +=1
END;

DECLARE @IndexPage INT = 1
DECLARE @SizePage INT = 6
BEGIN
SELECT * FROM(
SELECT ROW_NUMBER() OVER(ORDER BY [PriceWithFood] DESC) AS PWF,Id,HotelName,[PriceWithFood] FROM Hotels)AS h
WHERE PWF >= (((@IndexPage-1) * @SizePage) +1) AND PWF <= (@IndexPage * @SizePage)
SET @IndexPage +=2
END

------
DECLARE @First INT
DECLARE @Second INT

SET @First = 0
SELECT @Second  = COUNT(*) FROM RentVehicles
WHILE @Second >= @First + 4
BEGIN
SELECT Id, VehicleType, VehicleModel FROM RentVehicles
WHERE Id > @First AND Id <= @First + 4
SET @First = @First + 4
END
select * from hotels
select * from RentVehicles

DECLARE @LastRowName VARCHAR(20)
DECLARE @LoopCountMax INT
DECLARE @CurrentLoopCount INT
SET @LastRowName = ''; 

SELECT @LoopCountMax = COUNT(*) / 4 FROM Hotels
SET @CurrentLoopCount = 0
WHILE @CurrentLoopCount < @LoopCountMax
BEGIN
	SET @CurrentLoopCount = @CurrentLoopCount + 1
	SELECT TOP 4 VehicleType,VehicleModel,VehicleNumber FROM RentVehicles
	WHERE VehicleType+VehicleModel+VehicleNumber > @LastRowName
	ORDER BY VehicleType,VehicleModel,VehicleNumber
	SELECT TOP 4 @LastRowName =  VehicleType+VehicleModel+VehicleNumber FROM RentVehicles
	WHERE VehicleType + VehicleModel + VehicleNumber > @LastRowName
	ORDER BY VehicleType,VehicleModel,VehicleNumber
END
--------
SELECT * FROM #Registrations
DROP TABLE #Registrations
select * into #Registrations FROM Registrations
WITH cte_Registrations#
(
		SELECT 1 AS Id,CONCAT('user', FLOOR(1000*RAND(CHECKSUM(NEWID()))),'@outlook.com')AS Email 
		FROM Registrations
		UNION ALL
	   SELECT r.id + 1  AS id, CONCAT('user',floor(1000*RAND(CHECKSUM(NEWID()))),'@outlook.com')
	   FROM Registrations r
	   WHERE r.Id < 100
)
SELECT  *
INTO #Registrations
FROM #Registrations r;

--------
DECLARE @PageIndex1 INT = 3
DECLARE @PageSize1 INT = 10

BEGIN
	SELECT * FROM(
	SELECT ROW_NUMBER() OVER (ORDER BY [PriceWithFood] DESC) AS RowNo , HotelName, [PriceWithFood] FROM Hotels) AS p
	WHERE RowNo >= (((@PageIndex1-1) * @PageSize1) + 1) AND RowNo <= (@PageIndex1 * @PageSize1)
	SET @PageIndex1 += 1
END

SELECT * FROM RentVehicles

DECLARE @Count INT = 0;

DECLARE @PageSizeNew INT = 2;

WHILE(@Count < 10)
BEGIN
	SELECT * FROM RentVehicles ORDER BY Id
	OFFSET @Count ROWS
	FETCH NEXT @PageSizeNew ROWS ONLY
	PRINT @PageSizeNew
	SET @Count = @Count + 2
END;

--------
DROP TABLE #Registrations

SELECT * FROM #Regis
WITH cte_registrations (Id, email) AS 
(
   SELECT 1 AS id, CONCAT('user',floor(1000*RAND(CHECKSUM(NEWID()))),'@outlook.com') as email
   UNION ALL
   SELECT e.Id + 1  AS Id, CONCAT('user',floor(1000*RAND(CHECKSUM(NEWID()))),'@outlook.com')
   FROM #email e
   WHERE e.Id < 100
)
SELECT  *
INTO #Regis
FROM #email r;
GO

-------
CREATE TABLE #email
(
Id SMALLINT,
email VARCHAR(20)
)

DECLARE @count smallint = 0

WHILE @count<100
BEGIN
  INSERT INTO #email VALUES(@count,CONCAT('user',FLOOR(RAND()*1000),'@outlook.com'))
  SET @count=@count+1
END

select * from #email ORDER BY email ASC

SELECT  *
FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY Date ) AS RowNum, *
          FROM      RentVehicles
          WHERE     Date >= '2022-01-22'
        ) AS RowConstrainedResult
WHERE   RowNum >= 1
    AND RowNum < 20
ORDER BY Date
------

SELECT TOP 10 HotelName, Rooms, PriceWithFood,PriceWithoutFood, COUNT(*) OVER()
FROM Hotels
WHERE (PriceWithFood < @PriceWithFood)
   OR (PriceWithFood = @PriceWithFood AND Id < @PriceWithoutFood)
ORDER BY PriceWithFood DESC, Id DESC
---------------------------------------
DECLARE @PageNumber AS INT, @RowspPage AS INT
SET @PageNumber = 2
SET @RowspPage = 10 
SELECT ID_EXAMPLE, NM_EXAMPLE, DT_CREATE
FROM RentVehicles
ORDER BY Id
OFFSET ((@PageNumber - 1) * @RowspPage) ROWS
FETCH NEXT @RowspPage ROWS ONLY;


select * from RentVehicles
-----------------------------------

------INDEX----------------
CREATE CLUSTERED INDEX ix_Id 
ON Yatin(Id)

CREATE INDEX ix_Name
ON Registrations(Name) 

EXECUTE sp_rename
@objname = N'Registrations.ix_Email',
@newname = N'ix_Name',
@objtype = N'INDEX'
--disable index---
ALTER INDEX ix_Name 
ON Registrations 
REBUILD
;
SELECT * FROM Registrations

DROP INDEX ix_Name
ON Registrations(Name)
WITH(DROP_EXISTING = ON)
--rebuild index---
ALTER INDEX ix_Name
ON Registrations
REBUILD
SELECT * FROM Registrations

CREATE UNIQUE INDEX ix_Email
ON Registrations(Email);

DROP INDEX IF EXISTS ix_Name
ON Registrations

CREATE TABLE #Juice
(
Id INT PRIMARY KEY,
Name NVARCHAR(MAX)
)

INSERT INTO #Juice(Id, Name) VALUES
(1, 'orange'),
(2, 'apple'),
(3, 'kiwi'),
(4, 'mosambi'),
(5, 'banana')
SELECT * FROM #Juice

CREATE TABLE ##Vegetables
(
Id INT PRIMARY KEY,
Name NVARCHAR(MAX)
)
INSERT INTO ##Vegetables(Id, Name) VALUES
(1,'tomato'),
(2,'potato'),
(3,'cucumber'),
(4,'onion'),
(5,'lasan')
SELECT * FROM ##Vegetables

CREATE UNIQUE INDEX ix_Vehicle
ON RentVehicles(Price)
INCLUDE(VehicleType, VehicleModel)

CREATE INDEX ix_Vehicles
ON RentVehicles(Price)
INCLUDE(VehicleType, VehicleModel);

CREATE INDEX ix_PersonNumber
ON RentVehicles(PersonNumber)
WHERE PersonNumber IS NOT NULL

SELECT    
  Id, Name,Email
FROM    
    Registrations
WHERE 
    SUBSTRING(Email, 0, 
        CHARINDEX('@', Email, 0)
    ) = 'IndiraGandhi'

	CREATE TABLE Yatin
(Id INT, Name VARCHAR(20))

CREATE DATABASE FULL_TEXT_Search
DROP DATABASE FULL_TEXT_Search

SELECT NAME AS LitTravels2, is_fulltext_enabled
FROM sys.databases

USE LiteTravels2
SELECT * FROM sys.fulltext_catalogs

SELECT * FROM sys.fulltext_languages

sp_help_fulltext_tables

sp_help_fulltext_catalogs

SELECT FULLTEXTSERVICEPROPERTY('isFullTextInstalled')
AS [FULLTEXTSERVICE]

CREATE FULLTEXT CATALOG FullTextCatalog


--------------------

--------------------
--select * from RentVehicles
CREATE VIEW Vehicles
AS
SELECT VehicleType,VehicleModel, VehicleNumber rvPrice, ShopName, Location, vl.Price
FROM RentVehicles AS rv
JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation


SELECT OBJECT_SCHEMA_NAME(v.object_id) schema_name, v.name
FROM sys.views AS v


SELECT OBJECT_SCHEMA_NAME(o.object_id) schema_name, o.name
FROM sys.objects AS o
WHERE o.type = 'V'

CREATE PROCEDURE usp_View_list
(
@schema_name VARCHAR(MAX) = NULL,
@view_name VARCHAR(MAX) = NULL
)
AS
SELECT OBJECT_SCHEMA_NAME(v.object_id) schema_name, v.name 
FROM sys.views AS  v
WHERE 
(@schema_name IS NULL OR OBJECT_SCHEMA_NAME(v.object_id) LIKE '%' + @schema_name + '%') AND
(@view_name IS NULL OR v.name LIKE '%' + @view_name + '%')

EXEC usp_View_list @schema_name = 'dbo'

EXECUTE sp_rename
@objname = 'Vehicles',
@newname = 'BookVehicle'

----------------
SELECT
    definition,
    uses_ansi_nulls,
    uses_quoted_identifier,
    is_schema_bound
FROM
    sys.sql_modules
WHERE object_id = object_id('sales.daily_sales');

EXECUTE sp_helptext 'sys.sql_modules'


SELECT 
    OBJECT_DEFINITION(
        OBJECT_ID(
            'sales.staff_sales'
        )
    ) view_info;


-----------------

DROP VIEW BusesNames above average price

SELECT OBJECT_SCHEMA_NAME(v.object_id) schema_name, v.name
FROM sys.views AS v


CREATE UNIQUE CLUSTERED INDEX uc_ix_VehicleType
ON BookVehicle(VehicleType)

SELECT * FROM bOOKvEHICLE

CREATE UNIQUE CLUSTERED INDEX 
    uc_ix_VehicleType 
ON BookVehicle(VehicleType);

CREATE NONCLUSTERED INDEX 
    uc_ix_VehicleType
ON BookVehicle(VehicleType);

CREATE VIEW BookVehicle
WITH SCHEMABINDING
AS 
SELECT
VehicleType, VehicleModel, ShopName, Location,vl.Price
FROM
    RentVehicles AS rv
INNER JOIN VehicleLocations AS vl 
    ON rv.VehicleLocation = vl.Id

INNER JOIN production.categories c 
    ON c.category_id = p.category_id;
