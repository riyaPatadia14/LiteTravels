SELECT * FROM RentVehicles
GO 4

USE LiteTravels

--DECLARE @Counter int = 0;

--Loop:
--SET @Counter = @Counter + 1
--IF @Counter < 10
--  PRINT @Counter
--ELSE GOTO Finish_Line

--LABEL : 'LAbeL 1'
--GO

--GOTO Loop

--Finish_Line:
--PRINT 'Finished!'


DECLARE @Counter int;  
SET @Counter = 1;  
WHILE @Counter < 10  
BEGIN   
    SELECT @Counter  
    SET @Counter = @Counter + 1  
    IF @Counter = 4 GOTO Label_One --Jumps to the first branch.  
    IF @Counter = 5 GOTO Branch_Two  --This will never execute.  
END  
Label_One:  
    SELECT 'Jumping To Label_One.'  
    GOTO Branch_Three; --This will prevent Branch_Two from executing.  
Branch_Two:  
    SELECT 'Jumping To Branch Two.'  
Branch_Three:  
    SELECT 'Jumping To Branch Three.'; 

--------------------------------------------------------------

DECLARE @count INT;
SET @count = 1;
WHILE @count < 10
BEGIN 

	SELECT @count
	SET @count = @count + 1
	IF @count = 4 GOTO Lab1
	IF @count = 5 GOTO Lab2
END
Lab1:
	SELECT 'Jump to Lab1.'
	GOTO Lab2;
Lab2:
	SELECT 'Jump to Lab2'
Lab3:
	SELECT 'Jump to Lab3';


DECLARE @test INT;
SET @test = 1;
GOTO tests

common:
PRINT 'common bit'

tests:
IF @test = 1 PRINT '1';
IF @test = 2 PRINT '2';
IF @test = 3 PRINT '3';

SET @test = @test + 1;
IF @test <= 3 GOTO common
PRINT 'finished ' + CAST(@test AS VARCHAR(5))
GO

DECLARE @value INT;
SET @value = 0;
WHILE @value <= 10
BEGIN

	IF @value = 0
	GOTO Riya;

	SET @value = @value + 1

END;

Riya:
	PRINT 'Riya Patadia'

GO
