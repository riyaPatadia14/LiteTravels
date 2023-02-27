
 CREATE TABLE Balance
(
Account_Id INT,
Account_Type VARCHAR(20),
Balance MONEY
)


CREATE TABLE CREDIT
(
AccountId INT,
AccountType VARCHAR(20),
CreditAmount MONEY
)

CREATE TABLE DEBIT
(
AccountId INT,
AccountType VARCHAR(20),
DebitAmount MONEY
)

SELECT * FROM Balance
SELECT * FROM CREDIT
SELECT * FROM DEBIT
---------------------------------------------------------
CREATE PROC Sp_AddPerson
@AccountId INT,
@AccountType VARCHAR(MAX),
@DepoAmount INT 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
				INSERT INTO Balance VALUES(@AccountId,@AccountType,@DepoAmount)
				INSERT INTO CREDIT VALUES(@AccountId,@AccountType,0)
				INSERT INTO DEBIT VALUES(@AccountId,@AccountType,@DepoAmount)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END

EXECUTE Sp_AddPerson  @AccountId=1002 ,@AccountType='Saving' ,@DepoAmount=2000
---------------------------------------------------------
ALTER PROC Sp_CreditAmount
@AccountId INT,
@Amount INT 
AS
BEGIN
	DECLARE @BalanceAvailable INT
	SELECT @BalanceAvailable = Balance FROM Balance WHERE Account_Id = @AccountId
	IF(@BalanceAvailable < @Amount)
		BEGIN
			 Raiserror('invalid amount ',16,1)
		end
	ELSE
	BEGIN
				BEGIN TRY
					BEGIN TRANSACTION
							Update Balance SET Balance =(Balance - @Amount) WHERE Account_Id = @AccountId
							Update CREDIT SET CreditAmount =(CreditAmount + @Amount) WHERE AccountId = @AccountId
						
					COMMIT TRANSACTION
				END TRY
				BEGIN CATCH
					ROLLBACK TRANSACTION
					PRINT 'ERROR'
				END CATCH
	END

END

EXECUTE Sp_CreditAmount  @AccountId=1001 ,@Amount=6000

SELECT * FROM Balance
SELECT * FROM CREDIT
SELECT * FROM DEBIT


--------------------------------------
CREATE PROC Sp_DebitAmount
@AccountId INT,
@Amount INT 
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
				Update Balance SET Balance =(Balance + @Amount) WHERE Account_Id = @AccountId
				Update DEBIT SET DebitAmount =(DebitAmount + @Amount) WHERE AccountId = @AccountId
			
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END

EXECUTE Sp_DebitAmount  @AccountId=1003 ,@Amount=1000

SELECT * FROM Balance
SELECT * FROM CREDIT
SELECT * FROM DEBIT

---------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_ojas
@AccountId INT,
@AccountType VARCHAR(20),
@DepositAmount MONEY
AS
BEGIN
BEGIN TRANSACTION
	BEGIN TRY
	INSERT INTO Balance VALUES(@AccountId,@AccountType,@DepositAmount)
	INSERT INTO CREDIT VALUES(@AccountId,@AccountType,0)
	INSERT INTO DEBIT VALUES(@AccountId,@AccountType,@DepositAmount)
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		PRINT'ERROR'
	END CATCH
END

EXECUTE sp_ojas @AccountId = 1003,@AccountType ='current',@DepositAmount=  5500

SELECT * FROM Balance 
SELECT * FROM CREDIT
SELECT * FROM DEBIT

-----------------------------------------------------------------------
ALTER PROC Sp_ChequeAmount
@AccIdIn INT,
@AccIdOut INT,
@Amount INT 
AS
BEGIN
		DECLARE @Balance INT
		SELECT @Balance = Balance FROM Balance WHERE  Account_Id = @AccIdOut
		IF(@Balance < @Amount)
			BEGIN
				RAISERROR('invalid amount',16,1)
			END
		ELSE
			BEGIN
				BEGIN TRY
					BEGIN TRANSACTION
							Update Balance SET Balance =(Balance - @Amount) WHERE Account_Id = @AccIdOut
							Update Balance SET Balance =(Balance + @Amount) WHERE Account_Id = @AccIdIn
							UPDATE CREDIT SET CreditAmount = (CreditAmount + @Amount) WHERE AccountId = @AccIdOut
							UPDATE CREDIT SET CreditAmount = (CreditAmount + @Amount) WHERE AccountId = @AccIdIn
							UPDATE DEBIT SET DebitAmount = (DebitAmount + @Amount) WHERE AccountId = @AccIdOut
							UPDATE DEBIT SET DebitAmount = (DebitAmount + @Amount) WHERE AccountId = @AccIdIn
						
					COMMIT TRANSACTION
				END TRY
	  
				BEGIN CATCH
					ROLLBACK TRANSACTION
				END CATCH
			END
END
EXECUTE Sp_ChequeAmount @AccIdIn = 1001 ,@AccIdOut = 1002 ,@Amount = 3000
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

----------------------------
---------- cursor --------------------



CREATE TABLE #School
(
Id INT IDENTITY PRIMARY KEY, 
FacultyName VARCHAR(20),
SubjectName VARCHAR(20)
)

INSERT INTO #School VALUES
('sagar','science'),
('hiren','maths'),
('pooja','arts'),
('jagruti','computer'),
('kiran','music'),
('krupa','social science'),
('rachana','english'),
('jalpa','gujarati'),
('tarun','hindi'),
('alpesh','spots'),
('minakshi','economics'),
('yamini','statistics'),
('damini','sanskrit'),
('zalak','accounts'),
('mansi','physics'),
('nehal','biology'),
('nirali','history'),
('neha','biology')

CREATE TABLE #Info
(
Id INT,
SchoolId INT,
Price MONEY
)

DROP TABLE #Info
DROP TABLE #School
INSERT INTO #Info VALUES
(1,2,15000),
(2,4,16000),
(3,6,17000),
(4,8,18000),
(5,9,19000),
(6,10,20000),
(7,12,11000),
(8,14,12000),
(9,16,13000),
(10,18,14000),
(11,15,10000),
(12,13,11000),
(13,11,12000),
(14,9,13000),
(15,7,14000),
(16,5,15000),
(17,3,15000),
(18,1,16000)

SELECT * FROM #Info
-------------------------

CREATE PROCEDURE sp_School_1
AS
BEGIN
	DECLARE @SchoolId INT
	DECLARE @Name VARCHAR(20)

	DECLARE CURSOR_SCHOOL CURSOR FOR 
	SELECT SchoolId FROM #Info

	OPEN CURSOR_SCHOOL

	FETCH NEXT FROM CURSOR_SCHOOL INTO @SchoolId

	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		SELECT @Name = SubjectName FROM #School WHERE Id = @SchoolId

		IF(@Name = 'maths')
		BEGIN
			UPDATE #Info SET  Price = 15000 WHERE SchoolId = @SchoolId
		END
		ELSE IF(@Name = 'Science')
		BEGIN
		UPDATE #Info SET Price = 16000 WHERE SchoolId = @SchoolId
		END
		ELSE IF(@Name = 'english')
		BEGIN
		UPDATE #Info SET Price = 17000 WHERE SchoolId  =  @SchoolId
		END

		FETCH NEXT FROM CURSOR_SCHOOL INTO @SchoolId
	END
	CLOSE CURSOR_SCHOOL
	DEALLOCATE CURSOR_SCHOOL
END


EXECUTE sp_School_1

DECLARE 
    @HotelName VARCHAR(MAX), 
    @PriceWithFood  MONEY;

DECLARE cursor_hotels_1 CURSOR
FOR SELECT 
        HotelName, 
        PriceWithFood
    FROM 
        Hotels

OPEN cursor_hotels_1;

FETCH NEXT FROM cursor_hotels_1 INTO 
    @HotelName, 
    @PriceWithFood;

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @HotelName + CAST(@PriceWithFood AS varchar);
        FETCH NEXT FROM cursor_hotels_1 INTO 
            @HotelName, 
            @PriceWithFood;
    END;

CLOSE cursor_hotels_1;

DEALLOCATE cursor_hotels_1;

SELECT * FROM Hotels
UPDATE Hotels SET HotelName='nimbo' WHERE Id = 8 

-----------------------------

SET NOCOUNT ON
DECLARE @Id int
DECLARE @HotelName varchar(50)
DECLARE @PriceWithFood int
 DECLARE cursor_Hotels_2 CURSOR
STATIC FOR 
SELECT Id,HotelName,PriceWithFood from Hotels
OPEN cursor_Hotels_2
IF @@CURSOR_ROWS > 0
 BEGIN 
 FETCH NEXT FROM cursor_Hotels_2 INTO @Id,@HotelName,@PriceWithFood
 WHILE @@FETCH_STATUS = 0
 BEGIN
 PRINT 'Id : '+ CONVERT(VARCHAR(20),@Id)+', Name : '+@HotelName+ ', PriceWithFood : '+CONVERT(VARCHAR(20),@PriceWithFood)
 FETCH NEXT FROM cursor_Hotels_2 INTO @Id,@HotelName,@PriceWithFood
 END
END
CLOSE cursor_Hotels_2
DEALLOCATE cursor_Hotels_2
SET NOCOUNT OFF 
-------------------------------------------

DECLARE @VehicleType VARCHAR(20) 
DECLARE @Price MONEY
DECLARE @Date DATE
DECLARE cursor_RentVehicles_1 CURSOR
FOR SELECT VehicleType,Price,Date FROM RentVehicles	
OPEN cursor_RentVehicles_1
FETCH NEXT FROM cursor_RentVehicles_1 INTO 
@VehicleType,@Price,@Date
WHILE @@FETCH_STATUS = 0 
BEGIN
	PRINT @VehicleType + CAST(@Price AS VARCHAR(20))
	FETCH NEXT FROM cursor_RentVehicles_1 INTO
	@VehicleType,@Price,@Date
END
CLOSE cursor_RentVehicles_1
DEALLOCATE cursor_RentVehicles_1

-------------------------------------------------------------------------------

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
--------------------------

CREATE TABLE #Temp 
(Id INT PRIMARY KEY)


BEGIN TRY 

	INSERT INTO #Temp VALUES(1)
	INSERT INTO #Temp VALUES(1)

END TRY

BEGIN CATCH 

	PRINT 'In Catch block';
	THROW;

END CATCH;

------------------------------------
IF OBJECT_ID ( 'sp_GetError', 'P' ) IS NOT NULL   
    DROP PROCEDURE sp_GetError;  
GO  
  

CREATE OR ALTER PROCEDURE sp_GetError
AS

SELECT
	ERROR_NUMBER() AS e_number,
	ERROR_MESSAGE() AS e_message,
	ERROR_LINE() AS e_line,
	ERROR_SEVERITY() AS e_severity,
	ERROR_PROCEDURE() AS e_procedure;
GO
BEGIN TRY
	SELECT 1/0
END TRY
BEGIN CATCH
	EXECUTE sp_GetError
END CATCH
