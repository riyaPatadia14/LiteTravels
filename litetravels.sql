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
SELECT Id FROM Registrations ORDER BY Id
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
('Asthaa Sheikh', 'asthaasheikh@gmail.com'),
('Huzefa Malik', 'huzefamalik@gmail.com'),
('Altaf Gandhi', 'altafgandhi@gmail.com'),
('Monisha Desai', 'monishadesai@gmail.com'),
('Laruen Dzouza', 'laruendzouza@gmail.com'),
('Mehak Parmar', 'mehakparmar@gmail.com'),
('Sudha Bhardwaj', 'sudhabhardwaj@gmail.com'),
('Abhishek Verma', 'abhishekverma@gmail.com'),
('Varun Grover', 'varungrovar@gmail.com'),
('Anand Gandhi', 'anandgandhi@gmail.com'),
('Akash Parmar', 'akashparmar@gmail.com'),
('Rony Fernandes', 'ronyfernandes@gmail.com'),
('Amisha Devagn', 'amishadevgan@gmail.com'),
('Soumili Gosh', 'soumiligosh@gmail.com'),
('Richa Chattbar', 'richachattbar@gmail.com'),
('Dharvi vala', 'dharvivala@gmail.com')
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

--ALTER TABLE RentVehicles
--DROP COLUMN Location ;

ALTER TABLE RentVehicles
ADD VehicleLocation INT ;

ALTER TABLE RentVehicles 
ADD CONSTRAINT FK_VehicleLocationRentVehicles FOREIGN KEY (VehicleLocation) REFERENCES VehicleLocations(Id) 

SELECT * FROM RentVehicles
ALTER TABLE RentVehicles
ADD PersonId INT ;
SELECT Id FROM Registrations ORDER BY Id
ALTER TABLE RentVehicles 
ADD CONSTRAINT FK_PersonIdRentVehicles FOREIGN KEY (PersonId) REFERENCES Registrations(Id) 
SELECT Id FROM VehicleLocations ORDER BY Id
--DROP TABLE RentVehicles;
SELECT Id FROM VehicleLocations ORDER BY Id;
--TRUNCATE TABLE RentVehicles;
DELETE FROM RentVehicles WHERE Id = 27
SELECT  PersonId FROM RentVehicles ORDER BY PersonId
INSERT INTO RentVehicles
(VehicleType, VehicleModel, VehicleNumber, PersonNumber, PeriodTimeIn, PeriodTimeOut, Price, VehicleLocation, Date, PersonId) VALUES
('Car', 'suv-700', 'GJ12 AB 1245', '12456897', '08:00', '08:15', '12000', 14, '2022-10-27', 4),
('Scooter', 'Activa', 'GJ6 jk 2354', '89565236', '08:05', '09:09', '7000', 3, '2022-03-05', 25),
('Cycle', 'normal', 'GJ03 hk 5849', '4562153', '9:00', '10:00', '1000', 2, '2022-01-22', 23),
('Bike', 'Pulzar', 'MP06 kd 3625', '45612548', '10:00', '10:20', '8000', 6, '2022-06-10', 17),
('Scooter', 'Vespa', 'RJ02 fg 3215', '21345687', '09:00', '08:00', '1600', 7, '2022-03-15', 1),
('Bike', 'Bullet', 'DL01 ho 4562', '2315425', '01:00', '08:00', '8000', 12, '2022-11-16', 22),
('Car', 'Amaze', 'UP06 th 3256', '21548792', '11:10', '10:00', '17000',20, '2022-04-13', 20),
('Cycle', 'normal', 'MH02 as 2514', '32154671', '03:00', '08:00', '1200', 9,'2022-05-14', 16),
('Scooter', 'Activa', 'GJ01 ui 3652', '1654853', '10:15', '12:00', '12000', 1,'2022-06-25', 5),
('Cycle', 'normal', 'RJ31 vb 3584', '32654152', '09:12', '08:00', '1800',13,'2022-09-27', 24),
('Car', 'Ecco', 'MH06 we 8456', '32589675', '08:30', '02:58', '15000', 19,'2022-03-06', 6),
('Car', 'Magneta', 'KN01 ty 6524', '98745612', '07:30', '09:30', '16000',15, '2022-08-15', 3),
('Scooter', 'Activa', 'UP06 wn 3218', '32847851', '08:30', '07:45', '5000',17,'2022-07-11', 7),
('Car', 'Baleno', 'WB01 na 3218', '95847148', '06:00', '08:00', '10000',18, '2022-08-14', 8),
('Cycle', 'normal', 'WB08 vb 6258', '69854452', '10:00', '11:00', '6000',11, '2022-10-18', 13),
('Car', 'city', 'MH08 oi 9874', '98542546', '09:45', '3:50', '15000',5,' 2022-08-19', 10),
('Scooter', 'Amaze', 'KN09 ki 6985', '32589658', '08:00', '10:12', '800',4,' 2022-03-05', 21),
('Car', 'Verna', 'TN04 qb 5874', '35987812', '08:45', '10:20', '9000',16, '2022-07-06',9),
('Cycle', 'normal', 'MP05 fr 5625', '32548165', '08:00', '06:00', '1200',8,'2022-05-12',14),
('Scooter', 'Vespa', 'PJ05 hj 3256', '69587455', '10:00', '11:45', '6000',10, '2022-05-17',18),
('Scooter', 'Fascino', 'WB', '125489652', '10:00', '09:45', '1500',21, '2022-05-06',2),
('Car', 'ertiga', 'DL01 jk 2365', '85469512', '09:45', '11:00', '2500',22, '2022-03-12',11),
('Bike', 'yamaha','SK03 ko 9856', '85695153', '07:23', '11:36', '1500',23, '2022-10-20',12),
('Scooter', 'Dio', 'GJ03 bn 2569', '23560159', '09:30', '10:44', '1200',24, '2022-09-21',15),
('Cycle', 'normal', 'MP02 rt 3201', '85471259', '10:16', '09:39', '900',25, '2022-08-22',19),
('Car', 'taigun', 'MH09 fg 0325', '30256985', '02:20', '08:23', '1800',26, '2022-07-23',57),
('Bike', 'raider', 'KL08 nc 2984 ', '12045896', '05:45', '07:18', '1200',45, '2022-06-24',41),
('Scooter', 'Activa', 'KN07 iy 8574', '32045896', '06:15', '06:20', '1200',47, '2022-05-25',46),
('Cycle', 'normal', 'TN12 aw 9502', '20136985', '07:36', '12:45', '1700',32, '2022-04-26',51),
('Bike', 'apache', 'AP13 mq 8540', '02158469', '01:47', '11:33', '1850',33, '2022-03-27',47),
('Car', 'bolero', 'AN08  mi 9021', '26985236', '08:43', '10:00', '1950',34, '2022-02-28',49),
('Scooter', 'Dio', 'MP09 nw 3021', '59801236', '09:36', '09:08', '2000',35, '2022-01-29',42),
('Car', 'tiguna', 'MH28 xc 9630', '58963521', '10:00', '08:45', '2500',36, '2022-10-01',55),
('Bike', 'hunter', 'KN9 by 6210', '36985201', '08:06', '05:00', '2300',37, '2022-11-02',44),
('Scooter', 'Vespa', 'MH19 qr 0369', '85962513', '09:12', '04:29', '1800',38, '2022-10-03',18),
('Cycle', 'normal', 'MP29 ji 1204', '98547125', '12:36', '06:36', '1000',39, '2022-09-04',48),
('Bike', 'pulsar', 'KL21 fg 3078', '98602158', '11:35', '07:45', '2400',40, '2022-08-05',45),
('Scooter', 'Fascino','TN23 xo 3697', '63521480', '10:09', '08:48', '2500',41, '2022-07-06',56),
('Bike', 'raider', 'AN15 dl 7410', '97023568', '05:15', '09:23', '1250',42, '2022-06-07',43),
('Scooter', 'vespa','UK02 lj 6215', '98541256', '06:45', '10:15', '1890',43, '2022-05-08',50),
('Car','scorpio','LK01 mb 9678','36528456','08:45','09:26','2300',44,'2022-04-09',52),
('Bike','apache','KM14 dr 2803','25687412','07:50','05:18','1680',46,'2022-03-10',51),
('Scooter','jupiter','JM10 gb 2000','98741256','09:00','06:50','1350',21,'2022-02-11',53),
('Cycle','normal','PJ02 lb 3451','96021563','10:10','08:45','1950',32,'2022-01-12',54)
UPDATE RentVehicles SET VehicleNumber = 'WB02 oi 8475' WHERE Id = 38
DELETE FROM RentVehicles WHERE Id BETWEEN 23 AND 26
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

--ALTER TABLE Hotels
--DROP COLUMN Location;

ALTER TABLE Hotels
ADD VehicleLocation INT ;

ALTER TABLE Hotels
ADD CONSTRAINT FK_VehicleLocationHotels FOREIGN KEY (VehicleLocation) REFERENCES VehicleLocations(Id) 
SELECT VehicleLocation FROM Hotels ORDER BY VehicleLocation
SELECT Id FROM VehicleLocations ORDER BY Id
ALTER TABLE Hotels
ADD CONSTRAINT FK_PersonIdHotels FOREIGN KEY (PersonId) REFERENCES Registrations(Id) 
SELECT Id FROM Registrations ORDER BY Id
SELECT Id FROM VehicleLocations ORDER BY Id;
DROP TABLE Hotels;
TRUNCATE TABLE Hotels;
SELECT VehicleLocation  FROM Hotels ORDER BY VehicleLocation
UPDATE Hotels SET HotelName = 'Nimo' WHERE Id = 8
UPDATE Hotels SET PersonId = 19 WHERE Id = 4
UPDATE Hotels SET PersonId = 20 WHERE Id = 2
UPDATE Hotels SET PersonId = 17 WHERE Id = 1
UPDATE Hotels SET  CheckIn = 2022-06-15 , CheckOut = 2022-06-19,  Date = 2022-06-15 WHERE Id = 9 
UPDATE Hotels SET  CheckIn = 2022-01-03  , CheckOut = 2022-01-19,  Date = 2022-01-03 WHERE Id = 20 
INSERT INTO Hotels(HotelName, CheckIn, CheckOut, PriceWithFood, PriceWithoutFood, Rooms, VehicleLocation, Date, PersonId) VALUES
('Ocean Sea','2022-03-01 10:05 ','2022-03 -05 03:05 ','7000','2500','normal',1,'2022-03-01',24),
('Wellness','2022-02-12  12:21','2022-05-12  21:05','8000','3000','luxury',20,'2022-02-12',22),
('Shantinest','2022-05-08 08 :21','2022-05 -12  09:10','9000','3500','normal',2,'2022-05-08',6),
('Dong Bang','2022-06-17 02:10','2022- 06-19 02:15','10000','5000','normal',6,'2022-06-17',20),
('Worst Western','2022-06-14  09:15','2022-06 -16  10:20','12600','6600','luxury',9,'2022-06-14',18),
('Black Butte','2022-09-13 10:45 ','2022-09 -15  10 :40','11000','7000','normal',19,'2022-09-13',16),
('Anu’s','2022-12-17 10:00 ','2022-12 -21  06:12','13000','6700','luxury',10,'2022-12-17',14),
('Rydeaux','2022-11-17 10:11 ','2022-11 - 20  12:25','12000','7500','luxury',11,'2022-11-17',3),
('Sunday Summer','2022-06-14 11 : 12','2022- 06- 19  10:45','10500','5500','luxury',15,'2022-06-14',13),
('weekend',' 2022-09-19 09:06 ','2022-09 - 21 11:45','9000','5000','luxury',2,'2022-09-19',15),
('airsharp','2022-06-24 10:00 ','2022- 06-26  10:20','8000','4500','normal',3,'2022-06-24',7),
('wednesday','2022-04-16  08:23 ','2022- 04- 19 09:15','10000','5000','normal',6,'2022-04-16',5),
('Seascape','2022-07-18 09:16 ','2022-07 -20  08:19','9000','3500','luxury',12,'2022-07-18',4),
('The Cozy','2022-09-26  08:15 ','2022- 09-29 09 :10','8000','2500','normal',8,'2022-09-26',10),
('Ibis','2022-02-14 07:45 ','2022-02 -18  10:12','7000','3500','luxury',17,'2022-02-14',9),
('Hilton ','2022-01-30 08:24 ','2022-02 - 02  09:12','8000','5000','normal',12,'2022-01-30',8),
('Mango','2022-12-06 09:25 ','2022-12 -08  06:07','10000','5000','luxury',11,'2022-12-06',12),
('Fitzgerald ','2022-09-17 10:34 ','2022- 09-21   10:18','9000','3500','normal',7,'2022-09-17',1),
('Aman','2022-05-18  11:00 ','2022-05-20 11:45','8000','4500','luxury',14,'2022-05-18',11),
('The Turkey Shore','2022-10-03 10:10 ','2022-10-06  10:00','6000','2000','normal',5,'2022-10-03',2),
('Marriott','2022-06-13 08:10 ','2022-06-15 11:12','8000','3500','normal',23,'2022-06-13',17),
('Hyatt','2022-05-12 10:10 ','2022-05-15 11:20','6500','2300','luxury',24,'2022-05-12',17),
('Belmond','2022-04-16 10:10 ','2022-04-18 08:17','7500','3500','normal',21,'2022-04-16',19),
('Rosewood','2022-03-18 10:10 ','2022-03-20 06:21','8900','4500','luxury',25,'2022-03-18',1),
('Aman','2022-02-20 10:10 ','2022-02-22 08:30','10000','5500','luxury',22,'2022-02-20',19),
('Farmer’s Daughter','2022-01-30 10:10 ','2022-02-02 09:45','8500','3500','normal',47,'2022-01-30',21),
('Your Tokyo','2022-09-17 10:10','2022-09-20 10:20','7800','4000','luxury',46,'2022-09-17',23),
('Great Gravity','2022-08-11 10:10','2022-08-13 11:26','8600','3600','normal',45,'2022-08-11',25),
('Going to Haven','2022-07-08 10:10','2022-07-10  08:25','9600','3600','luxury',44,'2022-07-08',52),
('Gotham','2022-06-19 10:10 ','2022-06-22 12:05','8800','3800','luxury',43,'2022-06-19',42),
('Giggle','2022-04-21 10:10 ','2022-04-23 06:20','9500','4400','luxury',42,'2022-04-21',41),
('Wordly','2022-03-15 10:10 ','2022-03-17 07:50','8900','5000','normal',41,'2022-03-15',43),
('Sandy Bloom','2022-02-14 10:10 ','2022-02-15 09:25','9000','4500','normal',40,'2022-02-14',44),
('Blue Moon','2022-01-12 10:10 ','2022-01-15 10:10','8500','3800','luxury',39,'2022-01-12',45),
('Moss View','2022-11-13 10:10 ','2022-11-16 11:55','6900','2300','normal',38,'2022-11-13',46),
('Mofo Cuzzi','2022-10-23 10:10 ','2022-10-26 09:36','8960','3700','luxury',37,'2022-10-23',47),
('Newhouse','2022-12-14 10:10 ','2022-12-16 09:28','7680','4600','normal',36,'2022-12-14',48),
('The Pie','2022-10-19 10:10 ','2022-10-21 08:39','6700','2900','luxury',35,'2022-10-19',49),
('Elephant Butte Inn','2022-11-04 10:10 ','2022-11-07 07:21','6900','2700','luxury',34,'2022-11-04',50),
('ABAD','2022-12-16 10:10 ','2022-12-18 08:08','6000','2500','normal',33,'2022-12-16',51),
('Scandic','2022-01-13 10:10 ','2022-01-16 09:21','9850','3100','luxury',32,'2022-01-13',53),
('French Lick','2022-02-17 10:10 ','2022-02-20 09:26','8900','4600','normal',18,'2022-02-17',54),
('New Hangover','2022-05-20 10:10 ','2022-05-23 08:03','9500','3600','luxury',16,'2022-05-20',55),
('Step Back','2022-08-01 10:10 ','2022-08-03 07:00','7700','3650','normal',13,'2022-08-01',56),
('Amorous Feelings','2022-07-07 10:10 ','2022-07-09 06:45','9900','4300','normal',4,'2022-07-07',57);



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
ADD CONSTRAINT FK_TransportWayTransportMediums FOREIGN KEY (TransportWay) REFERENCES TransportWays(Id) 

SELECT * FROM TransportMediums  ORDER BY TransportWay;
DROP TABLE  TransportMediums;
TRUNCATE TABLE TransportMediums;
SELECT BusesId,FlightId,TrainId,Id FROM TransportWays ORDER BY Id
SELECT PersonId,Id FROM Buses ORDER BY PersonId
SELECT PersonId,Id FROM Flights ORDER BY PersonId
SELECT PersonId,Id FROM Trains ORDER BY PersonId
UPDATE TransportMediums SET TransportWay = 2 WHERE Id = 1
UPDATE TransportMediums SET TransportWay = 42 WHERE Id = 27
UPDATE TransportMediums SET TransportWay = 43 WHERE Id = 13
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(23,'ahmedabad','2022-10-06', '2022-10-12','mysore', 1200,8)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(16,'rajkot','2022-10-01', '2022-10-02','delhi',1400 ,13)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(17,'bhopal','2022-12-20', '2022-12-22','srinagar', 1500,11)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(9,'mumbai','2022-11-24', '2022-11-26','pune',2800 ,8)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(8,'banglore','2022-10-23', '2022-10-30','agra',3000 ,13)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(6,'chennai','2022-09-24', '2022-09-26','delhi',3400 ,5)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(5,'hyderabad','2022-08-10', '2022-08-12','kolkata',1600 ,8)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(7,'delhi','2022-07-09', '2022-07-10','lucknow',1500 ,11)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(4,'kolkata','2022-06-10', '2022-06-12','chennai',1900 ,3)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(11,'jaipur','2022-05-03', '2022-05-05','mumbai',2000 ,6)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(12,'udaipur','2022-06-04', '2022-06-07','bhopal', 2500,15)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(13,'agra','2022-07-05', '2022-07-07','udaipur',2800 ,7)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(14,'aurangabad','2022-08-06', '2022-08-08','rajkot',2900 ,4)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(15,'varanasi','2022-09-07', '2022-09-09','ahmedabad',4000 ,4)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(18,'indore','2022-10-08', '2022-10-10','vadodara',5000 ,18)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(19,'panipat','2022-11-09','2022-11-11','surat',6000,20)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(20,'vadodara','2022-12-10', '2022-12-12','nasik',1750 ,19)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(2,'surat','2022-01-11', '2022-01-13','aurangabad', 1850,7)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(22,'pune','2022-02-12', '2022-02-14','hyderabad',2590 ,18)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(25,'mysore','2022-03-13', '2022-03-15','varanasi',3950 ,3)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(1,'lucknow','2022-04-21', '2022-04-22','Rishikesh', 2400,1)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(3,'Manali','2022-05-08', '2022-05-10','Amritsar', 1990,9)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(10,'Ooty','2022-06-09', '2022-06-10','Alleppey', 1670,10)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(17,'Lonavala and Khandala','2022-07-10', '2022-07-11','Delhi',2200 ,12)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(21,'Shillong','2022-08-11', '2022-08-13','Chennai', 1990,14)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(24,'Mumbai','2022-09-12', '2022-09-14','Shimla',1890 ,16)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(42,'Amritsar','2022-10-13', '2022-10-15','Chennai',1670 ,4)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(51,'Goa','2022-11-14', '2022-11-16','Mumbai', 1850,22)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(56,'Alleppey','2022-12-15', '2022-12-17','Chennai',1200 ,21)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(25,'Tsuglagkhang complex','2022-01-16', '2022-01-18','Delhi',2000 ,23)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(41,'Andaman Islands','2022-02-17', '2022-02-19','Delhi',1900 ,23)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(53,'Rishikesh','2022-03-18', '2022-03-20','Surat', 1860,24)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(46,'Ahmedabad','2022-02-01', '2022-02-03','Srinagar', 2700,25)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(18,'Agra','2022-08-12','2022-08-13','Amritsar',2900,41)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(43,'Kolkata','2022-04-19','2022-04-22','Chennai',1450,30)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(43,'Kolkata','2022-04-19','2022-04-22','Chennai',1450,30)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(49,'Sikkim','2022-05-02', '2022-05-04','Mumbai', 1360,32)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(57,'Shimla','2022-06-21', '2022-06-23','Delhi',2400 ,29)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(44,'Indore','2022-07-22', '2022-07-25','Bhopal', 1000,31)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(25,'Ladakh','2022-08-23', '2022-08-25','Delhi', 3000,28)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(25,'Payyanur','2022-09-24', '2022-09-26','Mumbai',3500 ,34)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(50,'Banaras','2022-10-25', '2022-10-27','Indore', 2100,27)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(43,'Bihar','2022-11-26', '2022-11-27','Lucknow', 1000,33)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(48,'Kutch','2022-12-27', '2022-12-29','Surat', 900,26)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(47,'Coonoor','2022-01-28', '2022-01-30','Payyanur', 1640,35)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(42,'Jaipur','2022-03-02', '2022-03-03','Ahmedabad', 1500,36)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(45,'Leh','2022-04-03', '2022-04-04','Mumbai', 3900,37)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(54,'Delhi','2022-05-04','2022-05-05','Chennai',2800,38)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(55,'Mysore','2022-06-06','2022-06-08','Kodagu',1900,39)
INSERT INTO TransportMediums(PersonId, Source, StartDate, EndDate, Destination, Price, TransportWay) VALUES(29,'Srinagar','2022-07-23','2022-07-23','Amritsar',1300,40)
SELECT * FROM Registrations
SELECT * FROM TransportWays
SELECT Id,TransportWay FROM TransportMediums ORDER BY TransportWay
UPDATE TransportMediums SET PersonId = 52 WHERE Id = 41
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
SELECT Id FROM Buses ORDER BY Id
SELECT * FROM TransportWays ORDER BY FlightId;

DROP  TABLE TransportWays;
TRUNCATE TABLE TransportWays;

INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5001,1001,501)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5002,1002,502)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5003,1003,503)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5004,1004,504)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5005,1005,505)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5006,1006,506)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5007,1007,507)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5008,1008,508)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5009,1009,509)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5010,1010,510)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5011,1011,511)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5012,1012,512)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5013,1013,513)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5014,1014,514)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5015,1015,515)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5016,1016,516)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5017,1017,17 )
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5018,1018,518)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5019,1019,519)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5020,1020,520)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5021,1024,521)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5022,1027,522)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5023,1030,523)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5024,1031,524)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5025,1032,525)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5026,1033,526)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5027,1034,524)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5028,1035,525)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5029,1036,526)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5030,1037,527)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5031,1038,528)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5032,1039,529)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5033,1040,530)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5034,1041,531)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5035,1036,532)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5036,1012,533)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5037,1008,534)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5038,1006,535)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5039,1039,536)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5040,1028,537)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5041,1015,538)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5042,1009,539)
INSERT INTO TransportWays(BusesId, TrainId, FlightId) VALUES(5001,1001,540)

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

INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('ahmed','traveller','13000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('mehraj','swift','14000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('varun','suv500','15000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('soham','jazz','17000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('rehan','civic','18000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('rehana','carnival','19000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('karen','endevaour','20000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('karan','rapid','25000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('ramesh','tiago','21000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('suresh','creta','22000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('kamlesh','veneto','23000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('param','santro','24000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('praveen','ecco','11000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('gautam','wagnor','9500')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('abdil','aulto','8000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('salman','swift','7000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('vishwa','baleno','6000')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('kapura','traveller','5500')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('silika','suv800','7500')
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES('shiva','ecco','12000')
---
INSERT INTO Guides (GuideName, GuideCar, Price) VALUES
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
('shiva','ecco','12000');
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
SELECT Id FROM Guides ORDER BY Id
SELECT GuidesId FROM VisitPlaces ORDER BY GuidesId;
DROP TABLE  VisitPlaces;
TRUNCATE TABLE  VisitPlaces;

INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(18,3,12000,9)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(40,1,13000,7)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(15,19,14000,18)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(3,4,15000,5)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(19,2,16000,NULL)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(10,5,17000,17)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(6,6,18000,16)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(16,8,19000,20)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(30,9,20000,21)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(1,17,21000,23)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(12,11,22000,15)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(23,12,23000,23)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(14,13,24000,24)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(20,16,25000,25)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(25,18,26000,10)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(36,15,27000,17)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(27,10,28000,23)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(38,7,29000,21)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(35,20,30000,9)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(37,14,11000,6)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(28,3,12000,9)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(32,1,13000,7)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(4,19,14000,18)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(34,4,15000,5)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(17,2,16000,NULL)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(5,5,17000,17)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(24,6,18000,16)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(13,8,19000,20)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(39,9,20000,21)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(31,17,21000,23)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(21,11,22000,15)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(8,12,23000,23)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(4,13,24000,24)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(2,16,25000,25)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(26,18,26000,10)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(29,15,27000,17)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(33,10,28000,23)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(11,7,29000,21)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(23,20,30000,9)
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES(9,14,11000,6)
---
INSERT INTO VisitPlaces(PlacesId, GuidesId, Price, PersonId) VALUES
(7,14,11000,1)
(22,14,11000,2)
(1,14,11000,3)
(2,14,11000,4)
(3,14,11000,8)
(4,14,11000,11)
(15,14,11000,12)
(5,14,11000,13)
(25,14,11000,14)
(35,14,11000,19)
(8,14,11000,22)
(28,14,11000,41)
(18,14,11000,42)
(38,14,11000,43)
(3,14,11000,44)
(13,14,11000,45)
(23,14,11000,46)
(33,14,11000,47)
(9,14,11000,48)
(19,14,11000,49)
(29,14,11000,50)
(39,14,11000,51)
(1,14,11000,52)
(11,14,11000,53)
(21,14,11000,54)
(31,14,11000,55)
(10,14,11000,56)
(20,14,11000,57)
		   
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
SELECT * FROM Registrations
DROP TABLE VehicleLocations;
TRUNCATE TABLE VehicleLocations;

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('ahmedabad','abdul',40000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('rajkot','rehan',50000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('vadodara','indian',1000000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('surat','rang',1000000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('bhopal','abdil',200000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('indore','indory',90000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('jaipur','jay',60000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('udaipur','uma',1000000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('mumbai','khodiyar',100000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('chennai','bhavani',2000000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('kolkata','mohammad',90000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('delhi','venkateshwar',1000000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('jodhpur','gulab',55000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('chennai','durga',1000000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('banglore','tool-tip',50000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('pune','mac-can-make-it',500000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('nasik','shoopify',250000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('panipat','shanky',200000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('mysore','shawn',100000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('hyderabad','hydear',80000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Ooty','huzefa',12000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('leh','ahmed',8000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('srinagar','mehraj',11000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('gangtok','sudha',15000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('agra','zainab',18000);

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Munar','Lata',16000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Thekary','Riddhi',17000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Ooty','Rezvan',25000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Nubra','Rushabh',15500),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Coonoor','Pinal',19000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Kutch','Pushpa',30000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Goa','Preety',13000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Alleppey','Vishwanath',12000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Rishikesh','Venny',11000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Lonavala and Khandala','Liza',16000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Manali','Mona',14000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Kodagu','Arpan',17000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Andaman Islands','Venkat',18000),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Amritsar','Vishu',18500),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Varanasi ','Vikas',19500),

INSERT INTO VehicleLocations(Location, ShopName, Price) VALUES('Sikkim','Vishwas',20500)
---------------------------------------------------------------------------

---------------------------- UserDashboards --------------------------------

CREATE TABLE UserDashboards
(
Id INT PRIMARY KEY IDENTITY(1,1),
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

ALTER TABLE UserDashboards
ADD CardId INT

ALTER TABLE UserDashboards
ADD CONSTRAINT FK_CardIdUserDashboards FOREIGN KEY(CardId) REFERENCES CardDetails(Id)

SELECT * FROM Registrations;
SELECT VisitedPlaces FROM UserDashboards ORDER BY VisitedPlaces 
SELECT * FROM VisitPlaces;
DROP TABLE UserDashboards;
TRUNCATE TABLE UserDashboards;

INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(18,'offline',100 ,1,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(5,'online',150,2,5)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(6,'offline',200 ,3,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(9,'online',50,4,9)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(7,'offline',250,5,NULL) 
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(10,'online',300,6,10)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(8,'offline',480,7,NULL) 
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(11,'online',550,8,11)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(13,'online',900,35,13)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(21,'offline',999,38,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(18,'online',425,37,17)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(6,'online',555,39,6)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(20,'offline',1900,36,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(9,'online',875,2,9)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(17,'offline',800,6,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(19,'online',700,14,19)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(20,'offline',1500,15,NULL)  
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(15,'online',2000,16,15)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(23,'offline',640,15,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(5,'online',990,20,5)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(12,'online',280,32,12)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(1,'online',630,10,1)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(22,'offline',2000,9,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(8,'online',160,12,8)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(25,'online',500,20,18)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(7,'online',260,40,7)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(11,'online',190,37,11)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(15,'offline',700,40,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(3,'offline',100,34,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(14,'online',160,19,14)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(19,'offline',165,23,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(16,'online',50,33,16)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(24,'offline',150,5,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(10,'online',60,15,10)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(2,'offline',800,10,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(4,'online',2000,20,4)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(12,'offline',1000,9,NULL)  
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(13,'online',400,10,13)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(14,'offline',900,11,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(16,'online',800,12,16)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(17,'offline',750,13,NULL) 
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(21,'offline',150,17,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(23,'online',2000,18,19)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(24,'offline',140,19,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(41,'offline',165,21,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(48,'online',135,22,22)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(55,'offline',120,24,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(46,'online',198,25,29)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(44,'offline',162,26,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(51,'online',1000,27,28)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(43,'offline',900,28,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(56,'online',1500,29,27)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(51,'offline',1690,30,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(52,'online',1754,31,26)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(51,'offline',1952,1,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(42,'online',1998,2,30)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(53,'offline',2000,10,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(49,'online',2022,11,25)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(52,'offline',1999,15,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(57,'online',638,26,24)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(50,'offline',268,14,NULL)
INSERT INTO UserDashboards(PersonId, PaymentType, Wallet,VisitedPlaces,CardId) VALUES(54,'online',459,19,23)

---------------------------------------------------------------------------------------
---------------------------------- CardDetails ------------------------------------------
CREATE TABLE CardDetails
(
Id INT PRIMARY KEY IDENTITY,
CardNumber  VARCHAR(20) UNIQUE,
CardType VARCHAR(20),
ExpirationDate VARCHAR(20),
CreatedBY UNIQUEIDENTIFIER DEFAULT(NEWID()),
CreatedDate DATETIME DEFAULT (GETDATE()),
ModifiedBy UNIQUEIDENTIFIER DEFAULT (NEWID()),
ModifiedDate DATETIME DEFAULT (GETDATE())
)
--DROP TABLE CardDetails
--TRUNCATE TABLE CardDetails
ALTER TABLE CardDetails
ADD PersonId INT

--ALTER TABLE CardDetails
--DROP COLUMN CardId

ALTER TABLE CardDetails
ADD CONSTRAINT PK_PersonIdCardDetails FOREIGN KEY (PersonId) REFERENCES Registrations(Id)
SELECT * FROM UserDashboards ORDER BY PaymentType
SELECT * FROM CardDetails
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(374245455400126,'debit card','05/2023',1)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(378282246310005,'credit card','04/2023',2)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(569852154875125,'debit card','12/2023',3)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(985471259632584,'credit card','09/2024',4)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(124563584125968,'debit card','03/2026',5)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(512487596863259,'debit card','06/2029',6)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(326589412586951,'credit card','08/2026',7)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(302584019658745,'debit card','05/2025',8)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(103954874251325,'debit card','06/2024',9)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(236985401258745,'debit card','03/2027',10)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(402333651258945,'debit card','03/2025',11)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(158236987451269,'credit card','04/2023',12)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(145236987012589,'credit card','05/2024',13)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(695874125632015,'credit card','07/2028',14)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(202145887451169,'credit card','01/2026',15)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(302158478569325,'credit card','03/2026',16)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(784521596845215,'credit card','02/2025',18)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(985461253665874,'credit card','07/2023',25)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(758412584125986,'debit card','06/2024',23)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(8054126023850216,'credit card','08/2028',48)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(3698547512012300,'debit card','12/2027',54)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(5002611258452103,'credit card','11/2023',57)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(1290258014723695,'debit card','10/2024',49)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(5206204103293275,'credit card','06/2025',52)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(1020305236489756,'debit card','03/2026',56)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(0236541258796325,'credit card','02/2029',51)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(0215478965412356,'debit card','10/2028',46)
INSERT INTO CardDetails(CardNumber,CardType,ExpirationDate,PersonId)VALUES(3650014521036985,'credit card','06/2025',42)

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
SELECT Id FROM Registrations ORDER BY Id;
SELECT PersonId FROM Trains ORDER BY PersonId;
DROP TABLE Trains;
TRUNCATE TABLE Trains;
SELECT * FROM Trains
SELECT Id FROM Registrations ORDER BY Id
UPDATE Trains SET TrainName = 'rajdhani' WHERE Id = 1012

INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-01-10','10:11','2022-01-12','11:00','lent',1,'ec','600',1,0)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-02-11','11:45','2022-02-12','12:15','golden',2,'3ac','2500' ,5,2)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-03-12','12:56','2022-03-14','01:15','local',12,'ec','20000',15,3)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-04-13','01:15','2022-04-15','02:45','silver',15,'cc','15000',12,4)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-05-14','02:45','2022-05-16','03:12','proma',11,'3ac','17000',15,5)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-06-15','03:45','2022-06-17','04:15','platinum',4,'cc','25000',30,6)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-07-16','04:05','2022-07-18','05:15','express',6,'3ac','26000',24,7)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-08-17','05:15','2022-08-19','06:45','painte',5,'ec','7000',6,1)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-09-18','06:35','2022-09-20','07:20','fares',7,'3ac','8000',5,2)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-10-19','07:18','2022-10-21','08:25','flow',10,'cc','800',1,0)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-11-20','08:35','2022-11-23','09:15','gurjarnagri',9,'sl','1200',2,0)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-12-21','09:15','2022-12-22','05:45','raghdhani',14,'sl', '1800',2,0)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-03-22','10:10','2022-03-25','06:50','pattern',19,'cc','1800',2,0)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-04-23','11:45','2022-04-25','07:10','track',17,'3ac','2500',2,1)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-05-24','12:32','2022-05-26','08:36','canne',20,'cc','8000',8,2)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-06-10','10:15','2022-06-12','09:10','core',16,'ec','10000',15,3)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-07-09','11:15','2022-07-11','10:10','tainn',18,'sl','10000',10,4)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-08-08','12:15','2022-08-10','11:12','cannopi',23,'cc','8000',5,3)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-09-07','13:45','2022-09-09','12:36','loape',24,'3ac','9000',6,2)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-10-06','10:50','2022-10-08','01:45','laser',25,'ec','9000',4,1)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-09-22','01:32','2022-09-26','11:45','beas',3,'sl','8000',6,1)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-08-23','02:09','2022-08-25','10:53','Ahimsa',55,'ec','11000',5,0)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-06-06','04:15','2022-06-09','02:10','quuen',13,'sl','9000',5,1)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-10-08','05:16','2022-10-12','03:26','lent',22,'3ac','12000',4,0)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-05-11','06:20','2022-05-14','04:42','Ahilyanagari',42,'sl','3000',2,1)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-04-15','07:25','2022-04-17','06:21','Amaravati',50,'cc','900',1,0)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-03-19','08:42','2022-03-21','10:08','kranti',8,'3ac','9000',5,1)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-10-20','09:10','2022-10-24','09:17','bagmati',53,'sl','30000',9,2)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-02-20','10:18','2022-02-23','08:23','chambal',21,'ec','26000',8,3)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-01-28','11:11','2022-01-31','05:43','cheran',41,'cc','27500',10,3)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-12-30','12:53','2022-01-02','12:56','dayodaya',52,'sl','2500',2,1)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-05-08','01:00','2022-05-11','11:00','ernad',43,'3ac','900',1,0)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-06-07','04:08','2022-06-10','10:15','falaknuma',48,'sl','1500',1,1)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-12-06','05:18','2022-12-09','08:16','godaan',54,'ec','8000',5,2)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-07-25','06:17','2022-07-28','07:20','hirakund',44,'sl','9000',2,3)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-11-24','07:46','2022-11-26','06:29','jhelum',43,'cc','11000',4,0)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-08-23','08:16','2022-08-25','05:30','kalinga',46,'3ac','25000',8,3)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-12-22','09:21','2022-12-25','04:35','kamrup',47,'sl','15000',9,0)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-11-18','10:18','2022-11-21','03:45','koyna',51,'cc','4500',3,1)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-12-17','11:37','2022-12-20','02:26','loknayak',45,'ec','25600',9,1)
INSERT INTO Trains(DateIn, TimeIn, DateOut, TimeOut, TrainName,PersonId, Class, Price, Adult, Child) VALUES
('2022-01-15','12:45','2022-01-17','01:15','malgudi',49,'sl','3550',2,1)
						
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

SELECT PersonId FROM Flights ORDER BY PersonId;
DROP TABLE Flights;
TRUNCATE TABLE Flights;
SELECT * FROM Registrations ORDER BY Id
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-10-05','10:15','2022-10-10','10:45','precks',25,'economy','5000',2,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-11-08','12:00','2022-11-11','01:12','quar',1,'business','7000',2,1)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-10-07','01:05','2022-10-10','02:15','tram',13,'economy','8000',3,2)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-09-06','02:25','2022-09-08','12:45','oprate',14,'business','2000' ,1,1)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-08-05','03:45','2022-08-07','09:36','shom',12,'economy','2000' ,1,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-07-04','04:40','2022-07-06','08:46','prain',11,'business','2000' ,1,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-06-03','05:50','2022-06-05','07:15','bird',10,'economy','2000' ,1,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-05-02','06:30','2022-05-04','06:14','dudhsagar',9,'business','8000' ,2,1)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-04-01','07:00','2022-04-03','05:40','firfly',8,'economy','9000' ,2,2)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-03-20','08:15','2022-03-22','04:16','indigo',7,'business','8000' ,2,1)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-02-19','09:15','2022-02-21','03:50','vista',6,'economy','5000' ,2,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-01-18','07:50','2022-01-21','02:45','crab',5,'business','10000' ,3,1)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-02-17','03:45','2022-02-19','01:50','frog',2,'economy','12000' ,4,1)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-03-16','04:12','2022-03-17','12:12','meant',3,'business','12000',3,1)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-04-15','05:45','2022-04-16','01:45','froaa',20,'economy','8500' ,2,1)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-05-14','06:10','2022-05-16','12:36','leam',24,'business','6000' ,1,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-06-13','07:35','2022-06-14','11:20','kent',21,'economy','25000' ,6,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-07-12','08:10','2022-07-14','10:45','swime',22,'business','18000',4,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-08-11','09:12','2022-08-13','09:19','grome',23,'business','15000' ,3,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-09-10','07:45','2022-09-12','10:12','peme',4,'economy','6000' ,2,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-01-19','06:25','2022-01-23','12:11','Emirates ',17,'business','16580',5,2)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-02-18','05:26','2022-02-23','01:45','Lufthansa',43,'economy','21650',8,2)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-03-17','04:11','2022-03-22','05:10','Air ',55,'economy','21500',7,2)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-04-16','01:48','2022-04-19','06:29','Visatar',19,'business','23500',9,2)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-05-15','12:55','2022-05-19','11:22','Pumpkin',45,'economy','19500' ,10,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-06-14','11:45','2022-06-18','10:12','Crancky',48,'business','25000',15,2)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-07-13','10:35','2022-07-16','09:21','crupcrup',16,'economy','10000',6,1)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-08-12','12:25','2022-08-16','08:48','light',49,'economy','1000',1,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-08-12','12:25','2022-08-16','08:48','light',49,'economy','1500',1,1)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-09-11','11:15','2022-09-15','07:23','small',44,'business','3500',2,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-10-10','10:05','2022-10-15','06:28','heavy',50,'business','4500',2,1)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-11-09','09:01','2022-11-13','03:49','lopama',47,'business','5000',4,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-12-08','08:21','2022-12-11','04:29','smiss',54,'economy','7500',5,1)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-01-07','07:31','2022-01-11','08:25','wrenda',52,'business','18000',8,2)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-02-06','06:41','2022-02-10','09:17','okwa',15,'economy','9000',3,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-03-05','05:51','2022-03-07','11:36','alliance',46,'economy','11000',6,2)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-04-04','04:10','2022-04-07','12:19','trujet',42,'business','3000',3,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-05-03','03:20','2022-05-06','07:35','saudia',51,'business','1000',1,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-06-02','02:30','2022-06-05','09:48','araiba',41,'economy','10000',6,0)
INSERT INTO Flights(DateIn, TimeIn, DateOut, TimeOut, FlightName,PersonId, Class, Price, Adult, Child) VALUES
('2022-07-01','01:40','2022-07-05','10:45','verb',18,'business','8000',5,0)
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

SELECT * FROM Buses 
SELECT Id FROM Registrations ORDER BY Id
DROP TABLE Buses;
TRUNCATE TABLE Buses;
UPDATE Buses SET Price=1850.56 WHERE Id = 5001
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-10-23','10:10','2022-10-30','12:24','patel',8,'seating',1850 ,1,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-06-08','10:00','2022-06-11','12:15','samyak',4,'sleeper',2000 ,2,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-07-01','10:12','2022-07-03','12:25','patel',5,'sleeper', '1800',1,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-08-02','11:15','2022-08-04','01:15','fresh air',3,'sleeper', '1650',2,3)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-09-03','12:20','2022-09-05','02:45','greenery',10,'seating','2000' ,10,4)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-10-04','01:05','2022-10-06','03:15','carrat',12,'seating','2500' ,6,2)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-11-05','02:25','2022-11-07','04:15','lion',13,'seating', '3000',1,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-12-06','03:45','2022-12-08','05:18','cheetha',14,'sleeper','8000' ,9,3)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-03-07','04:15','2022-03-09','06:20','elephant',16,'seating','6000 ',4,1)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-04-08','05:20','2022-04-10','07:20','karan',1,'seating', '6000',2,1)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-05-09','06:25','2022-05-11','08:20','avacado',17,'sleeper','3000 ',2,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-06-10','07:45','2022-06-12','09:15','pinepale',6,'seating','12000' ,14,5)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-07-11','08:50','2022-07-13','10:25','olaax',24,'seating', '8000',4,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-08-12','09:35','2022-08-14','11:25','orac',23,'seating','1200' ,1,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-09-13','10:35','2022-09-15','12:36','cranate',22,'sleeper','1000' ,1,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-10-14','11:10','2022-10-16','01:24','jeack',15,'seating','1000' ,1,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-11-15','12:45','2022-11-17','02:25','joals',21,'sleeper','1500' ,2,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-12-16','01:35','2022-12-18','03:36','leque',20,'seating','20000 ',12,5)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-01-17','02:15','2022-01-19','04:45','prain',18,'sleeper','10000' ,6,3)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-02-18','03:35','2022-02-20','05:45','kelae',19,'seating','8000' ,4,2)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-03-19','04:15','2022-03-21','06:56','neeta',2,'sleeper','2000' ,2,1)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-04-02','12:45','2022-04-04','05:45','Sunrise and Sunset',42,'seating','2500' ,5,1)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-05-06','01:00','2022-05-09','06:56','Globe Trotter',44,'seating','1000' ,2,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-06-22','02:33','2022-06-25','07:03','Tempting',55,'sleeper','1500' ,1,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-07-11','06:03','2022-07-14','08:50','Sunset',52,'seating','9000' ,8,3)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-08-03','06:29','2022-08-06','05:45','Stellar ',53,'sleeper','4000' ,5,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-09-23','05:40','2022-09-26','06:08','Star Business',50,'seating','15000' ,9,2)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-10-17','12:08','2022-10-19','08:10','Spring Bing',48,'sleeper','16000' ,10,1)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-11-14','01:12','2022-11-16','09:20','Speedy Getaways',46,'seating','20000' ,18,2)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-12-16','05:42','2022-12-19','10:25','Wilderness',41,'sleeper','25000' ,20,6)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-01-15','06:30','2022-01-18','11:45','Rustic Woods',45,'seating','27000' ,25,5)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-02-13','03:27','2022-02-15','12:30','Road Freedom',43,'sleeper','2500' ,3,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-05-10','11:45','2022-05-13','01:35','Element Lifestyle',49,'sleeper','10000' ,8,1)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-03-09','10:14','2022-03-12','02:45','Eastern Engage',46,'seating','11000' ,7,3)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-06-01','09:00','2022-06-05','03:48','Dreamland',51,'sleeper','12000' ,6,2)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-09-06','08:26','2022-09-09','04:55','Dream Casters',54,'sleeper','13000' ,4,1)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-08-02','07:28','2022-08-08','05:59','Destination Anywhere',47,'seating','8000' ,3,1)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-01-21','06:18','2022-01-26','06:30','Curated Calendar',7,'sleeper','13000' ,8,1)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-03-22','05:05','2022-03-25','07:36','Cruisers Seaside',11,'seating','500' ,1,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-02-26','04:00','2022-02-28','08:46','Creative Arts Travel',8,'sleeper','8000' ,5,2)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-01-30','03:35','2022-02-01','09:21','Central Tour Services',25,'seating','1300' ,3,0)
INSERT INTO Buses(DateIn, TimeIn, DateOut, TimeOut, BusesName, PersonId, Class, Price, Adult, Child) VALUES
('2022-09-12','02:25','2022-09-15','10:22','Angel Fly',9,'seating','6000' ,5,0)
										
---------------------------------------------------------------------------------------------------
										
SELECT * FROM Registrations;			
SELECT * FROM Hotels;					 
SELECT * FROM UserDashboards;			
SELECT * FROM Guides;
SELECT * FROM Places; 
SELECT * FROM VisitPlaces;
SELECT * FROM VehicleLocations;
SELECT Distinct Source,Destination FROM TransportMediums;
SELECT * FROM RentVehicles ;
SELECT * FROM TransportWays;
SELECT * FROM Trains;
SELECT * FROM Flights;
SELECT * FROM Buses;
SELECT * FROM CardDetails

--------------------------------------------------------------------------------------------------------

