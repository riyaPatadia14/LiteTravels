USE LiteTravels

----------------- 1  Registrations ----------------------
CREATE TABLE Registrations
(
Id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(20)  NOT NULL,
 Email NVARCHAR(50) NOT NULL UNIQUE,
CreatedBy UNIQUEIDENTIFIER DEFAULT(NEWID()) ,
CreatedDate DATETIME DEFAULT (GETDATE()),
ModifiedBy UNIQUEIDENTIFIER DEFAULT(NEWID()),
ModifiedDate DATETIME DEFAULT (GETDATE())
);

SELECT * FROM Registrations;
DROP TABLE Registrations;
TRUNCATE TABLE Registrations;

INSERT INTO Registrations(Name, Email) VALUES
('Sanjana Vora', 'sanjanaVora12@gmail.com'),
('Krupali Parekh', 'krupali12@gmail.com'),
('Dhara Goda', 'dharagoda@gmail.com'),
('Dhruvi Makadia', 'dhruvimakadia@gmail.com'),
('Zakhana Bhatt', 'zakhanabhatt@gmail.com'),
('Tanvi Desai', 'tanvidesai@gmail.com'),
('Nishant Doshi', 'nishantdoshi@gmail.com'),
('Shubham Mistry', 'shubhammistry@gmail.com'),
('Parimal Parmar', 'parimalparmar@gmail.com'),
('Bipin Padhiyar', 'bipinpadhiyar@gmail.com'),
('Shivam Soni', 'shivamsoni@gmail.com'),
('Sugandha Gosh', 'sugandhagosh@gmail.com'),
('Sumitra Balan', 'sumitrabalan@gmail.com'),
('Aparna Parekh', 'aparnaparekh@gmail.com'),
('Saloni Sojitra', 'salonisojitara@gmail.com'),
('Maggie Jain', 'maggiejain@gmail.com'),
('Ishan Soni', 'ishansoni@gmail.com'),
('Jeet Zinzuvadiya', 'jeetzinzuvadiya@gmail.com'),
('Parita Lekha', 'paritalekha@gmail.com'),
('Zumi Sheth', 'zumisheth@gmail.com'),
('Sunny Deol', 'sunnydeol@gmail.com'),
('Karuna Deshmukh', 'karunadeshmukh@gmail.com'),
('Hetvi Jain', 'hetvijain@gmail.com'),
('Indira Gandhi', 'indiragandhi@gmail.com'),
('Asthaa Sheikh', 'asthaasheikh@gmail.com');

--------------------------------------------------------
------------------ Rent Vehicles ----------------------

CREATE TABLE RentVehicles
(
Id INT IDENTITY(1,1) PRIMARY KEY,
VehicleType VARCHAR(30),
VehicleModel NVARCHAR(MAX),
VehicleNumber NVARCHAR(MAX),
PersonNumber NVARCHAR(MAX),
PeriodTimeIn TIME,
PeriodTimeOut TIME,
Price MONEY,
Date DATE,
IsActive BIT DEFAULT(1),
CreatedBy UNIQUEIDENTIFIER DEFAULT(NEWID()) ,
CreatedDate DATETIME DEFAULT (GETDATE()),
ModifiedBy UNIQUEIDENTIFIER DEFAULT(NEWID()),
ModifiedDate DATETIME DEFAULT (GETDATE())
)
ALTER TABLE RentVehicles
ALTER COLUMN PersonNumber VARCHAR(20)

ALTER TABLE RentVehicles
DROP COLUMN Location ;

ALTER TABLE RentVehicles
ADD VehicleLocation INT ;

ALTER TABLE RentVehicles 
ADD CONSTRAINT FK_VehicleLocationRentVehicles FOREIGN KEY (VehicleLocation) REFERENCES VehicleLocations(Id) 


ALTER TABLE RentVehicles
ADD PersonId INT ;

ALTER TABLE RentVehicles 
ADD CONSTRAINT FK_PersonIdRentVehicles FOREIGN KEY (PersonId) REFERENCES Registrations(Id) 

--DROP TABLE RentVehicles;
SELECT * FROM RentVehicles;
--TRUNCATE TABLE RentVehicles;

INSERT INTO RentVehicles
(VehicleType, VehicleModel, VehicleNumber, PersonNumber, PeriodTimeIn, PeriodTimeOut, Price, VehicleLocation, Date, PersonId) VALUES
('Car', 'suv-700', 'GJ12 AB 1245', '12456897', '08:00', '08:15', '12000', 1, '2022-10-27', 4),
('Scooter', 'Activa', 'GJ6 jk 2354', '89565236', '08:05', '09:09', '7000', 3, '2022-03-05', 25),
('Cycle', 'normal', 'GJ03 hk 5849', '4562153', '9:00', '10:00', '1000', 2, '2022-01-22', 23),
('Bike', 'Pulzar', 'MP06 kd 3625', '45612548', '10:00', '10:20', '8000', 6, '2022-06-10', 17),
('Scooter', 'Vespa', 'RJ02 fg 3215', '21345687', '09:00', '08:00', '1600', 7, '2022-03-15', 1),
('Bike', 'Bullet', 'DL01 ho 4562', '2315425', '01:00', '08:00', '8000', 12, '2022-11-16', 22),
('Car', 'Amaze', 'UP06 th 3256', '21548792', '11:10', '10:00', '17000',20, '2022-04-13', 20),
('Cycle', 'normal', 'MH02 as 2514', '32154671', '03:00', '08:00', '1200', 9,'2022-05-14', 16),
('Scooter', 'Activa', 'GJ01 ui 3652', '1654853', '10:15', '12:00', '12000', 1,'2022-06-25', 5),
('Cycle', 'normal', 'RJ31 vb 3584', '32654152', '09:12', '08:00', '1800',13,'2022-09-27', 24),
('Car', 'Ecco', 'MH06 we 8456', '32589675', '08:30', '02:58', '15000', 16,'2022-03-06', 6),
('Car', 'Magneta', 'KN01 ty 6524', '98745612', '07:30', '09:30', '16000',15, '2022-08-15', 3),
('Scooter', 'Activa', 'UP06 wn 3218', '32847851', '08:30', '07:45', '5000',17,'2022-07-11', 7),
('Car', 'Baleno', 'WB01 na 3218', '95847148', '06:00', '08:00', '10000',18, '2022-08-14', 8),
('Cycle', 'normal', 'WB08 vb 6258', '69854452', '10:00', '11:00', '6000',11, '2022-10-18', 13),
('Car', 'city', 'MH08 oi 9874', '98542546', '09:45', '3:50', '15000',5,' 2022-08-19', 10),
('Scooter', 'Amaze', 'KN09 ki 6985', '32589658', '08:00', '10:12', '800',4,' 2022-03-05', 21),
('Car', 'Verna', 'TN04 qb 5874', '35987812', '08:45', '10:20', '9000',16, '2022-07-06',9),
('Cycle', 'normal', 'MP05 fr 5625', '32548165', '08:00', '06:00', '1200',8,'2022-05-12',14),
('Scooter', 'Vespa', 'PJ05 hj 3256', '69587455', '10:00', '11:45', '6000',10, '2022-05-17',18);

-----------------------------------------------------------------------------------------------------------------------------------

------------------------- Hotels -------------------------------------------

CREATE TABLE Hotels
(
Id INT PRIMARY KEY IDENTITY(1,1),
HotelName NVARCHAR(MAX),
CheckIn DATETIME,
CheckOut DATETIME,
PriceWithFood MONEY,
PriceWithoutFood MONEY,
Rooms NVARCHAR(MAX),
Date DATE,
CreatedBy UNIQUEIDENTIFIER DEFAULT(NEWID()) ,
CreatedDate DATETIME DEFAULT (GETDATE()),
ModifiedBy UNIQUEIDENTIFIER DEFAULT(NEWID()),
ModifiedDate DATETIME DEFAULT (GETDATE())
)

ALTER TABLE Hotels
ALTER COLUMN Date DATETIME 

ALTER TABLE Hotels
ADD PersonId INT ;

ALTER TABLE Hotels
DROP COLUMN Location;

ALTER TABLE Hotels
ADD VehicleLocation INT ;

ALTER TABLE Hotels
ADD CONSTRAINT FK_VehicleLocationHotels FOREIGN KEY (VehicleLocation) REFERENCES VehicleLocations(Id) 

ALTER TABLE Hotels
ADD CONSTRAINT FK_PersonIdHotels FOREIGN KEY (PersonId) REFERENCES Registrations(Id) 

SELECT * FROM Hotels;
DROP TABLE Hotels;
TRUNCATE TABLE Hotels;
UPDATE Hotels SET HotelName = 'Nimo' WHERE Id = 8
UPDATE Hotels SET PersonId = 19 WHERE Id = 4
UPDATE Hotels SET PersonId = 20 WHERE Id = 2
UPDATE Hotels SET PersonId = 17 WHERE Id = 1
UPDATE Hotels SET  CheckIn = 2022-06-15 , CheckOut = 2022-06-19,  Date = 2022-06-15 WHERE Id = 9 
UPDATE Hotels SET  CheckIn = 2022-01-03  , CheckOut = 2022-01-19,  Date = 2022-01-03 WHERE Id = 20 
INSERT INTO Hotels(HotelName, CheckIn, CheckOut, PriceWithFood, PriceWithoutFood, Rooms, VehicleLocation, Date, PersonId) VALUES
('Ocean Sea','2022-03-01 10:05 ','2022-03 -05 03:05 ','7000','2500','normal',1,'2022-03-01',24),
('novel','2022-02-12  12:21','2022-05-12  21:05','8000','3000','luxury',20,'2022-02-12',22),
('shantinest','2022-05-08 08 :21','2022-05 -12  09:10','9000','3500','normal',2,'2022-05-08',6),
('raja','2022-06-17 02:10','2022- 06-19 02:15','10000','5000','normal',6,'2022-06-17',20),
('radhe','2022-06-14  09:15','2022-06 -16  10:20','12600','6600','luxury',9,'2022-06-14',18),
('laxmi','2022-09-13 10:45 ','2022-09 -15  10 :40','11000','7000','normal',19,'2022-09-13',16),
('royal','2022-12-17 10:00 ','2022-12 -21  06:12','13000','6700','luxury',10,'2022-12-17',14),
('raja','2022-11-17 10:11 ','2022-11 - 20  12:25','12000','7500','luxury',11,'2022-11-17',3),
('sunday summer','2022-06-14 11 : 12','2022- 06- 19  10:45','10500','5500','luxury',15,'2022-06-14',13),
('weekend',' 2022-09-19 09:06 ','2022-09 - 21 11:45','9000','5000','luxury',2,'2022-09-19',15),
('airsharp','2022-06-24 10:00 ','2022- 06-26  10:20','8000','4500','normal',3,'2022-06-24',7),
('wednesday','2022-04-16  08:23 ','2022- 04- 19 09:15','10000','5000','normal',6,'2022-04-16',5),
('locally','2022-07-18 09:16 ','2022-07 -20  08:19','9000','3500','luxury',12,'2022-07-18',4),
('entrus','2022-09-26  08:15 ','2022- 09-29 09 :10','8000','2500','normal',8,'2022-09-26',10),
('goatny','2022-02-14 07:45 ','2022-02 -18  10:12','7000','3500','luxury',17,'2022-02-14',9),
('lion','2022-01-30 08:24 ','2022-02 - 02  09:12','8000','5000','normal',12,'2022-01-30',8),
('mango','2022-12-06 09:25 ','2022-12 -08  06:07','10000','5000','luxury',11,'2022-12-06',12),
('fruit','2022-09-17 10:34 ','2022- 09-21   10:18','9000','3500','normal',7,'2022-09-17',1),
('tiger','2022-05-18  11:00 ','2022-05-20 11:45','8000','4500','luxury',14,'2022-05-18',11),
('scafhold',' 2022-10-03 10:10 ','2022-10 -06  10:00','6000','2000','normal',5,'2022-10-03',2);

-------------------------------------------------------------------------------------------------------------------------

------------------------------ Place --------------------------------------------------------------

CREATE TABLE Places
(
Id INT IDENTITY(1,1)PRIMARY KEY,
PlaceName VARCHAR(30),
Date DATE
)

ALTER TABLE Places
DROP COLUMN Date
ALTER TABLE Places
ADD Placelocation NVARCHAR(MAX)

SELECT * FROM Places;
DROP TABLE Places;
TRUNCATE TABLE Places

INSERT INTO Places (PlaceName,Placelocation) VALUES
('Taj Mahal','Agra'),
('Dal Lake','Srinagar'),
('Mysore Palace','Mysore'),
('Nubra Valley','Leh'),
('Red Fort','Delhi'),
('Sheesh Mahal','Jaipur'),
('Sidi Saiyyed Mosque','Ahmedabad'),
('Tea garden','Coonoor'),
('Village View','Bihar'),
('Raan Of Kutch','Kutch'),
('Sundarvan','Ahmedabad'),
('Munshi Ghat','Banaras'),
('Baby Train','Payyanur'),
('Thiksey Monastery','Ladakh'),
('Central Museum','Indore'),
('Narkanda','Shimla'),
('Zuluk','Sikkim'),
('Howrah Bridge','Kolkata'),
('Dashashwamedh Ghat','Varanasi '),
('Tulip Garden','Kashmir'),
('Humayun`s Tomb','Delhi'),
('Marine Drive','Mumbai'),
('Nandi Hills','Karnataka'),
('Ganges River','Rishikesh'),
('Golden Temple','Amritsar'),
('Palolem Beach','Goa'),
('Houseboat','Alleppey'),
('Ajanta and Ellora','Maharashtra'),
('Sabarmati Ashram','Ahmedabad'),
('Manali','Himachal Pradesh'),
('Abbey Falls','Kodagu'),
('Elephant Surf Havelock Island','Andaman Islands'),
('McLeod Ganj','Tsuglagkhang complex'),
('Victoria Memorial','Kolkata'),
('Kolukkumalai Tea Estate','Munnar'),
('Talakaveri','Coorg'),
('Nehru Kund','Manali'),
('Rose Garden','Ooty'),
('Aamby Valley','Lonavala and Khandala'),
('Don Bosco Museum','Shillong');
------------------------------------------------------------------------------------------

----------------------------------------- TransportMedium ----------------------------------

CREATE TABLE TransportMediums
(
Id INT IDENTITY(1,1) PRIMARY KEY,
--PersonId INT FOREIGN KEY REFERENCES Registrations(Id),
Source NVARCHAR(MAX),
StartDate DATE,
EndDate DATE,
Destination NVARCHAR(MAX),
Price MONEY,
)

ALTER TABLE TransportMediums
ADD PersonId INT ;

ALTER TABLE TransportMediums
ADD CONSTRAINT FK_PersonIdTransportMediums FOREIGN KEY (PersonId) REFERENCES Registrations(Id) 


ALTER TABLE TransportMediums
ADD TransportWay INT ;

ALTER TABLE TransportMediums
ADD CONSTRAINT FK_TransportWayTransportMediums FOREIGN KEY (TransportWay) REFERENCES Registrations(Id) 

SELECT * FROM TransportMediums;
DROP TABLE  TransportMediums;
TRUNCATE TABLE TransportMediums;
SELECT BusesId,FlightId,TrainId,Id FROM TransportWays ORDER BY Id
SELECT PersonId,Id FROM Buses ORDER BY PersonId
SELECT PersonId,Id FROM Flights ORDER BY PersonId
SELECT PersonId,Id FROM Trains ORDER BY PersonId

INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES
(23,'ahmedabad','2022-10-06', '2022-10-12','mysore', 1200,8),
(16,'rajkot','2022-10-01', '2022-10-02','delhi',1400 ,13),
(17,'bhopal','2022-12-20', '2022-12-22','srinagar', 1500,11),
(9,'mumbai','2022-11-24', '2022-11-26','pune',2800 ,8),
(8,'banglore','2022-10-23', '2022-10-30','agra',3000 ,13),
(6,'chennai','2022-09-24', '2022-09-26','delhi',3400 ,5),
(5,'hyderabad','2022-08-10', '2022-08-12','kolkata',1600 ,8),
(7,'delhi','2022-07-09', '2022-07-10','lucknow',1500 ,11),
(4,'kolkata','2022-06-10', '2022-06-12','chennai',1900 ,3), 
(11,'jaipur','2022-05-03', '2022-05-05','mumbai',2000 ,6),
(12,'udaipur','2022-06-04', '2022-06-07','bhopal', 2500,15),
(13,'agra','2022-07-05', '2022-07-07','udaipur',2800 ,7),
(14,'aurangabad','2022-08-06', '2022-08-08','rajkot',2900 ,4),
(15,'varanasi','2022-09-07', '2022-09-09','ahmedabad',4000 ,4),
(18,'indore','2022-10-08', '2022-10-10','vadodara',5000 ,18),
(19,'panipat','2022-11-09','2022-11-11','surat',6000,20),
(20,'vadodara','2022-12-10', '2022-12-12','nasik',1750 ,19),
(2,'surat','2022-01-11', '2022-01-13','aurangabad', 1850,7),
(22,'pune','2022-02-12', '2022-02-14','hyderabad',2590 ,18),
(25,'mysore','2022-03-13', '2022-03-15','varanasi',3950 ,3);
							
-----------------------------------------------------------------------------------
---------------------------- TransportWays------------------------------------ 
CREATE TABLE TransportWays		
(
Id INT IDENTITY(1,1) PRIMARY KEY,
)
--FlightName VARCHAR(30)

ALTER TABLE TransportWays
ADD BusesId INT ;

ALTER TABLE TransportWays
ADD CONSTRAINT FK_BusesIdTransportMediums FOREIGN KEY (BusesId) REFERENCES Buses(Id) 

ALTER TABLE TransportWays
ADD TrainId INT ;

ALTER TABLE TransportWays
ADD CONSTRAINT FK_TrainIdTransportMediums FOREIGN KEY (TrainId) REFERENCES Trains(Id) 

ALTER TABLE TransportWays
ADD FlightId INT ;

ALTER TABLE TransportWays
ADD CONSTRAINT FK_FlightIdTransportWays FOREIGN KEY (FlightId ) REFERENCES Flights(Id) 

SELECT * FROM TransportWays;
DROP  TABLE TransportWays;
TRUNCATE TABLE TransportWays;

INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES
(5021,1002,502),
(5001,1004,520),
(5002,1006,518),
(5004,1012,517),
(5005,1007,516),
(5006,1011,514),
(5007,1003,515),
(5008,1013,513),
(5009,1010,512),
(5010,1014,511),
(5011,1017,510),
(5012,1015,509),
(5013,1016,508),
(5014,1018,507),
(5015,1019,506),
(5016,1020,505),
(5017,1001,516),
(5018,1009,504),
(5019,1008,503),
(5020,1005,501),
(5019,1016,503),
(5007,1010,507);


--------------------------------------------------------------------------------------------------
---------------------------------  Guides  ----------------------------------------

CREATE TABLE Guides
(
Id INT IDENTITY(1,1)PRIMARY KEY,
GuideName VARCHAR(20) ,
GuideCar NVARCHAR(MAX),
Price MONEY,
CreatedBY UNIQUEIDENTIFIER DEFAULT(NEWID()),
CreatedDate DATETIME DEFAULT (GETDATE()),
ModifiedBy UNIQUEIDENTIFIER DEFAULT (NEWID()),
ModifiedDate DATETIME DEFAULT (GETDATE())
)

SELECT * FROM Guides ORDER BY GuideName;
DROP TABLE Guides;
TRUNCATE TABLE Guides;

INSERT INTO Guides (GuideName, GuideCar, Price) VALUES
('ahmed','traveller','13000'),
('mehraj','swift','14000'),
('varun','suv500','15000'),
('soham','jazz','17000'),
('rehan','civic','18000'),
('rehana','carnival','19000'),
('karen','endevaour','20000'),
('karan','rapid','25000'),
('ramesh','tiago','21000'),
('suresh','creta','22000'),
('kamlesh','veneto','23000'),
('param','santro','24000'),
('praveen','ecco','11000'),
('gautam','wagnor','9500'),
('abdil','aulto','8000'),
('salman','swift','7000'),
('vishwa','baleno','6000'),
('kapura','traveller','5500'),
('silika','suv800','7500'),
('shiva','ecco','12000');

-----------------------------------------------------------------------


---------------------- VisitPlaces -------------------------------

CREATE TABLE VisitPlaces
(
Id INT IDENTITY(1,1) PRIMARY KEY,
Price MONEY,
)
ALTER TABLE VisitPlaces
DROP CONSTRAINT FK_PersonIdVisitPlaces ;

ALTER TABLE VisitPlaces
DROP COLUMN  PersonId;


ALTER TABLE VisitPlaces 
ADD PersonId INT ;

ALTER TABLE VisitPlaces 
ADD CONSTRAINT FK_PersonIdVisitPlaces FOREIGN KEY (PersonId) REFERENCES Registrations(Id) 

ALTER TABLE VisitPlaces 
ADD PlacesId INT ;

ALTER TABLE VisitPlaces 
ADD CONSTRAINT FK_PlacesIdVisitPlaces FOREIGN KEY (PlacesId) REFERENCES Places(Id) 

ALTER TABLE VisitPlaces
ADD GuidesId INT ;

ALTER TABLE VisitPlaces 
ADD CONSTRAINT FK_GuidesIdVisitPlaces FOREIGN KEY (GuidesId) REFERENCES Guides(Id) 

SELECT * FROM VisitPlaces;
DROP TABLE  VisitPlaces;
TRUNCATE TABLE  VisitPlaces;

INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES
(18,3,12000,9),
(40,1,13000,7),
(15,19,14000,18),
(3,4,15000,5),
(19,2,16000,NULL),
(10,5,17000,17),
(6,6,18000,16),
(16,8,19000,20),	
(30,9,20000,21),	
(1,17,21000,23),
(12,11,22000,15),
(23,12,23000,23),
(14,13,24000,24),
(20,16,25000,25),
(25,18,26000,10),
(36,15,27000,17),
(27,10,28000,23),
(38,7,29000,21),
(35,20,30000,9),
(37,14,11000,6),
(28,3,12000,9),
(32,1,13000,7),
(4,19,14000,18),
(34,4,15000,5),
(17,2,16000,NULL),
(5,5,17000,17),
(24,6,18000,16),
(13,8,19000,20),
(39,9,20000,21),
(31,17,21000,23),
(21,11,22000,15),
(8,12,23000,23),
(4,13,24000,24),
(2,16,25000,25),
(26,18,26000,10),
(29,15,27000,17),
(33,10,28000,23),
(11,7,29000,21),
(23,20,30000,9),
(9,14,11000,6);
		   
------------------------------------------------------------------------

------------------------ VehicleLocations ---------------------------------

CREATE TABLE VehicleLocations
(
Id INT IDENTITY(1,1) PRIMARY KEY,
Location NVARCHAR(MAX) ,
ShopName NVARCHAR(MAX),
Price MONEY,
CreatedBY UNIQUEIDENTIFIER DEFAULT(NEWID()),
CreatedDate DATETIME DEFAULT (GETDATE()),
ModifiedBy UNIQUEIDENTIFIER DEFAULT (NEWID()),
ModifiedDate DATETIME DEFAULT (GETDATE())
)

SELECT * FROM VehicleLocations;
DROP TABLE VehicleLocations;
TRUNCATE TABLE VehicleLocations;

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES
('ahmedabad','abdul',40000),
('rajkot','rehan',50000),
('vadodara','indian',1000000),
('surat','rang',1000000),
('bhopal','abdil',200000),
('indore','indory',90000),
('jaipur','jay',60000),
('udaipur','uma',1000000),
('mumbai','khodiyar',100000),
('chennai','bhavani',2000000),
('kolkata','mohammad',90000),
('delhi','venkateshwar',1000000),
('jodhpur','gulab',55000),
('chennai','durga',1000000),
('banglore','tool-tip',50000),
('pune','mac-can-make-it',500000),
('nasik','shoopify',250000),
('panipat','shanky',200000),
('mysore','shawn',100000),
('hyderabad','hydear',80000);
---------------------------------------------------------------------------

---------------------------- UserDashboards --------------------------------

CREATE TABLE UserDashboards
(
Id INT PRIMARY KEY IDENTITY(1,1),
BookingDetails VARCHAR(20) ,
PaymentType VARCHAR(20),
)

ALTER TABLE UserDashboards
ADD PersonId INT ;

ALTER TABLE UserDashboards
ADD Wallet MONEY;

--ALTER TABLE UserDashboards
--DROP COLUMN VisitedPlaces;

ALTER TABLE UserDashboards
ADD VisitedPlaces INT;

ALTER TABLE UserDashboards 
ADD CONSTRAINT FK_VisitedPlacesUserDashboards FOREIGN KEY (VisitedPlaces) REFERENCES VisitPlaces(Id) 

ALTER TABLE UserDashboards 
ADD CONSTRAINT FK_PersonIdUserDashboards FOREIGN KEY (PersonId) REFERENCES Registrations(Id) 

SELECT * FROM Registrations;
SELECT PersonId,Id FROM UserDashboards ORDER BY PersonId;
SELECT * FROM VisitPlaces;
DROP TABLE UserDashboards;
TRUNCATE TABLE UserDashboards;

INSERT INTO UserDashboards(PersonId, BookingDetails, PaymentType, Wallet,VisitedPlaces, ) VALUES
(18,'ahmedabad','offline',100 ,1,NULL),
(5,'hyderabad','online',150,2,),  
(6,'delhi','offline',200 ,3,NULL), 
(9,'hyderabad','online',50,4,), 
(7,'rajkot','offline',250,5,NULL), 
(10,'vadodara','online',300,6,), 
(8,'surat','offline',480,7,NULL), 
(11,'delhi','online',550,8,), 
(13,'mumbai','online',900,35,),
(21,'haryana','offline',999,38,NULL),
(18,'srinagar','online',425,37,),
(6,'indore','online',555,39,),
(20,'ahmedabad','offline',1900,36,NULL),
(9,'banaras','online',875,2,),
(17,'banglore','offline',800,6,NULL),
(19,'bhopal','online',700,14,),
(20,'indore','offline',1500,15,NULL),  
(15,'agra','online',2000,16,), 
(23,'chennai','offline',640,15,NULL),
(5,'manali','online',990,20,),
(12,'shimla','online',280,32,),
(1,'sikkim','online',630,10,),
(22,'leh','offline',2000,9,NULL),
(8,'kolkata','online',160,12,),
(25,'pune','online',500,20,),
(7,'sikkim','online',260,40,),
(11,'coonoor','online',190,37,),
(15,'ooty','offline',700,40,NULL),
(3,'mysore','offline',100,34,NULL),
(14,'delhi','online',160,19,),
(19,'leh','offline',165,23,NULL),
(16,'srinagar','online',50,33,),
(24,'amritsar','offline',150,5,NULL),
(10,'varanasi','online',60,15,),
(2,'rishikesh','offline',800,10,NULL),
(4,'agra','online',2000,20,),
(12,'aurangabad','offline',1000,9,NULL),  
(13,'kolkata','online',400,10,), 
(14,'chennai','offline',900,11,NULL), 
(16,'mysore','online',800,12,), 
(17,'banglore','offline',750,13,NULL), 
(21,'jodhpur','offline',150,17,NULL), 
(23,'panipat','online',2000,18,), 
(24,'mumbai','offline',140,19,NULL);
 
 
---------------------------------------------------------------------------------------
---------------------------------- Card_Details ------------------------------------------
CREATE TABLE Card_Details
(
Id INT PRIMARY KEY,
CardNumber VARCHAR(20),
CardType VARCHAR(20),
ExpirationMonth DATE,
ExpirationYear DATE,
CreatedBY UNIQUEIDENTIFIER DEFAULT(NEWID()),
CreatedDate DATETIME DEFAULT (GETDATE()),
ModifiedBy UNIQUEIDENTIFIER DEFAULT (NEWID()),
ModifiedDate DATETIME DEFAULT (GETDATE())
)


	
---------------------------------------------------------------------------------------
------------------------------------ Trains --------------------------------------

CREATE TABLE Trains
(
Id INT IDENTITY(1001,1) PRIMARY KEY,
DateIn DATE,
DateOut DATE,
TimeIn TIME,
TimeOut TIME,
TrainName VARCHAR(30)  ,
Class VARCHAR(20),
Price MONEY,
Adult INT,
Child INT,
)

ALTER TABLE Trains
ADD PersonId INT ;

ALTER TABLE Trains 
ADD CONSTRAINT FK_PersonIdTrains FOREIGN KEY (PersonId) REFERENCES Registrations(Id) 

SELECT * FROM Trains;
DROP TABLE Trains;
TRUNCATE TABLE Trains;

INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-01-10','10:11','2022-01-12','11:00','lent',1,'ec','600',1,0),
('2022-02-11','11:45','2022-02-12','12:15','golden',2,'3ac','2500' ,5,2),
('2022-03-12','12:56','2022-03-14','01:15','local',12,'ec','20000',15,3),
('2022-04-13','01:15','2022-04-15','02:45','silver',15,'cc','15000',12,4),
('2022-05-14','02:45','2022-05-16','03:12','proma',11,'3ac','17000',15,5),
('2022-06-15','03:45','2022-06-17','04:15','platinum',4,'cc','25000',30,6),
('2022-07-16','04:05','2022-07-18','05:15','express',6,'3ac','26000',24,7),
('2022-08-17','05:15','2022-08-19','06:45','painte',5,'ec','7000',6,1),
('2022-09-18','06:35','2022-09-20','07:20','fares',7,'3ac','8000',5,2),
('2022-10-19','07:18','2022-10-21','08:25','flow',10,'cc','800',1,0),
('2022-11-20','08:35','2022-11-23','09:15','gurjarnagri',9,'sl','1200',2,0),
('2022-12-21','09:15','2022-12-22','05:45','raghdhani',14,'sl', '1800',2,0),
('2022-03-22','10:10','2022-03-25','06:50','pattern',19,'cc','1800',2,0),
('2022-04-23','11:45','2022-04-25','07:10','track',17,'3ac','2500',2,1),
('2022-05-24','12:32','2022-05-26','08:36','canne',20,'cc','8000',8,2), 
('2022-06-10','10:15','2022-06-12','09:10','core',16,'ec','10000',15,3),
('2022-07-09','11:15','2022-07-11','10:10','tainn',18,'sl','10000',10,4),
('2022-08-08','12:15','2022-08-10','11:12','cannopi',23,'cc','8000',5,3),
('2022-09-07','13:45','2022-09-09','12:36','loape',24,'3ac','9000',6,2),
('2022-10-06','10:50','2022-10-08','01:45','laser',25,'ec','9000',4,1);
	
UPDATE Trains SET TrainName = 'rajdhani' WHERE Id = 1012
									
-------------------------------------------------------------------------------------------
										
--------------------------------------- Flights -----------------------------------------------
CREATE TABLE  Flights
(
Id INT IDENTITY(501,1)  PRIMARY KEY,
DateIn DATE,
TimeIn TIME,
DateOut DATE,
TimeOut TIME,
FlightName VARCHAR(30),
Class VARCHAR(20),
Price MONEY,
Adult INT,
Child INT,
)
ALTER TABLE Flights
ADD PersonId INT ;

ALTER TABLE Flights 
ADD CONSTRAINT FK_PersonIdFlights FOREIGN KEY (PersonId) REFERENCES Registrations(Id) 

SELECT * FROM Flights;
DROP TABLE Flights;
TRUNCATE TABLE Flights;

INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-10-05','10:15','2022-10-10','10:45','precks',25,'economy','5000',2,0),
('2022-11-08','12:00','2022-11-11','01:12','quar',1,'business','7000',2,1),
('2022-10-07','01:05','2022-10-10','02:15','tram',13,'economy','8000',3,2),
('2022-09-06','02:25','2022-09-08','12:45','oprate',14,'business','2000' ,1,1),
('2022-08-05','03:45','2022-08-07','09:36','shom',12,'economy','2000' ,1,0),
('2022-07-04','04:40','2022-07-06','08:46','prain',11,'business','2000' ,1,0),
('2022-06-03','05:50','2022-06-05','07:15','bird',10,'economy','2000' ,1,0),
('2022-05-02','06:30','2022-05-04','06:14','dudhsagar',9,'business','8000' ,2,1), 
('2022-04-01','07:00','2022-04-03','05:40','firfly',8,'economy','9000' ,2,2),
('2022-03-20','08:15','2022-03-22','04:16','indigo',7,'business','8000' ,2,1),
('2022-02-19','09:15','2022-02-21','03:50','vista',6,'economy','5000' ,2,0),
('2022-01-18','07:50','2022-01-21','02:45','crab',5,'business','10000' ,3,1),
('2022-02-17','03:45','2022-02-19','01:50','frog',2,'economy','12000' ,4,1),
('2022-03-16','04:12','2022-03-17','12:12','meant',3,'business','12000',3,1),
('2022-04-15','05:45','2022-04-16','01:45','froaa',20,'economy','8500' ,2,1),
('2022-05-14','06:10','2022-05-16','12:36','leam',24,'business','6000' ,1,0),
('2022-06-13','07:35','2022-06-14','11:20','kent',21,'economy','25000' ,6,0),
('2022-07-12','08:10','2022-07-14','10:45','swime',22,'business','18000',4,0),
('2022-08-11','09:12','2022-08-13','09:19','grome',23,'business','15000' ,3,0),
('2022-09-10','07:45','2022-09-12','10:12','peme',4,'economy','6000' ,2,0);
										
-------------------------------------------------------------------------------------------------
										 
---------------------------------------- Buses ---------------------------------------------------
										 

CREATE TABLE Buses
(
Id INT IDENTITY(5001,1)  PRIMARY KEY,
DateIn DATE,
TimeIn TIME,
DateOut DATE,
TimeOut TIME,
BusesName VARCHAR(30) ,
Class VARCHAR(20),
Price MONEY,
Adult INT,
Child INT,
)

ALTER TABLE Buses
ADD PersonId INT ;

ALTER TABLE Buses 
ADD CONSTRAINT FK_PersonIdBuses FOREIGN KEY (PersonId) REFERENCES Registrations(Id) 

SELECT * FROM Buses;
DROP TABLE Buses;
TRUNCATE TABLE Buses;
UPDATE Buses SET Price=1850.56 WHERE Id = 5001
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-10-23','10:10','2022-10-30','12:24','patel',8,'seating',1850 ,1,0),
('2022-06-08','10:00','2022-06-11','12:15','samyak',4,'sleeper',2000 ,2,0),
('2022-07-01','10:12','2022-07-03','12:25','patel',5,'sleeper', '1800',1,0),
('2022-08-02','11:15','2022-08-04','01:15','fresh air',3,'sleeper', '1650',2,3),
('2022-09-03','12:20','2022-09-05','02:45','greenery',10,'seating','2000' ,10,4),
('2022-10-04','01:05','2022-10-06','03:15','carrat',12,'seating','2500' ,6,2),
('2022-11-05','02:25','2022-11-07','04:15','lion',13,'seating', '3000',1,0),
('2022-12-06','03:45','2022-12-08','05:18','cheetha',14,'sleeper','8000' ,9,3),
('2022-03-07','04:15','2022-03-09','06:20','elephant',16,'seating','6000 ',4,1), 
('2022-04-08','05:20','2022-04-10','07:20','karan',1,'seating', '6000',2,1),
('2022-05-09','06:25','2022-05-11','08:20','avacado',17,'sleeper','3000 ',2,0),
('2022-06-10','07:45','2022-06-12','09:15','pinepale',6,'seating','12000' ,14,5),
('2022-07-11','08:50','2022-07-13','10:25','olaax',24,'seating', '8000',4,0),
('2022-08-12','09:35','2022-08-14','11:25','orac',23,'seating','1200' ,1,0),
('2022-09-13','10:35','2022-09-15','12:36','cranate',22,'sleeper','1000' ,1,0),
('2022-10-14','11:10','2022-10-16','01:24','jeack',15,'seating','1000' ,1,0) ,
('2022-11-15','12:45','2022-11-17','02:25','joals',21,'sleeper','1500' ,2,0),
('2022-12-16','01:35','2022-12-18','03:36','leque',20,'seating','20000 ',12,5),
('2022-01-17','02:15','2022-01-19','04:45','prain',18,'sleeper','10000' ,6,3),
('2022-02-18','03:35','2022-02-20','05:45','kelae',19,'seating','8000' ,4,2),
('2022-03-19','04:15','2022-03-21','06:56','neeta',2,'sleeper','2000' ,2,1);
										
---------------------------------------------------------------------------------------------------
										
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


--------------------------------------------------------------------------------------------------------


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

SELECT CHECKSUM_AGG(PersonNumber) AS pn, VehicleModel
FROM RentVehicles
GROUP BY VehicleModel
HAVING CHECKSUM_AGG(PersonNumber) > 1


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

------------------------------------------- SELF JOIN -------------------------------------------------------------
------------------------------------  SELF JOIN --------------------------------------------------------


SELECT	h.HotelName AS hn, h.Rooms AS hr, h.PersonId AS hp, h.Id AS hi,
		r.Name AS rn, r.Id AS ri
		FROM Hotels AS h, Registrations AS r
		WHERE h.Id <> r.Id
		AND h.PersonId = r.Id ORDER BY r.Id


-----------------------------------------------------------------

SELECT  VehicleType,VehicleModel,Location, ShopName
		FROM RentVehicles AS rv, VehicleLocations AS vl 
		WHERE rv.VehicleLocation >= vl.Id
		OR rv.VehicleLocation = VL.Id
	

SELECT	GuideCar, GuideName, PlaceName, Placelocation, vp.Price
		FROM VisitPlaces AS vp, Places AS p, Guides AS g
		WHERE vp.GuidesId <> g.Id AND vp.PlacesId <= p.Id 

-------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-------------------------------------------------------------- FULL JOIN ----------------------------------------------------------------------------------



---------------------------------- Hotels FULL OUTER JOIN VehicleLocations -------------------------------------

SELECT	vl.Location, vl.ShopName,
		h.VehicleLocation, h.HotelName
		FROM VehicleLocations AS vl 
		FULL OUTER JOIN Hotels AS h ON h.VehicleLocation = vl.Id

-----------------------------------------------------------------------------------------------------------

-------------------------- RentVehicles FULL OUTER JOIN Hotels FULL OUTER JOIN VehicleLocations ---------------------------------

SELECT	rv.VehicleType, rv.VehicleModel, rv.PersonId, 
		h.HotelName, h.Rooms, h.PersonId, h.VehicleLocation,
		vl.Location, vl.ShopName
		FROM RentVehicles AS rv 
		FULL OUTER JOIN Hotels AS h ON rv.VehicleModel = h.HotelName 
		Full OUTER JOIN VehicleLocations AS vl ON h.VehicleLocation = vl.Id

------------------------------------------------------------------------------------------------------------
/*
RENT VEHICLES FULL OUTER JOIN VEHICLELOCATIONS
*/
SELECT VehicleType, VehicleModel,ShopName, Location
		FROM RentVehicles AS rv
		FULL OUTER JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
----------------------------------------------------------------------
/*
rent vehicles full outer join hotels full outer join
*/
SELECT
		VehicleType,VehicleModel, rv.Price
		ShopName, Location,
		HotelName,h.Date, Rooms
		FROM RentVehicles AS rv
		FULL OUTER JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
		FULL OUTER JOIN Hotels AS h ON h.VehicleLocation = rv.VehicleLocation
-------------------------------------------------------------------------------------------------------
/*

Hotels 
FULL OUTER JOIN RentVehicles
FULL OUTER JOIN VisitPlaces 
FULL OUTER JOIN Places 
FULL OUTER JOIN Guides 

*/
SELECT	HotelName, Rooms, h.Date,
		VehicleType,VehicleModel,vp.Price,
		p.PlaceName,p.Placelocation,
		g.GuideName, g.GuideCar
		FROM Hotels AS h
		FULL OUTER JOIN RentVehicles  AS rv ON rv.VehicleLocation = h.VehicleLocation
		FULL OUTER JOIN VisitPlaces AS vp ON vp.PersonId  = rv.PersonId
		FULL OUTER JOIN Places AS p ON vp.PlacesId = p.Id
		FULL OUTER JOIN Guides AS g ON g.Id = vp.GuidesId
		
--------------------------------------------------------------------------------------------------------
/*
Registrations 
FULL OUTER JOIN RentVehicles  
FULL OUTER JOIN Hotels 
FULL OUTER JOIN VehicleLocations
FULL OUTER JOIN VisitPlaces 
FULL OUTER JOIN Places 
FULL OUTER JOIN Guides 
FULL OUTER JOIN TransportMediums
FULL OUTER JOIN UserDashboards 
FULL OUTER JOIN Trains 
FULL OUTER JOIN Buses 
FULL OUTER JOIN Flights 
FULL OUTER JOIN TransportWays 
*/
SELECT	Name,
		HotelName, Rooms, h.Date,
		VehicleType,VehicleModel,vp.Price,
		p.PlaceName,p.Placelocation,
		g.GuideName, g.GuideCar,
		Source,Destination,
		Wallet,BookingDetails,
		TrainName,BusesName,FlightName
		FROM Registrations AS  r
		FULL OUTER JOIN RentVehicles AS rv ON rv.PersonId = r.Id
		FULL OUTER JOIN Hotels AS h ON h.PersonId = rv.PersonId
		FULL OUTER JOIN VehicleLocations AS vl ON vl.Id = h.VehicleLocation
		FULL OUTER JOIN VisitPlaces AS vp ON vp.PersonId = r.Id
		FULL OUTER JOIN Places AS p ON p.Id = vp.PlacesId
		FULL OUTER JOIN Guides AS g ON g.Id = vp.GuidesId
		FULL OUTER JOIN TransportMediums AS tm ON tm.PersonId = r.Id
		FULL OUTER JOIN UserDashboards AS ud ON ud.PersonId = r.Id
		FULL OUTER JOIN Trains AS t ON t.PersonId = r.Id
		FULL OUTER JOIN Buses AS b ON b.PersonId = r.Id
		FULL OUTER JOIN Flights AS f ON f.PersonId = r.Id
		FULL OUTER JOIN TransportWays AS tw ON tw.FlightId = f.Id
-----------------------------------------------------------------------------------
/*

 Hotels 
LEFT OUTER JOIN RentVehicles
LEFT OUTER JOIN VisitPlaces 
LEFT OUTER JOIN Places 
LEFT OUTER JOIN Guides 

*/
SELECT	HotelName, Rooms, h.Date,
		VehicleType,VehicleModel,vp.Price,
		p.PlaceName,p.Placelocation,
		g.GuideName, g.GuideCar
		FROM Hotels AS h
		LEFT OUTER JOIN RentVehicles  AS rv ON rv.VehicleLocation = h.VehicleLocation
		LEFT OUTER JOIN VisitPlaces AS vp ON vp.PersonId  = rv.PersonId
		LEFT OUTER JOIN Places AS p ON vp.PlacesId = p.Id
		LEFT OUTER JOIN Guides AS g ON g.Id = vp.GuidesId

--------------------------------------------------------------------------------------
/*
Registrations 
LEFT OUTER JOIN RentVehicles
LEFT OUTER JOIN VisitPlaces 
LEFT OUTER JOIN VehicleLocations
LEFT OUTER JOIN TransportMediums
LEFT OUTER JOIN UserDashboards 
LEFT OUTER JOIN Hotels 

*/
SELECT	Name,VehicleType,VehicleModel,rv.Date, vp.Price,Source,Destination, BookingDetails,Wallet,HotelName,Rooms
		FROM Registrations AS r
		LEFT OUTER JOIN RentVehicles AS rv ON rv.PersonId = r.Id
		LEFT OUTER JOIN VisitPlaces AS vp ON vp.PersonId = rv.PersonId
		LEFT OUTER JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
		LEFT OUTER JOIN TransportMediums AS tm ON tm.Id = rv.PersonId
		LEFT OUTER JOIN UserDashboards AS ud ON ud.PersonId = rv.PersonId
		LEFT OUTER JOIN Hotels AS h ON h.PersonId = rv.PersonId
		
---------------------------------------------------------------------------------------------
/*

Registrations 
LEFT OUTER JOIN RentVehicles  
LEFT OUTER JOIN Hotels 
LEFT OUTER JOIN VehicleLocations
LEFT OUTER JOIN VisitPlaces 
LEFT OUTER JOIN Places 
LEFT OUTER JOIN Guides 
LEFT OUTER JOIN TransportMediums
LEFT OUTER JOIN UserDashboards 
LEFT OUTER JOIN Trains 
LEFT OUTER JOIN Buses 
LEFT OUTER JOIN Flights
LEFT OUTER JOIN TransportWays 

*/
SELECT	Name,
		HotelName, Rooms, h.Date,
		VehicleType,VehicleModel,vp.Price,
		p.PlaceName,p.Placelocation,
		g.GuideName, g.GuideCar,
		Source,Destination,
		Wallet,BookingDetails,
		TrainName,BusesName,FlightName
		FROM Registrations AS r
		LEFT OUTER JOIN RentVehicles AS rv ON rv.PersonId = r.Id   
		LEFT OUTER JOIN Hotels AS h ON h.PersonId = rv.PersonId
		LEFT OUTER JOIN VehicleLocations AS vl ON vl.Id = h.VehicleLocation
		LEFT OUTER JOIN VisitPlaces AS vp ON vp.PersonId = r.Id
		LEFT OUTER JOIN Places AS p ON p.Id = vp.PlacesId
		LEFT OUTER JOIN Guides AS g ON g.Id = vp.GuidesId
		LEFT OUTER JOIN TransportMediums AS tm ON tm.PersonId = r.Id
		LEFT OUTER JOIN UserDashboards AS ud ON ud.PersonId = r.Id
		LEFT OUTER JOIN Trains AS t ON t.PersonId = r.Id
		LEFT OUTER JOIN Buses AS b ON b.PersonId = r.Id
		LEFT OUTER JOIN Flights AS f ON f.PersonId = r.Id
		LEFT OUTER JOIN TransportWays AS tw ON tw.FlightId = f.Id

----------------------------------------------------------------------------------------------------
/*
FROM RentVehicles 
RIGHT OUTER JOIN VehicleLocations
RIGHT OUTER JOIN Hotels  
RIGHT OUTER JOIN Registrations 
RIGHT OUTER JOIN TransportMediums
*/

SELECT	Name, VehicleType, VehicleModel, ShopName, Location,HotelName, Rooms, h.Date, Source, Destination 
		FROM RentVehicles AS rv
		RIGHT OUTER JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
		RIGHT OUTER JOIN Hotels AS h ON  h.PersonId  = rv.PersonId
		RIGHT OUTER JOIN Registrations AS r ON r.Id = rv.PersonId
		RIGHT OUTER JOIN TransportMediums AS tm ON tm.PersonId = r.Id

-----------------------------------------------------------------------------------------------------
/*
Registrations
RIGHT OUTER JOIN VisitPlaces A
RIGHT OUTER JOIN Places 
RIGHT OUTER JOIN Guides 
RIGHT OUTER JOIN TransportMediums
*/

SELECT	Name,vp.Price,
		p.PlaceName,p.Placelocation,
		g.GuideName, g.GuideCar,
		Source,Destination
		FROM Registrations AS r
		RIGHT OUTER JOIN VisitPlaces AS vp ON vp.PersonId = r.Id
		RIGHT OUTER JOIN Places AS p ON p.Id = vp.PlacesId
		RIGHT OUTER JOIN Guides AS g ON g.Id = vp.GuidesId
		RIGHT OUTER JOIN TransportMediums AS tm ON tm.PersonId = vp.PersonId

--------------------------------------------------------------------------------------------------------
/*
Hotels 
RIGHT OUTER JOIN RentVehicles 
RIGHT OUTER JOIN VehicleLocations
RIGHT OUTER JOIN TransportMediums
RIGHT OUTER JOIN VisitPlaces 
RIGHT OUTER JOIN Places 
RIGHT OUTER JOIN Guides 

*/
SELECT	VehicleType,VehicleModel,vp.Price,HotelName, Rooms, h.Date,
		p.PlaceName,p.Placelocation,
		g.GuideName, g.GuideCar,
		Source,Destination
		FROM Hotels AS h
		RIGHT OUTER JOIN RentVehicles AS rv ON rv.PersonId = h.PersonId
		RIGHT OUTER JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
		RIGHT OUTER JOIN TransportMediums AS tm ON tm.PersonId = rv.PersonId
		RIGHT OUTER JOIN VisitPlaces AS vp ON vp.PersonId = rv.PersonId
		RIGHT OUTER JOIN Places AS  p ON  p.Id =  vp.PlacesId
		RIGHT OUTER JOIN Guides AS g ON g.Id = vp.GuidesId 
-------------------------------------------------------------------------------------------
/*
Registrations 
RIGHT OUTER JOIN RentVehicles
RIGHT OUTER JOIN Hotels 
RIGHT OUTER JOIN VehicleLocations
RIGHT OUTER JOIN VisitPlaces 
RIGHT OUTER JOIN Places 
RIGHT OUTER JOIN Guides
RIGHT OUTER JOIN TransportMediums
RIGHT OUTER JOIN UserDashboards 
RIGHT OUTER JOIN Trains 
RIGHT OUTER JOIN Buses
RIGHT OUTER JOIN Flights 
RIGHT OUTER JOIN TransportWays 
*/
SELECT	Name,
		HotelName, Rooms, h.Date,
		VehicleType,VehicleModel,vp.Price,
		p.PlaceName,p.Placelocation,
		g.GuideName, g.GuideCar,
		Source,Destination,
		Wallet,BookingDetails,
		TrainName,BusesName,FlightName
		FROM Registrations AS r
		RIGHT OUTER JOIN RentVehicles AS rv ON rv.PersonId = rv.PersonId  
		RIGHT OUTER JOIN Hotels AS h ON h.PersonId = rv.PersonId
		RIGHT OUTER JOIN VehicleLocations AS vl ON vl.Id = h.VehicleLocation
		RIGHT OUTER JOIN VisitPlaces AS vp ON vp.PersonId = rv.PersonId
		RIGHT OUTER JOIN Places AS p ON p.Id = vp.PlacesId
		RIGHT OUTER JOIN Guides AS g ON g.Id = vp.GuidesId
		RIGHT OUTER JOIN TransportMediums AS tm ON tm.PersonId = rv.PersonId
		RIGHT OUTER JOIN Flights AS f ON f.PersonId =rv.PersonId
		RIGHT OUTER JOIN TransportWays AS tw ON tw.Id = tm.TransportWay
		RIGHT OUTER JOIN UserDashboards AS ud ON ud.PersonId = rv.PersonId
		RIGHT OUTER JOIN Trains AS t ON t.PersonId =rv.PersonId
		RIGHT OUTER JOIN Buses AS b ON b.PersonId = rv.PersonId

---------------------------------------------------------------------------------------------------
/*
RentVehicles 
FULL OUTER JOIN VehicleLocations 
RIGHT OUTER JOIN Hotels 
LEFT OUTER JOIN  TransportMediums
*/

SELECT	VehicleType,VehicleModel,ShopName, Location, HotelName, Rooms, h.Date,Source,Destination
		FROM RentVehicles AS rv
		FULL OUTER JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
		RIGHT OUTER JOIN Hotels AS h ON h.VehicleLocation =  vl.Id
		LEFT OUTER JOIN  TransportMediums AS tm ON tm.PersonId = rv.PersonId






---------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------- JOIN ----------------------------------------


---------------------------------------------- UserBoards JOIN Registrations ----------------------------------------

SELECT	Registrations.Name, 
		UserDashboards.BookingDetails, 
		UserDashboards.PaymentType 
		FROM Registrations 
		JOIN UserDashboards 
		ON UserDashboards.PersonId = Registrations.Id;
------------------------------------ TransportWays JOIN Trains JOIN Buses JOIN Flights ---------------------------------------

SELECT	Buses.BusesName,Buses.PersonId,
		Trains.TrainName,Trains.PersonId, 
		Flights.FlightName,Flights.PersonId  
		FROM TransportWays 
		JOIN Buses ON Buses.Id = TransportWays.BusesId 
		JOIN Trains ON Trains.Id = TransportWays.TrainId 
		JOIN Flights ON Flights.Id = TransportWays.FlightId

-----------------------------------------------------------------------------------------------------------------------------
/*
SELECT Registrations JOIN RentVehicles JOIN VehicleLocations JOIN Hotels JOIN
VisitPlaces JOIN  Places JOIN Guides
*/
SELECT	Name,
		VehicleType, VehicleModel,
		ShopName, Location,
		HotelName, Rooms,
		PlaceName,Placelocation,
		vp.Price,
		g.GuideName, g.GuideCar
		FROM Registrations AS r
		JOIN RentVehicles AS rv ON rv.PersonId = r.Id
		JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation  
		JOIN Hotels AS h ON h.VehicleLocation = vl.Id
		JOIN VisitPlaces AS vp ON vp.PersonId = h.PersonId
		JOIN Places AS p ON p.Id = vp.PlacesId
		JOIN Guides AS g ON g.Id = vp.GuidesId

-----------------------------------------------------------------------------------------------------------------------------
/*
TransportWays JOIN TransportMediums JOIN RentVehicles JOIN VehicleLocations JOIN Hotels
*/
SELECT	Source, Destination,
		VehicleType, VehicleModel,
		Location, ShopName,
		HotelName, Rooms
		FROM TransportWays AS tw
		JOIN TransportMediums AS tm ON tm.TransportWay = tw.Id
		JOIN RentVehicles AS rv ON rv.PersonId = tm.PersonId
		JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
		JOIN Hotels AS h ON h.VehicleLocation = vl.Id

-------------------------------------------------------------------------------------------------------
/*
FROM Registrations JOIN VisitPlaces JOIN UserDashboards JOIN Hotels JOIN VehicleLocations JOIN RentVehicles 
*/
SELECT Name, BookingDetails,HotelName,ShopName, Location,VehicleType,VehicleModel
		FROM Registrations AS r
		JOIN VisitPlaces AS vp ON vp.PersonId =  r.Id 
		JOIN UserDashboards AS ud ON ud.PersonId = r.Id
		JOIN Hotels AS h ON h.PersonId = r.Id
		JOIN VehicleLocations AS vl ON vl.Id = h.VehicleLocation
		JOIN RentVehicles AS rv ON rv.VehicleLocation = vl.Id

-----------------------------------------------------------------------------------------------------
/*
Hotels JOIN TransportMediumsJOIN RentVehicles JOIN VehicleLocations
*/
SELECT HotelName,Source, Destination,VehicleType,VehicleModel,ShopName, Location
		FROM Hotels AS h
		JOIN TransportMediums AS tm ON tm.PersonId = h.PersonId
		JOIN RentVehicles AS rv ON rv.PersonId = h.PersonId
		JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation

--------------------------------------------------------------------------------------------------------
/*
VehicleLocations JOIN Hotels JOIN UserDashboards JOIN RentVehicles
*/
SELECT  BookingDetails,HotelName,ShopName, Location,VehicleType,VehicleModel
		FROM VehicleLocations AS vl 
		JOIN Hotels AS h ON h.VehicleLocation = vl.Id
		JOIN UserDashboards AS ud ON ud.PersonId = h.PersonId
		JOIN RentVehicles AS rv ON rv.PersonId = h.PersonId

-----------------------------------------------------------------------------
/*
VisitPlaces JOIN Guides JOIN Places JOIN UserDashboards
*/

SELECT	BookingDetails,
		PlaceName,Placelocation,vp.Price
		GuideName,GuideCar
		FROM VisitPlaces AS vp 
		JOIN Guides AS g ON vp.GuidesId = g.Id
		JOIN Places AS p ON p.Id = vp.PlacesId
		JOIN UserDashboards AS ud ON ud.PersonId = vp.PersonId

------------------------------------------------------------------------------------------------
/*
Registrations 
JOIN RentVehicles  
JOIN Hotels 
JOIN VehicleLocations
JOIN TransportMediums
JOIN TransportWays 
JOIN Trains 
JOIN Buses 
JOIN Flights 
JOIN UserDashboards 
JOIN VisitPlaces
JOIN Places 
JOIN Guides 
*/

SELECT	Name,
		VehicleType, VehicleModel,
		HotelName, Rooms,
		ShopName, location,
		TrainName,BusesName,FlightName,
		PlaceName,Placelocation,vp.Price
		GuideName,GuideCar
		FROM Registrations AS r 
		JOIN RentVehicles AS rv ON r.Id = rv.PersonId
		JOIN Hotels AS h ON h.PersonId = r.Id
		JOIN VehicleLocations AS vl ON vl.Id = h.VehicleLocation
		JOIN TransportMediums AS tm ON tm.PersonId = r.Id
		JOIN TransportWays AS tw ON tw.Id = tm.TransportWay
		JOIN Trains AS t ON t.Id = tw.TrainId
		JOIN Buses AS b ON tw.BusesId = b.Id 
		JOIN Flights  AS f ON f.Id = tw.FlightId
		JOIN UserDashboards AS ud ON ud.PersonId = r.Id
		JOIN VisitPlaces AS vp ON vp.PersonId = r.Id
		JOIN Places AS p ON p.Id = vp.PlacesId
		JOIN Guides AS g ON g.Id = vp.GuidesId


-------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------- LEFT JOIN --------------------------------------------------------


--------------------------------------------- RentVehicles LEFT JOIN Registrations -------------------------------------------

SELECT	Registrations.Name,
		RentVehicles.Id, RentVehicles.VehicleModel, RentVehicles.PeriodTimeIn, RentVehicles.PeriodTimeOut
		FROM RentVehicles 
		LEFT JOIN Registrations ON Registrations.Id = RentVehicles.PersonId ORDER BY Registrations.Name

--------------------------------------------------------------------------------------------------------------

-------------------------- UserDashboards LEFT JOIN Registrations LEFT JOIN Hotels LEFT JOIN RentVehicles -----------------------

SELECT	Name, VehicleType, VehicleModel, HotelName, Rooms, h.Date, Wallet, BookingDetails 
		FROM UserDashboards AS ud
		LEFT JOIN Registrations AS r ON r.Id = ud.PersonId
		LEFT JOIN Hotels AS h ON h.PersonId =ud.PersonId
		LEFT JOIN RentVehicles AS rv ON rv.PersonId = ud.PersonId

-------------------------------------------------------------------------------------------------------------------------

--------------------------------------- VisitPlaces LEFT JOIN Places LEFT JOIN Guides -------------------------------------------------------

SELECT	VisitPlaces.Id,  
		Guides.GuideName,
		PlaceName
		FROM VisitPlaces 
		LEFT JOIN Places ON VisitPlaces.PlacesId = Places.Id 
		LEFT JOIN Guides ON Guides.Id = VisitPlaces.GuidesId ORDER BY VisitPlaces.Id


---------------------------------------------------------------------------------------------------------------------

------------------------------ RentVehicles LEFT JOIN VehicleLocations LEFT JOIN Hotels --------------------------------

SELECT	VehicleType,VehicleModel,ShopName,vl.Price,Location, HotelName
		FROM RentVehicles AS rv
		LEFT JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
		LEFT JOIN Hotels AS h ON h.VehicleLocation = vl.Id 


------------------------------------------------------------------------------------------------------

-------------------------------- VisitPlaces LEFT JOIN Places LEFT JOIN Guides -----------------------

SELECT	PlaceName, GuideName, GuideCar, vs.Price
		FROM VisitPlaces AS vs
		LEFT JOIN Places AS p ON p.Id = vs.PlacesId
		LEFT JOIN Guides AS g ON g.Price = vs.Price
---------------------------------------------------------------------------------------------------------------------------------

---------------------------------- Registrations LEFT JOIN Buses LEFT JOIN Trains ----------------------------------------------

SELECT	Name, BusesName,b.Class, b.Price, t.TrainName,t.Class,t.Price
		FROM Registrations AS r
		LEFT JOIN Buses AS b ON b.PersonId = r.Id
		LEFT JOIN Trains AS t ON t.PersonId = r.Id

----------------------------------------------------------------------------------------------------------------------


---------------------------------- Hotels LEFT JOIN Registrations LEFT JOIN RentVehicles -------------------------

SELECT	Name, VehicleModel,VehicleType, rv.Price, HotelName, h.Date, PriceWithFood, PriceWithoutFood
		FROM Hotels AS h
		LEFT JOIN Registrations AS r ON r.Id = h.PersonId
		LEFT JOIN RentVehicles AS rv ON rv.PersonId = h.PersonId

---------------------------------------------------------------------------------------------------------

----------------------------------- VisitPlaces LEFT JOIN UserDashboards LEFT JOIN Places ------------------------------

SELECT	BookingDetails,PlaceName, PaymentType, Gender, Wallet,Price
		FROM VisitPlaces AS vs
		LEFT JOIN UserDashboards AS ud ON ud.VisitedPlaces = vs.Id
		LEFT JOIN Places AS p ON p.Id = vs.PlacesId

---------------------------------------------------------------------------------------------------------------------------		

----------------------------------- TransportMediums LEFT JOIN TransportWays LEFT JOIN Flights ------------------------------

SELECT	FlightId, Source, Destination, tm.Price, FlightName, DateIn, DateOut, Class, f.Price,f.PersonId,tm.PersonId
		FROM TransportMediums AS tm
		LEFT JOIN TransportWays AS tw ON tw.Id = tm.TransportWay
		LEFT JOIN Flights AS f ON f.Id = tw.FlightId 
		WHERE  f.PersonId = tm.PersonId

----------------------------------------------------------------------------------------------------------

----------------------------------- TransportMediums LEFT JOIN TransportWays LEFT JOIN Flights ------------------------------

SELECT	Name, HotelName, h.Rooms,h.Date, ud.BookingDetails, ud.PaymentType, ud.Wallet, h.PriceWithFood, h.PriceWithoutFood
		FROM UserDashboards AS ud 
		LEFT JOIN Registrations AS r ON ud.PersonId = r.Id
		LEFT JOIN Hotels AS h ON h.PersonId = ud.PersonId

-----------------------------------------------------------------------------------------------

-------------------------------- Hotels LEFT JOIN VisitPlaces LEFT JOIN  Places LEFT JOIN Guides ------------------------

SELECT	HotelName, Rooms, PlaceName, PlaceLocation, vs.Price, GuideName,GuideCar 
		FROM Hotels AS h
		LEFT JOIN VisitPlaces AS vs ON vs.PersonId = h.PersonId
		LEFT JOIN Places AS p ON p.Id = vs.PlacesId
		LEFT JOIN Guides AS  g ON g.Id = vs.GuidesId
-------------------------------------------------------------------------------------
/*
6
Registrations LEFT JOIN RentVehicles LEFT JOIN VehicleLocations LEFT JOIN Hotels LEFT JOIN VisitPlaces LEFT JOIN Places LEFT JOIN Guides 
*/
SELECT	Name, 
		HotelName, Rooms, h.Date, 
		VehicleType, VehicleModel, VehicleNumber, 
		PlaceName,PlaceLocation,
		ShopName,Location
		GuideName,GuideCar,
		vs.Price
		FROM Registrations AS r
		LEFT JOIN RentVehicles AS rv ON rv.PersonId = r.Id 
		LEFT JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
		LEFT JOIN Hotels AS h ON h.VehicleLocation = vl.Id
		LEFT JOIN VisitPlaces AS vs ON vs.PersonId = h.PersonId
		LEFT JOIN Places AS p ON p.Id = vs.PlacesId
		LEFT JOIN Guides AS g ON g.Id = vs.GuidesId
----------------------------------------------------------------------------------------------------
/*
7
TransportMediums LEFT JOIN TransportWays LEFT JOIN Flights LEFT JOIN Trains LEFT JOIN Buses 
LEFT JOIN Hotels LEFT JOIN VehicleLocations LEFT JOIN RentVehicles LEFT JOIN UserDashboards
*/ 
SELECT  Source, Destination,
		FlightName, f.Class,
		TrainName, t.Class,
		BusesName, b.Class,
		vl.ShopName, Location,vl.Price,
		HotelName,Rooms,
		Wallet,PaymentType,BookingDetails
		FROM TransportMediums AS tm
		LEFT JOIN TransportWays AS tw ON tw.Id = tm.TransportWay
		LEFT JOIN Flights AS f ON f.Id =tw.FlightId
		LEFT JOIN Trains AS t ON t.Id = tw.TrainId
		LEFT JOIN Buses AS b ON b.Id = tw.BusesId
		LEFT JOIN Hotels AS h ON h.PersonId = b.PersonId
		LEFT JOIN VehicleLocations AS vl ON vl.Id = h.VehicleLocation
		LEFT JOIN RentVehicles AS rv ON rv.VehicleLocation = vl.Id
		LEFT JOIN UserDashboards AS ud ON ud.PersonId = rv.PersonId

-------------------------------------------------------------------------------------------------------------------------------------
/*
13
Registrations LEFT JOIN Hotels LEFT JOIN RentVehicles LEFT JOIN VehicleLocations LEFT JOIN VisitPlaces LEFT JOIN  Places LEFT JOIN 
Guides LEFT JOIN TransportMediums LEFT JOIN TransportWays LEFT JOIN Trains LEFT JOIN Flights LEFT JOIN Buses  LEFT JOIN UserDashboards
*/ 
SELECT	Name,
		HotelName,Rooms, h.Date
		VehicleType,VehicleModel,
		ShopName, Location,
		PlaceName, Placelocation,
		vp.Price,
		GuideName, GuideCar,
		Source, Destination,
		t.TrainName, t.Class,
		f.FlightName, f.Class,
		BusesName, b.Class
		FROM Registrations AS r
		LEFT JOIN Hotels AS h ON h.PersonId = r.Id
		LEFT JOIN RentVehicles AS rv ON rv.VehicleLocation = h.VehicleLocation
		LEFT JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
		LEFT JOIN VisitPlaces AS vp ON vp.PersonId = h.Id 
		LEFT JOIN Places AS p ON p.Id = vp.PlacesId
		LEFT JOIN Guides AS g ON g.Id = vp.GuidesId
		LEFT JOIN TransportMediums AS tm ON tm.PersonId = h.PersonId
		LEFT JOIN TransportWays AS tw ON tw.Id = h.PersonId
		LEFT JOIN Trains AS t ON t.Id = tw.TrainId
		LEFT JOIN Flights AS f ON f.Id = tw.FlightId
		LEFT JOIN Buses AS b ON b.Id = tw.BusesId
		LEFT JOIN UserDashboards AS ud ON ud.PersonId = h.PersonId


-------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------- RIGHT JOIN ----------------------------------------------------------------



---------------------------------- Registrations RIGHT JOIN Hotels ------------------------------------------------------

SELECT	r.Id, r.Name,
		h.HotelName, h.VehicleLocation, h.Date 
		FROM Registrations as r
		RIGHT JOIN Hotels as h ON r.Id = h.PersonId ORDER BY  r.Name

-------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------- UserDashboards RIGHT JOIN RentVehicles RIGHT JOIN Hotels USING (ALIAS)----------------------------------------

SELECT	ub.PersonId, h.PersonId, rv.PersonId 
		FROM UserDashboards AS ub
		RIGHT JOIN Hotels AS h ON ub.PersonId = h.PersonId
		RIGHT JOIN RentVehicles AS rv ON rv.PersonId = ub.PersonId

---------------------------------------------------------------------------------------------------------------------
/*
Registrations 
RIGHT JOIN RentVehicles 
RIGHT JOIN VehicleLocations
RIGHT JOIN Hotels 
*/

SELECT Name, VehicleType, VehicleModel, Location, ShopName, HotelName, Rooms
		FROM Registrations AS r
		RIGHT JOIN RentVehicles AS rv ON rv.PersonId = r.Id
		RIGHT JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
		RIGHT JOIN Hotels AS h ON h.Id = rv.PersonId
----------------------------------------------------------------------
/*
Registrations  
RIGHT JOIN VisitPlaces 
RIGHT JOIN Places 
RIGHT JOIN Guides 
RIGHT JOIN UserDashboards
*/
SELECT Name, PlaceName, Placelocation, GuideName, GuideCar ,vp.Price, BookingDetails
		FROM Registrations AS r 
		RIGHT JOIN VisitPlaces AS vp ON vp.PersonId = r.Id
		RIGHT JOIN Places AS p ON p.Id = vp.PlacesId
		RIGHT JOIN Guides AS g ON g.Id = vp.GuidesId
		RIGHT JOIN UserDashboards AS ud ON ud.VisitedPlaces = vp.Id

-------------------------------------------------------------------------------
/*
FROM Registrations
RIGHT JOIN RentVehicles 
RIGHT JOIN VehicleLocations
RIGHT JOIN Hotels 
RIGHT JOIN TransportMediums
RIGHT JOIN Transportways 
RIGHT JOIN Trains 
RIGHT JOIN Flights 
RIGHT JOIN Buses 
RIGHT JOIN UserDashboards 
RIGHT JOIN VisitPlaces 
RIGHT JOIN Places 
RIGHT JOIN Guides 
*/

SELECT	Name, 
		PlaceName, Placelocation, 
		GuideName, GuideCar ,
		vp.Price, 
		BookingDetails,
		Source,Destination,
		HotelName,
		Location,
		TrainName,FlightName,BusesName
		FROM Registrations AS r
		RIGHT JOIN RentVehicles AS rv ON rv.PersonId = r.Id
		RIGHT JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
		RIGHT JOIN Hotels AS h ON h.VehicleLocation = rv.VehicleLocation
		RIGHT JOIN TransportMediums AS tm ON tm.PersonId = h.PersonId
		RIGHT JOIN Transportways AS tw ON tw.Id = tm.TransportWay
		RIGHT JOIN Trains AS t ON t.PersonId = h.PersonId
		RIGHT JOIN Flights AS f ON h.PersonId = f.PersonId
		RIGHT JOIN Buses AS b ON h.PersonId = b.PersonId
		RIGHT JOIN UserDashboards AS ud ON h.PersonId = ud.PersonId
		RIGHT JOIN VisitPlaces AS vp ON h.PersonId = vp.PersonId
		RIGHT JOIN Places AS p ON p.Id = vp.PlacesId
		RIGHT JOIN Guides AS g ON g.Id = vp.GuidesId

---------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------- CROSS JOIN -----------------------------------------------------------------------------

SELECT PlaceName, Placelocation, 
		GuideName, GuideCar 
		FROM Places
		CROSS JOIN Guides
--------------------------------
SELECT 	Source,Destination,
		BookingDetails
		FROM UserDashboards
		CROSS JOIN TransportMediums
---------------------------
SELECT *
		FROM Registrations
		CROSS JOIN UserDashboards


SELECT * 
		FROM VehicleLocations
		CROSS JOIN UserDashboards
--------------------

SELECT *
		FROM UserDashboards
		CROSS JOIN VisitPlaces
		CROSS JOIN Guides
-------------
SELECT *
		FROM VehicleLocations AS vl
		CROSS JOIN UserDashboards AS ud
		JOIN TransportMediums AS tm ON tm.PersonId = ud.PersonId
		RIGHT JOIN Hotels AS h ON h.PersonId = tm.PersonId
---------------
------------------------------- Registrations CROSS JOIN RentVehicles -----------------------------------------------------------

SELECT	 r.Name, rv.VehicleType
		FROM Registrations AS r 
		CROSS JOIN RentVehicles AS rv ORDER BY rv.VehicleType
----------------------------------------------------------------------------------------

------------------------------- Practice ------------------------
--- 7 ----

SELECT tw.Id, COUNT(f.Price) AS p
FROM TransportMediums AS tm
JOIN TransportWays AS tw ON tw.Id = tm.TransportWay
JOIN Buses AS b ON b.Id = BusesId
JOIN Trains AS t ON t.Id = TrainId
JOIN Flights AS f ON f.Id = tw.FlightId
JOIN Registrations AS r ON tm.PersonId = r.Id
GROUP BY  tw.Id
ORDER BY tw.Id


SELECT *FROM Flights

----- 8 ----

SELECT h.HotelName, Name, rv.VehicleModel
FROM Hotels AS h
JOIN Registrations AS r ON r.Id = h.PersonId
JOIN RentVehicles AS rv ON rv.PersonId = r.Id

----- 9 -----

SELECT Name, HotelName, tw.Id
FROM Registrations AS r
JOIN Hotels AS h ON r.Id = h.PersonId
JOIN TransportMediums AS tm ON tm.PersonId = r.Id
JOIN TransportWays AS tw ON tw.Id = tm.TransportWay

----- 10 ----

SELECT p.PlaceName, vs.PlacesId, vs.GuidesId, g.GuideName, g.GuideCar
FROM Places AS p 
JOIN VisitPlaces AS vs
ON p.Id = vs.PLacesId
JOIN Guides AS g
ON g.Id = vs.GuidesId
WHERE vs.PlacesId = 6

------ 11 -----

SELECT tm.Source, tm.Destination, rv.VehicleType, rv.VehicleModel, rv.VehicleNumber, Name, vl.Location, vl.ShopName
FROM Registrations AS r 
JOIN TransportMediums AS tm ON tm.PersonId = r.Id
JOIN RentVehicles AS rv ON rv.PersonId = r.Id
JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
WHERE Destination = 'delhi'

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

----- 12 ----

SELECT r.Name, rv.VehicleType, rv.VehicleModel,h.HotelName,h.CheckIn, h.CheckOut, h.Date,rv.PeriodTimeIn, rv.PeriodTimeOut
FROM Hotels AS h
JOIN Registrations AS r ON r.Id = h.PersonId
JOIN RentVehicles AS rv ON rv.PersonId = r.Id
WHERE rv.VehicleType = 'Scooter'

---- 13 ----

SELECT
r.Name,
tm.StartDate, tm.EndDate, tm.Source, tm.Destination,
f.FlightName,f.DateIn,f.DateOut,f.Price, f.Class, f.Adult, f.Child,
t.TrainName,t.DateIn,t.DateOut,t.Price, t.Class, t.Adult, t.Child,
b.BusesName,b.DateIn,b.DateOut,b.Price, b.Class, b.Adult, b.Child
FROM TransportWays AS tw
JOIN TransportMediums AS tm ON tm.TransportWay = tw.Id
JOIN Registrations AS r ON r.Id = tm.PersonId
JOIN Flights AS f ON f.Id = tw.Id
JOIN Buses AS b ON b.Id = tw.Id
JOIN Trains AS t ON t.Id = tw.Id
WHERE tm.StartDate = '2022-10-23'

----- 14 -----
SELECT	Name, Email,
		BookingDetails, Wallet, Gender,
		VehicleType,VehicleModel,
		HotelName, Rooms, PriceWithFood, PriceWithoutFood
		FROM Registrations AS r
		JOIN UserDashboards AS ud ON ud.PersonId = r.Id
		LEFT JOIN RentVehicles AS rv ON rv.PersonId = r.Id
		RIGHT JOIN Hotels AS h ON h.PersonId = rv.PersonId

SELECT * FROM Registrations;--**			
SELECT * FROM Hotels;--					 
SELECT * FROM UserDashboards;--			
SELECT * FROM Guides;--**
SELECT * FROM Places;--**
SELECT * FROM VisitPlaces;--**
SELECT * FROM VehicleLocations;--**
SELECT * FROM TransportMediums;--**
SELECT * FROM RentVehicles;--**
SELECT * FROM TransportWays;--**
SELECT * FROM Trains;--**
SELECT * FROM Flights;--**
SELECT * FROM Buses;--**
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

----------------------------------------------------------------------------
----10-11-2022----

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
-----------------------------

DECLARE @count INT
DECLARE @limit INT
SET @count = 0
SET @limit = 2;

WHILE @count < 10
BEGIN
	SELECT * FROM RentVehicles
	ORDER BY Id
	OFFSET @count ROWS
	FETCH NEXT @limit ROWS ONLY
	SET @count = @count + 1
END
---------------------------

DECLARE @count INT
DECLARE @limit INT
	SET @count = 1;
	SET @limit = 2;
	WHILE @count < 10
		BEGIN
			SELECT * FROM Places
			ORDER BY Id
			OFFSET @count ROWS
				FETCH NEXT @limit ROWS ONLY
				SET @count = @count + 1
END

--select VehicleModel, sum(Price) AS p
--from RentVehicles
--Group by VehicleModel
--having sum(Price) > 0

--select VehicleModel, avg(Price) AS p
--from RentVehicles
--Group by VehicleModel
--having avg(Price) > 0

--select VehicleModel,Price
--from RentVehicles

--SELECT VehicleLocation FROM RentVehicles
--UNION ALL
--SELECT  Id FROM VehicleLocations

--select distinct VehicleType from RentVehicles

---12-11-2022----

USE LiteTravels;

ALTER FUNCTION east_or_west
(
	@long DECIMAL(9,6)
)
RETURNS CHAR(4)
AS
BEGIN
	DECLARE @return_value CHAR(4)
	SET @return_value = 'same';
	IF(@long > 0.00) SET @return_value = 'east';
	IF(@long < 0.00) SET @return_value = 'west';

	RETURN @return_value
END;

SELECT dbo.east_or_west(0) AS argument_0, dbo.east_or_west(-1) AS argument_minus_1, dbo.east_or_west(1) AS argument_plus_1

SELECT *, dbo.east_or_west(Vehicle.VehicleNumber)
FROM Vehicle

--just copy the schema without its data--

SELECT TOP 0* INTO TempTable1 FROM RentVehicles
SELECT * FROM TempTable1
---------
--make clustered index with the commbination of multiple colummns and try to insert duplicate values within that combination--
CREATE TABLE Vehicle
(                                                                                                                                                                                                                                                              
VehicleType VARCHAR(20),
VehicleModel VARCHAR(20),
VehicleNumber VARCHAR(20),
Price MONEY
)
INSERT INTO Vehicle SELECT VehicleType,VehicleModel,VehicleNumber,Price FROM RentVehicles
SELECT * FROM RentVehicles
drop table vehicle                                                                                                                     

CREATE CLUSTERED INDEX ix_VehicleType_Model
ON Vehicle(VehicleType,VehicleModel)
-----------
SELECT * FROM Vehicle
--13-11-2022


-----------------------------14-11-2022------------------------------------------------------
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
-- RANKING FUNCTION
CREATE TABLE #ExamResult
(
Id INT IDENTITY,
StudentName VARCHAR(20),
Subject VARCHAR(10),
Marks NUMERIC
)
INSERT INTO #ExamResult VALUES('Lily',  'Maths',  65);
INSERT INTO #ExamResult VALUES('Lily',  'Science',  80);
INSERT INTO #ExamResult VALUES('Lily', 'english', 70);
INSERT INTO #ExamResult VALUES('Isabella',  'Maths',  50);
INSERT INTO #ExamResult VALUES('Isabella',  'Science',  70);
INSERT INTO #ExamResult VALUES('Isabella',  'english', 90);
INSERT INTO #ExamResult VALUES('Olivia',  'Maths',  55);
INSERT INTO #ExamResult VALUES('Olivia',  'Science',  60);
INSERT INTO #ExamResult VALUES('Olivia',  'english',  89);

--ROW_NUMBER

SELECT
Id,
StudentName,
Subject,
Marks,
ROW_NUMBER() OVER(ORDER BY Marks) AS RowNumber
FROM #ExamResult


--RANK PARTITION BY --

SELECT 
Id,
StudentName,
Subject,
Marks,
RANK() OVER(PARTITION BY StudentName ORDER BY Marks DESC) Rank
FROM
#ExamResult

SELECT 
Id,
StudentName,
Subject,
Marks,
DENSE_RANK() OVER(ORDER BY Marks DESC) Rank
FROM
#ExamResult


SELECT 
Id,
StudentName,
Subject,
Marks,
RANK() OVER(ORDER BY Marks DESC) Rank
FROM
#ExamResult

-- DENSE_RANK

SELECT 
Id,
StudentName,
Subject,
Marks,
DENSE_RANK() OVER(PARTITION BY Subject ORDER BY Marks DESC) Rank
FROM
#ExamResult

UPDATE #ExamResult SET Marks = 70 WHERE StudentName = 'Isabella' AND Subject = 'Maths'

SELECT * FROM #ExamResult


SELECT 
Id,
StudentName,
Subject,
Marks,
RANK() OVER(PARTITION BY StudentName ORDER BY Marks) AS Rank
FROM
#ExamResult
ORDER BY StudentName, Rank

SELECT
ID,
StudentName,
Subject,
Marks,
DENSE_RANK() OVER(PARTITION BY StudentName ORDER BY Marks) AS Rank
FROM 
#ExamResult
ORDER BY StudentName, Rank

SELECT * INTO ExamResult FROM #ExamResult
--NTILE

SELECT *, NTILE(4)OVER(ORDER BY Marks DESC) Rank
FROM #ExamResult
ORDER BY Rank

SELECT *, NTILE(2)OVER(ORDER BY Marks DESC) Rank
FROM #ExamResult
ORDER BY Rank, Id

SELECT *, 
NTILE(2) OVER(PARTITION BY Subject ORDER BY Marks DESC) AS Rank
FROM #ExamResult
ORDER BY Subject,Rank,Id

 ---- CTE
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

WITH 
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


WITH
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

WITH
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

-------------------------------15-11-2022------------------------------------------

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

DECLARE @columns NVARCHAR(MAX) = '';
SELECT 
	@columns  += QUOTENAME(VehicleModel) + ','
	FROM RentVehicles
	ORDER BY VehicleModel;
SET @columns = LEFT(@columns,LEN(@columns) - 1)

PRINT @columns;

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

SELECT BookingDetails, Wallet,Gender
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
USE LiteTravels

---17-11-2022----

USE LiteTravels;

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

USE Temporary

CREATE TABLE #Subjects(SubjectID INT, 
SubjectName VARCHAR(25))

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
USE LiteTravels

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

---18-11-2022------

USE LiteTravels

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

----------------------------

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
USE LiteTravels

---22-11-2022-----

USE LiteTravels

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

UPDATE TransportMediums SET Destination='Mumbai' WHERE Id = 21

SELECT * FROM TransportMediums
UPDATE TransportMediums SET Destination='delhi' WHERE Id = 2


SELECT * FROM Registrations
SELECT * FROM RentVehicles
SELECT * FROM VehicleLocations
SELECT * FROM Hotels
SELECT * FROM Places
SELECT * FROM Guides
SELECT * FROM VisitPlaces
SELECT * FROM Buses
SELECT * FROM Flights
SELECT * FROM Trains
SELECT * FROM TransportMediums
SELECT * FROM TransportWays
SELECT * FROM UserDashboards

------

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

-----------
ALTER PROCEDURE sp_DOB
@DOB DATE
AS
BEGIN 
	DECLARE @Age INT
  
	SET @AGE = DATEDIFF(YEAR,@DOB, GETDATE()) -
		CASE
		WHEN
		--(MONTH(@DOB) > MONTH(GETDATE())) 
		--OR
			(MONTH(@DOB)=MONTH(GETDATE()) OR DAY(@DOB) > DAY(GETDATE()))
			THEN 1
			ELSE 0
		END;
	SELECT @Age AS DOB
END;

EXECUTE sp_DOB '1999-10-20' 
---------
WITH cte_Hoteals AS
(
SELECT ROW_NUMBER() OVER(ORDER BY HotelName DESC) AS RowNo,
HotelName,Rooms,ROUND(PriceWithFood,2,1) AS "PriceWithFood"
FROM Hotels
)
SELECT RowNo,HotelName,PriceWithFood
FROM cte_Hoteals
WHERE RowNo > 5 AND RowNo < 11

------
DECLARE @pageNo int -- 1 based
DECLARE @pageSize int
SET @pageNo = 51
SET @pageSize = 20

DECLARE @firstRecord int
DECLARE @lastRecord int
SET @firstRecord = (@pageNo - 1) * @pageSize + 1 -- 1001
SET @lastRecord = @firstRecord + @pageSize - 1   -- 1020

DECLARE @orderedKeys TABLE (
  rownum int IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
  TableKey int NOT NULL
)

SET ROWCOUNT @lastRecord
INSERT INTO @orderedKeys (TableKey) SELECT ID FROM Orders WHERE OrderDate >= '1980-01-01' ORDER BY OrderDate



DECLARE @PageNo INT
DECLARE @PageSize INT

SET @pageNo = 1
SET @PageSize = 20 

DECLARE @FirstRecord INT
DECLARE @LastRecord INT

SET @FirstRecord = (@pageNo - 1) * @PageSize + 1
SET @LastRecord = @FirstRecord + @pageSize - 1

DECLARE @OrderedKey TABLE
(
	RowNum INT IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
	TableKey INT NOT NULL
)
SET ROWCOUNT @LastRecord
INSERT INTO @orderedKey (TableKey) SELECT Id FROM RentVehicles WHERE Date >='2022-08-14' ORDER BY Date
SET ROWCOUNT 0
SELECT rv.VehicleType, rv.VehicleModel,rv.VehicleNumber,rv.PersonNumber, rv.PeriodTimeIn,rv.PeriodTimeOut, rv.Price,rv.Date,rv.VehicleLocation,rv.PersonId
FROM RentVehicles AS rv
JOIN @OrderedKey AS o ON o.TableKey = rv.Id
WHERE o.RowNum >= @FirstRecord
ORDER BY o.RowNum

--------

CREATE PROCEDURE sp_Paging
(
@PageNo INT,
@Records INT
)
AS
BEGIN 
DECLARE @OffsetCount INT
SET @OffsetCount = (@PageNo - 1) * @Records
SELECT Id,Name, Email FROM Registrations ORDER BY Id OFFSET @OffsetCount ROWS FETCH NEXT @Records ROWS ONLY
END

EXECUTE sp_paging 2,3
------

----23-11-2022------

USE LiteTravels

---- Triggers -----

;WITH cte_visitplaces
AS
(
SELECT vp.Id,p.PlaceName,p.Placelocation FROM VisitPlaces AS vp
JOIN Places AS p ON p.Id = vp.PlacesId
)
SELECT * FROM cte_visitplaces

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
--------
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

--------
CREATE TABLE Employees
(
Id INT IDENTITY,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(40) NOT NULL
)
BULK INSERT Employees
FROM 'C:\Users\SIXSIGMA\Documents\SQL Server Management Studio\employ.csv'
WITH 
(
ROWTERMINATOR = '\n',
FIELDTERMINATOR = ','
)
SELECT * FROM Employees
DROP TABLE Employees
-------

----24-11-2022-----------

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


--------

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

-------

CREATE TABLE Invoices
(
Id INT PRIMARY KEY IDENTITY,
Customer_Id INT NOT NULL,
Total DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK(total >= 0)
)

CREATE TABLE Invoice_Items
(
Id INT,
Invoice_Id INT NOT NULL,
Item_Name  VARCHAR(100) NOT NULL,
Amount DECIMAL(10,2) NOT NULL CHECK (Amount >= 0),
Tax DECIMAL(4,2) NOT NULL CHECK(Tax >= 0),
PRIMARY KEY (Id, Invoice_Id),
FOREIGN KEY (Invoice_Id) REFERENCES Invoices(Id)
ON UPDATE CASCADE 
ON DELETE CASCADE
)

BEGIN TRANSACTION;

DECLARE @Invoice TABLE
(
Id INT
)
DECLARE @Invoice_Id INT;

INSERT INTO Invoices (Customer_Id,Total)
OUTPUT inserted.Id INTO @Invoice
VALUES(100,0);
SELECT @Invoice_Id = Id FROM @Invoice
INSERT INTO Invoices(Customer_Id,Total)
VALUES(100,0)

INSERT INTO Invoice_Items(Id,Invoice_Id,Item_Name,Amount,Tax) VALUES
(10,1,'Keyboard', 70,0.08),
(20,1,'Mouse',50,0.08)

UPDATE Invoices
SET Total = (
			SELECT SUM(Amount * (1 + Tax))
			FROM Invoice_Items
			WHERE Invoice_Id =@Invoice_Id
)
COMMIT;

SELECT * FROM Invoices

SELECT * FROM Invoice_Items

-------

CREATE TABLE Product
(
Product_Id INT PRIMARY KEY,
Name VARCHAR(40),
Price INT,
Quantity INT
)
GO
INSERT INTO Product VALUES(101,'mouse',1000,10)
INSERT INTO Product VALUES(102,'keyboard',1000,15)
INSERT INTO Product VALUES(103,'monitor',9000,20)
INSERT INTO Product VALUES(104,'cpu',10000,25)
INSERT INTO Product VALUES(105,'ram',2500,30)

select * from Product

BEGIN TRANSACTION 
INSERT INTO Product VALUES(106,'hard disk',5000,20)
UPDATE Product SET Price = 15000 WHERE Product_Id = 103
DELETE FROM Product WHERE Product_Id = 103
COMMIT TRANSACTION

SELECT * FROM Product

----------

BEGIN TRANSACTION 
INSERT INTO Product VALUES(106,'Pcvcl wire',1000,100)
UPDATE Product SET Price = 9500 WHERE Product_Id = 104
DELETE FROM Product WHERE Product_Id = 104
------------
BEGIN
INSERT INTO Product VALUES(110,'ear phones',600,30)
INSERT INTO Product VALUES(110,'ear phones',600,30)
IF(@@ERROR > 0)
BEGIN
	ROLLBACK TRANSACTION
END
ELSE
BEGIN
	COMMIT TRANSACTION
END
END
---------
CREATE TABLE #Customer
(
    CustomerID INT PRIMARY KEY,
    CustomerCode VARCHAR(10),
    CustomerName VARCHAR(50)
)
CREATE PROCEDURE sp_#customer
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO #Customer VALUES(1, 'code_1','aparna')
INSERT INTO #Customer VALUES(2,'code_2','abhishek')
IF(@@ERROR > 0)
BEGIN
	ROLLBACK TRANSACTION
END
ELSE
BEGIN
	COMMIT TRANSACTION
END
END

EXECUTE sp_#customer
SELECT * FROM #Customer

	BEGIN TRANSACTION tran_#customers_1
		INSERT INTO  #Customer VALUES(1,'code_1','kirti')
		INSERT INTO #Customer VALUES(2,'code_2','urja')

		BEGIN TRANSACTION tran_#customers_2
		INSERT INTO #Customer VALUES(3,'code_3','leena')
		INSERT INTO #Customer VALUES(4,'code_4','sumitra')
		PRINT @@TRANCOUNT

		COMMIT TRANSACTION tran_#customer_2
		PRINT @@TRANCOUNT

	COMMIT TRANSACTION tran_#customers_1
	PRINT @@TRANCOUNT

---------------------------------
CREATE TABLE #customer
(
Id INT ,
CODE VARCHAR(20),
Name VARCHAR(20)
)


BEGIN TRANSACTION
	SAVE TRANSACTION SavePoint1
		INSERT INTO #Customer VALUES(1,'code_1','ramesh')
		INSERT INTO #Customer VALUES(2,'code_2','sanjay')

	SAVE TRANSACTION SavePoint2
		INSERT INTO #Customer VALUES(3,'code_3','priyanka')
		INSERT INTO #Customer VALUES(4,'code_4','tarun')

	SAVE TRANSACTION SavePoint3
		INSERT INTO #Customer VALUES(5,'code_5','prerna')
		INSERT INTO #Customer VALUES(6,'code_6','eva')

				CASE	ROLLBACK TRANSACTION SavePoint1

					CASE ROLLBACK TRANSACTION SavePoint2

						CASE ROLLBACK TRANSACTION SavePoint3

SELECT * FROM #Customer	

CREATE TABLE #Reg
(
Id INT,
FirstName VARCHAR(20),
LastName VARCHAR(20)
)
SELECT * FROM #Reg
BEGIN TRANSACTION 
	SAVE TRANSACTION SavePoint1
		INSERT INTO #Reg VALUES(1,'karuna','desai')
		INSERT INTO #Reg VALUES(2,'apurva','patadia')
		INSERT INTO #Reg VALUES(3,'opra','vinfri')
		INSERT INTO #Reg VALUES(4,'hetvi','joshi')
		INSERT INTO #Reg VALUES(5,'shivani','doshi')

	SAVE TRANSACTION SavePoint2
		UPDATE #Reg SET LastName = 'jain' WHERE Id = 1
		UPDATE #Reg SET FirstName = 'Manu' WHERE Id = 5

	SAVE TRANSACTION SavePoint3
		DELETE FROM #Reg WHERE Id = 3

			
BEGIN TRANSACTION tran_Reg1
	SAVE TRANSACTION SavePoint1
		INSERT INTO #Reg VALUES(6,'urja','jobanputra')
		INSERT INTO #Reg VALUES(7,'karishma','tanna')

	BEGIN TRANSACTION tran_Reg2
		SAVE TRANSACTION SavePoint2
		INSERT INTO #Reg VALUES(7,'grishma','makhija')
		INSERT INTO #Reg VALUES(8,'manish','manhotra')

	COMMIT TRANSACTION tran_Reg2
	ROLLBACK TRANSACTION SavePoint2

COMMIT TRANSACTION tran_Reg1

SELECT * FROM #Reg

CREATE TABLE Hotelas
(
Id INT IDENTITY,
PRICE INT
)

DROP TABLE Hotelas

CREATE PROCEDURE sp_Hotels_1
AS
 BEGIN TRY
DECLARE @num INT, @msg varchar(200)
---- Divide by zero to generate Error
SET @num = 5/0
PRINT 'This will not execute'
END TRY
BEGIN CATCH
PRINT 'Error occured that is'
set @msg=(SELECT ERROR_MESSAGE())
print @msg;
END CATCH
GO 

 BEGIN TRY
DECLARE @num INT
---- Divide by zero to generate Error
SET @num = 5/0
PRINT 'This will not execute'
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_SEVERITY() AS ErrorSeverity, ERROR_STATE() AS ErrorState, ERROR_PROCEDURE() AS ErrorProcedure, ERROR_LINE() AS ErrorLine, ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

--25-11-2022----

USE LiteTravels

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

------CTE -----
;WITH cte_UserBoard
AS
(
SELECT r.Id,Name,BookingDetails, AVG(Wallet) AS wallet,Gender,BusesName,Class,SUM(Adult + Child) AS GroupPerson, Price
FROM UserDashboards AS ud
JOIN Registrations AS r ON r.Id = ud.PersonId
JOIN Buses AS b ON b.PersonId = ud.PersonId
GROUP BY r.Id,Name,BookingDetails,Gender,BusesName,Class, Price
HAVING AVG(Wallet) > 800 AND SUM(Adult + Child) > 1
)
SELECT * FROM cte_UserBoard


;WITH cte_TransportMed
AS
(
SELECT Id,PersonId,Source, Destination, Price, StartDate, EndDate
FROM TransportMediums
WHERE PersonId = 20
UNION ALL
SELECT tm.Id,tm.PersonId,tm.Source, tm.Destination,tm.Price, tm.StartDate, tm.EndDate
FROM TransportMediums AS tm
JOIN cte_TransportMed AS ctm ON ctm.Id= tm.PersonId
)
SELECT * FROM cte_TransportMed


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

--