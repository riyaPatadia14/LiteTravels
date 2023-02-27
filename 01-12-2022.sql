USE LiteTravels
---Riya
DECLARE @parts VARCHAR(MAX) = 'SXT022 ,SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,'
SELECT REPLACE(LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(@parts, ',', '><'), '<>', ''), '><', ''), ',', ' '))), ' ', ',') AS parts
-- Output SXT022,SHN054,SBD106,SMT003,STP033,STP035
--------------------------------------------------------------------------------------
---Hiren
DECLARE @parts3 VARCHAR(MAX) = 'SXT022 ,SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,'
SET @parts3=LEFT(@parts3,LEN(@parts3)-1)
SELECT RTRIM(REPLACE(LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(@parts3, ',', '><'), '<>', ''), '><', ''), ',', ' '))), ' ', ',')) AS ConvertedColumn	
PRINT @parts3
---------------------------------------------------------------------------------------
---Kailash
DECLARE @parts2 VARCHAR(MAX) = 'SXT022 ,SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,'
SET @parts2=LEFT(@parts2,LEN(@parts2)-1)
SELECT replace(RTRIM(@parts2),' ','')	
PRINT @parts2
----------------------------------------------------------------------------------------
--DECLARE @parts4 VARCHAR(MAX) = 'SXT022 ,SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,'

BEGIN 
   DECLARE  @parts4 VARCHAR(100);
   SET @parts4 = 'SXT022 ,SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,';
   SELECT REVERSE(SUBSTRING(REVERSE(SUBSTRING(@parts4, PATINDEX('%[^,]%', @parts4),99999)), PATINDEX('%[^,]%', REVERSE(SUBSTRING(@parts4, PATINDEX('%[^,]%', @parts4),99999))),99999));
END;
-----------------------------------------------
SELECT 
ISNULL(
    STUFF(
        CONCAT ( 
            ', ' + NULLIF(REPLACE(PlaceName, ',', ''), ''),
            ', ' + NULLIF(REPLACE(PlaceLocation, ',', ''), ''),
            ', ' + NULLIF(REPLACE(Id, ',', ''), '') 
        ) ,
        1,
        2,
        ''
    ),
    ''
) 
FROM Places
-------------------------------
SELECT 
       COALESCE(CONCAT_WS(', ',
                          NULLIF(PlaceName,''),
                          NULLIF(PlaceLocation,''),
                          NULLIF(Price,'')), '') AS Places,
      vp.GuidesId AS vp_guides

FROM VisitPlaces AS vp 
JOIN Places AS p ON vp.PlacesId = p.Id           
WHERE PlaceName LIKE PlaceName +'%' 
  AND Price >= 12000 
  AND PersonId IS NULL 
 ----------------------------------------------


----------------------------
CREATE FUNCTION [dbo].[tvf-Star] (@Input int)
Returns Table 
As
Return (  

Select Top (@Input) 
       Stars = replicate(' ',@Input-N)+replicate('*',N)
 From ( Select Top (@Input) N=Row_Number() Over (Order By (Select NULL)) From master..spt_values n1 ) A
 Order By N Desc
)

Select * from [dbo].[tvf-Star](5)

ALTER FUNCTION udf_pattern(@input INT)
RETURNS TABLE 
AS
RETURN
(
SELECT TOP (@input)
			i = REPLICATE(' ',@input + N)  + REPLICATE('@',N)
			FROM (SELECT TOP (@input) N=ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM master..spt_values n1) A
			ORDER BY N DESC
			)

SELECT * FROM dbo.udf_pattern(12)

--Generate a series from 1 to 100
SELECT
    TOP 100
    ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS RowNum
FROM master.dbo.spt_values ORDER BY RowNum

--------------------------------------------------

CREATE TABLE Change
(
col1 CHAR(1),
col2 CHAR(1), 
col3 CHAR(1),
col4 VARCHAR(50)
)
GO
TRUNCATE TABLE Change
INSERT INTO Change VALUES('A','G','H','4,5,8')

INSERT INTO Change VALUES('Q','W','R','7,3,1,0')

SELECT c.col1, RIGHT(LEFT(c.col4,Number - 1),
		CHARINDEX(',',REVERSE(LEFT(',' + c.col4, Number - 1))))
		FROM 
		master..spt_values,
		Change AS c
		WHERE 
		Type = 'P' AND Number BETWEEN 1 AND LEN(c.col4) + 1 AND
		(
		SUBSTRING(c.col4, Number,1) = ','
		OR
		SUBSTRING(c.col4, number,1) = '')

----------------------------------------------
select number from master..spt_values where type = 'P'

SELECT c.col1, RIGHT(LEFT(c.col4,Number-1),CHARINDEX(',',REVERSE(LEFT(','+c.col4,Number-1))))
FROM
    master..spt_values,
    Change c
WHERE
    Type = 'P' AND Number BETWEEN 1 AND LEN(c.col4)+1 AND
    (SUBSTRING(c.col4,Number,1) = ','
  OR SUBSTRING(c.col4,Number,1)  = '')

DECLARE @String NVARCHAR(1000) = 'SXT022 ,SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,';
SET @String=LEFT(@String,LEN(@String)-1)
SELECT * FROM STRING_SPLIT(@String,',');

----------------------------

DECLARE @t TABLE( id INT)
INSERT INTO @t
SELECT DISTINCT number FROM master..spt_values WHERE number BETWEEN 1 AND 10
SELECT * FROM @t 
-------------------

DECLARE @counter INT = 1

WHILE @counter  <= 10
BEGIN 

	SELECT TOP (@counter)
			i = REPLICATE(' ',@counter + N)  + REPLICATE('@',N)
			FROM (SELECT TOP (@counter) N=ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM master..spt_values n1) A
			ORDER BY N DESC
END

ALTER FUNCTION udf_pattern(@input INT)
RETURNS TABLE 
AS
RETURN
(
SELECT TOP (@input)
			i = REPLICATE(' ',@input + N)  + REPLICATE('@',N)
			FROM (SELECT TOP (@input) N=ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM master..spt_values n1) A
			ORDER BY N DESC
			)

SELECT * FROM dbo.udf_pattern(12)

----------------------------------------------

SELECT * INTO UserGet FROM UserData
SELECT * FROM UserGet
SELECT * FROM UserData

DECLARE @TableName varchar(200) 
DECLARE @EmpName nvarchar(max)
DECLARE @Age int
DECLARE @Position varchar(max)
DECLARE @Location nvarchar(max)
DECLARE @Salary money
DECLARE @Id int
UPDATE UserGet
   SET @TableName = CASE EmpName 
                      WHEN @EmpName THEN 'FDHJDF'
                      WHEN @Position THEN 'SDFJH'
					  WHEN @Location THEN 'FDHBH'
					  WHEN @Age THEN '55'
					  WHEN @Salary THEN '54555335'
                      ELSE @Id
                      END
 WHERE @Id IN(1,2,3,4,5);

 UPDATE UserGet
   SET EmpName = CASE EmpName 
                      WHEN 'abhishek' THEN 'akash'
                      WHEN '2' THEN 'kruti'
                      ELSE EmpName
                      END
 WHERE EmpName IN('abhishek', '2');
 SELECT * FROM UserGet
 ---------------------------------------------

 CREATE OR ALTER PROCEDURE sp_Updatemultiple
 (
 @Id INT,
 @EmpName VARCHAR(20), 
 @Position VARCHAR(20),
 @Location NVARCHAR(MAX),
 @Age INT,
 @Salary MONEY
 )
 AS
 BEGIN
	UPDATE UserGet SET
	@EmpName = EmpName, @Position = Position, @Age = Age, @Location = Location,@Salary = Salary
	WHERE Id= @Id
 END

 UPDATE UserGet SET EmpName = 'raj', Position = 'accounting' WHERE Id = 2
 AND EmpName = 'francy' WHERE Id = 4

 UPDATE UserGet 
SET EmpName = 'sajan'
  , EmpName = 'rohit' 
WHERE Position = 'accounting' 
  AND Age = '25';

  INSERT INTO UserGet (Id, EmpName, Position, Age,Location,Salary)
VALUES (1, 'sajan', 'b1', 'c1','2',56666),
(2, 'a2', 'b2', 'c2','2',566565),
(3, 'a3', 'b3', 'c3','2',8784545),
(4, 'a4', 'b4', 'c4','3',565657),
(5, 'a5', 'b5', 'c5','5',65667857),
(6, 'a6', 'b6', 'c6','5',75757454)
ON DUPLICATE KEY UPDATE Id=VALUES(Id),
EmpName=VALUES(EmpName),
Position=VALUES(Position),
Age=VALUES(Age)
Location=VALUES(Location)
Salary=VALUES(Salary);

UPDATE UserGet
 SET EmpName = (SELECT EmpName FROM UserGet WHERE Id = [Id]),
     Position = (SELECT Position FROM UserGet WHERE Id = [Id]),
     Age = (SELECT Age FROM UserGet WHERE Id = [Id]),
     Location = (SELECT Location FROM UserGet WHERE Id = [Id]),
	 Salary = (SELECT Salary FROM UserGet WHERE Id = [Id])
 WHERE Id IN ([Id])
  SELECT * FROM UserGet
INSERT INTO UserGet (Id, EmpName, Position,Location, Age,Salary)
    VALUES 
        (1,'SAJAN','IT','BOPAL',22,12000),
        (2,'ROHIT','ACCOUNTS','SG HIGHWAY',22,25000),
        (3,'ANIRUDH','HR','NARODA',22,22000)AS aliased
ON DUPLICATE KEY UPDATE Id=aliased.Id;

	INSERT INTO chart (id, flag) 
VALUES (1, 'FLAG_1'),(2, 'FLAG_2') AS aliased
ON DUPLICATE KEY UPDATE flag=aliased.flag;

INSERT INTO UserGet (Id, EmpName, Position,Location, Age,Salary) VALUES
 (1,'SAJAN','IT','BOPAL',22,12000),
 (2,'ROHIT','ACCOUNTS','SG HIGHWAY',22,25000),
 (3,'ANIRUDH','HR','NARODA',22,22000)

ON DUPLICATE KEY UPDATE  Id=values(Id),EmpName=values(EmpName),Position=values(Position),Location=values(Location),
Age=values(Age),Salary=values(Salary);