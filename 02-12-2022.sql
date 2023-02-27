USE LiteTravels
select * from UserGet
	
OPEN cursor_userget CURSOR
FETCH NEXT FROM cursor_userget
    Into @EmpName

While @@FETCH_STATUS=0
    Begin
        Set @query= 'Update [DB]..[UserGet] Set [' + @EmpName + '] = ''NewValue'' Where [' + @EmpName + '] = ''OldValue'''
        Execute(@query)
        Fetch Next From cursor_userget Into @EmpName
        Set @Count = @Count + 1
    End

CLOSE cursor_userget;
DEALLOCATE cursor_userget;

DECLARE 
    @EmpName VARCHAR(MAX)

DECLARE cursor_userget CURSOR
FOR SELECT 
        EmpName
    FROM 
        UserGet;

OPEN cursor_userget;

FETCH NEXT FROM cursor_userget INTO @EmpName

WHILE @@FETCH_STATUS=0
    BEGIN
        SET @query= 'Update [DB]..[UserGet] Set [' + @EmpName + '] = ''NewValue'' Where [' + @EmpName + '] = ''OldValue'''
        EXECUTE(@query)
        Fetch NEXT FROM cursor_userget Into @EmpName
        SET @Count = @Count + 1
    END

CLOSE cursor_userget;

DEALLOCATE cursor_userget;

SELECT * FROM UserGet
CREATE OR ALTER PROCEDURE sp_update_get
 (
 @TableName nvarchar(50),
 @EmpName nvarchar(50), 
 @Id nvarchar(10),
 @Position nvarchar(50),
 @Location nvarchar(50),
 @Age INT,
 @Salary MONEY
 )
AS
BEGIN
DECLARE @Cmd nvarchar(150) = N'UPDATE ' + @TableName + ' SET 
EmpName = ''' + @EmpName  + ''', 
Position = ''' + @Position + ''',
Location = ''' + @Location  + ''',
Age = ''' + @Age  + ''' ,
Salary = ''' + @Salary  + ''' 
WHERE Id = ' + @Id + '';
EXECUTE sp_executesql @Cmd;

END

--DECLARE @Cmd nvarchar(150) = 
--N'UPDATE ' + @TableName + ' SET 
--	EmpName = @EmpName,
--        Position = @Position,
--		Location = @Location,
--		Age = @Age,
--		Salary = @Salary
--WHERE Id = @Id';
EXECUTE sp_executesql @Cmd,
        N'@EmpName nvarchar(50), @Position nvarchar(50), @Location nvarchar(50), @Age INT, @Salary MONEY ,@Id nvarchar(10)',
        @EmpName = @EmpName, @Position = @Position,@Location=@Location, @Age=@Age,@Salary=@Salary , @Id = @Id;
------------------------------------------------------
		ALTER PROCEDURE sp_update_get1
 @EmpName nvarchar(50), 
 @Id nvarchar(10),
 @Position nvarchar(50),
 @Location nvarchar(50),
 @Age INT,
 @Salary MONEY
AS 
   -- DECLARE @Id AS UNIQUEIDENTIFIER;

    IF NOT EXISTS (SELECT * FROM UserGet WHERE EmpName = @EmpName)
    BEGIN 
        SET @Id = NEWID()
 
        INSERT INTO UserGet (Id, EmpName,Position,Location,Age,Salary)
        VALUES (@Id, @EmpName,@Position,@Location,@Age,@Salary)
    END
    ELSE
    BEGIN
        SELECT @Id = Id 
        FROM UserGet
        WHERE Id = @Id
    END

    IF NOT EXISTS (SELECT * FROM UserInfo WHERE EmpName = @EmpName)
   BEGIN
   INSERT INTO UserInfo(Id, EmpName,Position,Location,Age,Salary)
   VALUES (@Id, @EmpName,@Position,@Location,@Age,@Salary)
   END


   CREATE TABLE UserInfo
(
Id INT PRIMARY KEY IDENTITY,
EmpName NVARCHAR(MAX),
Position VARCHAR(20),
Location VARCHAR(40),
Age INT,
Salary VARCHAR(20)
)

select * from UserInfo

select * from UserData


EXECUTE usp_InsertUpdateData Jenu,5,account,laldarvaja,20,120000

CREATE PROCEDURE usp_InsertUpdateData
(
 @EmpName nvarchar(50), 
 @Id nvarchar(10),
 @Position nvarchar(50),
 @Location nvarchar(50),
 @Age INT,
 @Salary MONEY
)
AS
BEGIN
    IF EXISTS (SELECT 5 FROM UserData
    WHERE Id=@Id
	)
    BEGIN
        UPDATE UserData SET 
	       EmpName = @EmpName,
	       Position = @Position,
	       Location = @Location,
               Age = @Age,
			   Salary =@Salary
	       WHERE Id = @Id
	PRINT 'Customer Data Updated'
    END
ELSE
    BEGIN
        INSERT INTO UserInfo VALUES (@EmpName, @Position, @Location, @Age, @Salary)
	PRINT 'New Customer Data Inserted'
    END
END


create or alter procedure  sp_get2     
 @EmpName nvarchar(50) = null, 
 @Id nvarchar(10)= null,
 @Position nvarchar(50)= null,
 @Location nvarchar(50)= null,
 @Age INT= null,
 @Salary MONEY = null

as         
 declare @sql nvarchar(max)  

set @sql = N'select * from UserGet where 1 = 1'  
if(@Id='CHK')      
begin   


if len(isnull(@EmpName, '')) > 0  
 set   @sql = @sql + N'and limit=@limit'+ cast(@EmpName as nvarchar(100))  

if len(isnull(@Position, '')) > 0  
  set  @sql = @sql + N'and chargerate=@chargerate'+ cast(@Position as nvarchar(100))  

if len(isnull(@Location, '')) > 0  
 set   @sql = @sql + N'and ChgType=@ChgType'+ cast(@Location as nvarchar(100))  

if len(isnull(@Age, '')) > 0  
  set  @sql = @sql + N'and IsActive=@IsActive'+ cast(@Age as nvarchar(100))  

    if len(isnull(@Salary, '')) > 0  
 set   @sql = @sql + N'and statecode=@statecode'+ cast(@Salary as nvarchar(100))  



exec (@sql)  
end  

if (@Id='ALL')      
begin    
 select * from UserGet   
end

create or alter procedure  Proc_CheckExchange     
 @EmpName nvarchar(50) = null, 
 @Id nvarchar(10)= null,
 @Position nvarchar(50)= null,
 @Location nvarchar(50)= null,
 @Age INT= null,
 @Salary MONEY = null 


as         
 declare @sql nvarchar(max)  

set @sql = N'select * from UserGet where 1 = 1'  
if(@Id='CHK')      
begin   

  if len(isnull(@EmpName, '')) > 0
    set @sql = @sql + N' and EmpName = @EmpName'

   if len(isnull(@Position, '')) > 0
    set @sql = @sql + N' and EmpName = @Position'

    if len(isnull(@Location, '')) > 0
    set @sql = @sql + N' and Location = @Location'

    if len(isnull(@Age, '')) > 0
    set @sql = @sql + N' and Age = @Age'

    if len(isnull(@Salary, '')) > 0
    set @sql = @sql + N' and Salary = @Salary'

 declare @params as nvarchar(max) = N'@Id varchar(3), 
 @EmpName nvarchar(50) , 
 @Id nvarchar(10),
 @Position nvarchar(50),
 @Location nvarchar(50),
 @Age INT,
 @Salary MONEY 
print @sql
--EXECUTE sp_executesql @sql, @params,@EmpName,@Id,@Position,@Location,@Age,@Salary'
    end




	CREATE OR ALTER PROC sp_get3
 (		 @Action varchar(50),
		 @EmpName nvarchar(50), 
		 @Id nvarchar(10),
		 @Position nvarchar(50),
		 @Location nvarchar(50),
		 @Age INT,
		 @Salary MONEY
 )
 AS
 
 SET XACT_ABORT ON
 
 BEGIN TRY
 BEGIN TRANSACTION
  IF @Action='Update'
  BEGIN
     UPDATE UserGet SET EmpName=@EmpName,Position=@Position,Location=@Location,Age=@Age,Salary=@Salary
     WHERE Id=@Id   

	    UPDATE UserInfo SET EmpName=@EmpName,Position=@Position,Location=@Location,Age=@Age,Salary=@Salary
     WHERE Id=@Id  

     GOTO COMMITLabel
  END
  
  IF @Action='Insert'
  BEGIN
    INSERT INTO UserGet VALUES(@EmpName,@Position,@Location,@Age,@Salary)
    SELECT @Id=SCOPE_IDENTITY()
  
    INSERT INTO UserInfo VALUES(@EmpName,@Position,@Location,@Age,@Salary)
    SELECT Id=@Id
    GOTO COMMITLabel
  END

 IF @Action='Select'
  SELECT UserGet FROM UserInfo WHERE Id=@Id

 COMMITLabel:
 COMMIT TRANSACTION
 END TRY
BEGIN CATCH

--Check for Xact_state here if needed
 ROLLBACK
--Place proper error handling here

END CATCH


---------------------------------------------

CREATE TABLE [MyTestTable]
(
    [ID] [int],
    [Timestamp] [smalldatetime]
) ON [PRIMARY]
GO
SELECT * FROM MyTestTable

CREATE FUNCTION fn_Userget1
     (
	 @StartTime smalldatetime,
      @EndTime smalldatetime,
      @RandomNumberOfSeconds int)
RETURNS smalldatetime
AS
BEGIN
    DECLARE @Timestamp SMALLDATETIME

    -- Find an existing Timestamp between @StartTime and @EndTime in the MyTestTable
    -- with less than 100 rows with that timestamp
    SET @Timestamp = (SELECT TOP 1 [Timestamp] 
                      FROM MyTestTable
                      WHERE [Timestamp] BETWEEN @StartTime AND @EndTime
                      GROUP BY [Timestamp]
                      HAVING COUNT(*) < 100)

    -- If no row found with timestamp between @StartTime and @EndTime
    -- or no timestamp found which has less than 100 rows with that timestamp
    -- Create a timestamp with a time somewhere between @StartTime and @EndTime
    if (@Timestamp is null)
    begin
        set @Timestamp = dateadd(ss, @RandomNumberOfSeconds, @StartTime)
    end

    return @Timestamp
END
GO

declare @Counter int
set @Counter = 0

-- Populate the test table with 300 rows, all initially with the same timestamp value
while @Counter < 300
begin
    insert MyTestTable (ID, [Timestamp]) values (@Counter, 'April 1, 2016')
    set @Counter = @Counter + 1
end

declare @StartTime smalldatetime
declare @EndTime smalldatetime
declare @RandomNumberOfSeconds float
set @RandomNumberOfSeconds = 60

set @StartTime = current_timestamp
set @EndTime = dateadd(minute, 30, @StartTime)

update MyTestTable
   set [Timestamp] = dbo.fn_MyTestFunction(@StartTime, @EndTime, @RandomNumberOfSeconds)

select [Timestamp], count(*) as "Count"
from MyTestTable
group by [Timestamp]
 

CREATE OR ALTER FUNCTION fn_Userget12
(@Id INT,
--@EmpName NVARCHAR(MAX),
@Position NVARCHAR(MAX),
@Age INT,
@Salary MONEY
)
RETURNS NVARCHAR(MAX)
AS
BEGIN

	DECLARE @EmpName NVARCHAR(MAX)

	SET @EmpName = (SELECT TOP 10 EmpName FROM UserGet
					WHERE EmpName BETWEEN @Salary AND @Position
					GROUP BY EmpName
					HAVING COUNT(*) < 10)

		IF(@EmpName IS NULL)
		BEGIN
			SET @EmpName = REPLACE(@Salary,@Position,'')
		END

		RETURN @EmpName
END

--DECLARE @counter1 int
--SET @Counter1 = 1
	

--WHILE @Counter1 < 10


	MERGE UserData AS ud
	USING UserSearch AS us
	ON (us.Id = ud.Id)
	WHEN MATCHED THEN
	UPDATE SET 
	ud.EmpName = us.EmpName,
	ud.Position = us.Position,
	ud.Location = us.Location ,
	ud.Age = us.Age ,
	ud.Salary = us.Salary

	WHEN NOT MATCHED BY TARGET 
    THEN INSERT (EmpName, Position,Location,Age,Salary)
         VALUES (us.EmpName,us.Position,us.Location,us.Age, us.Salary)
	WHEN NOT MATCHED BY SOURCE THEN
	DELETE; 
SELECT EmpName,Position,Age,Location,Salary,Id FROM UserGet 

DROP TABLE UserGet
SELECT * FROM UserInfo
SELECT * FROM UserGet
CREATE TABLE UserGet
(
Id INT PRIMARY KEY,
EmpName NVARCHAR(MAX),
Position NVARCHAR(MAX),
Location NVARCHAR(MAX),
Age INT,
Salary MONEY

)
SELECT * FROM Trains
INSERT INTO UserGet SELECT Id,EmpName,Position,Location,Age,Salary FROM UserSearch
CREATE OR ALTER FUNCTION fn_GetData(
@EmpName NVARCHAR(MAX),@Id INT,@Position NVARCHAR(MAX),@Location NVARCHAR(MAX),@Age INT)  
RETURNS @UserGet TABLE  
(
Id INT PRIMARY KEY,
EmpName NVARCHAR(MAX),
Position NVARCHAR(MAX),
Location NVARCHAR(MAX),
Age INT,
Salary MONEY
)  
AS  
BEGIN  
            --DECLARE @Avg DECIMAL(4,2)  
           		DECLARE @Salary MONEY       
            INSERT INTO @UserGet (Id,EmpName,Position,Location,Age,Salary)
			VALUES(@Id,@EmpName,@Position,@Location,@Age,@Salary)      
            SELECT @Salary=Salary FROM Trains WHERE EmpName=@EmpName  
			--SELECT @Avg=(Adult+Child)/2 FROM Trains WHERE Price=@Price  
      
            UPDATE @UserGet SET   
			Age=(SELECT Age FROM UserGet WHERE EmpName=@EmpName),  
            Location=(SELECT Location FROM UserGet WHERE EmpName=@EmpName) 
            --Average=@Avg  
            WHERE EmpName=@EmpName  
RETURN   
END  
DROP FUNCTION fn_GetData
SELECT * FROM fn_GetData('abhishek')

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
INSERT INTO DataUse VALUES('sumi', 'adeshra',12000,'SXT022 ,        SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('altaf','sheikh',13000,'SXT022 ,    SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('Jeni','shah',12500 , ',,,SXT022 ,SHN054 ,SBD106 ,       SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('hiren','parmar',13500,'SXT022 ,SHN054 ,SBD106 ,   SMT003 ,   STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('kushbu','goda',14000,'SXT022 ,SHN054 ,SBD106 ,SMT003 ,    STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('sugandha','gosh',10000,'SXT022 ,SHN054 ,SBD106 ,SMT003 ,    STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('kiran','roy',10500,'SXT022 ,   SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('pranav','mukherji',11000,'SXT022 ,SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('isha','soni',11750,',SXT022 ,SHN054 ,    SBD106 ,  SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('tirth','adeshra',12350,'SXT022 ,SHN054 ,   SBD106 ,SMT003 ,STP033 ,STP035 ,')
INSERT INTO DataUse VALUES('subham','chagg',16000,'SXT022 ,SHN054 ,   SBD106 ,    SMT003 ,STP033 ,STP035 .,')
INSERT INTO DataUse VALUES('srushti','patadia',15500,'SXT022 ,SHN054 ,   SBD106 ,SMT003 ,STP033 ,STP035 ,')
SELECT * FROM DataUse



SELECT REPLACE(LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(Position, ',', '><'), '<>', ''), '><', ''), ',', ' '))), ' ', ',') AS parts
FROM DataUse

DECLARE @parts VARCHAR(MAX) = 'SXT022 ,SHN054 ,   SBD106 ,SMT003 ,STP033 ,STP035 ,'
SET @Parts = LEFT(@Parts, LEN(@Parts)-1)
SELECT REPLACE(TRIM(',' from @Parts), ' ' ,'') 

CREATE OR ALTER FUNCTION fn_usedata
(@Position NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS

BEGIN
		SET @Position = LEFT(@Position,LEN(@Position) - 1)
		IF(SELECT REPLACE(TRIM(',' FROM @Position),' ','') FROM DataUse)
		BEGIN
		RETURN ()
		END
END

PRINT dbo.fn_usedata(1) 
UPDATE DataUse SET Position = dbo.fn_usedata(Position) 

UPDATE Table1 
SET Name = xyz(Name)

SELECT
    
    LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(Position,CHAR(32),'()'),')(',''),'()',CHAR(32)))) AS StringWithoutSpace
FROM DataUse



DECLARE @parts VARCHAR(MAX) = 'SXT022 ,SHN054 ,SBD106 ,SMT003 ,STP033 ,STP035 ,'
select REPLACE (@parts, ' ', '' )

select * from DataUse
SELECT
     Id
    ,Fname AS StringWithSpace
    ,LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(Position, CHAR(9), ''), CHAR(10), ''), CHAR(13), '')))AS StringWithoutSpace
FROM DataUse

CREATE FUNCTION RemoveAllSpaces
(
    @InputStr varchar(8000)
)
RETURNS varchar(8000)
AS
BEGIN
declare @ResultStr varchar(8000)
set @ResultStr = @InputStr
while charindex(' ', @ResultStr) > 0
    set @ResultStr = replace(@InputStr, ' ', '')

return @ResultStr
END

update DataUse
set Position = replace(Position, ' ', '')
where Position like '%  %'
SELECT * FROM DataUse

update DataUse
set Position =REPLACE(LTRIM(TRIM(REPLACE(Position, ',', ''))), '', ',')
--where Position like '%  %'
SELECT * FROM DataUse

SELECT
    REVERSE(
        STUFF(
            REVERSE(LTRIM(RTRIM(Position))), 
            1, 
            CASE WHEN SUBSTRING((REVERSE(LTRIM(RTRIM(Position)))), 1, 1) = ',' THEN 1 ELSE 0 END, 
            ''
        )
    )
FROM DataUse

select replace(Position, ' ', ',') FROM DataUse
SELECT trim(REPLACE(LTRIM(TRIM(REPLACE(Position, ',', ''))), '', ','),)FROM DataUse

SELECT  REVERSE(SUBSTRING(  REVERSE(Position),    PATINDEX('%[A-Za-z0-9]%',REVERSE(Position)),
    LEN(Position) - (PATINDEX('%[A-Za-z0-9]%',REVERSE(Position)) - 1)   ) )     
FROM  DataUse


Select
    CASE
        WHEN Position LIKE '%,'  THEN LEFT(Position, LEN(Position)-1)
        ELSE Position
    END
From DataUse


SELECT IIF( CHARINDEX( ',', Position, LEN( Position ) ) > 0
          , LEFT( Position, LEN( Position ) - 1 )
          , Position )
  FROM DataUse

  DECLARE @a varchar(15) = 'it,  manager,     accounting,, admin    ,'

;WITH cte AS (
    SELECT SUBSTRING(@a, 1, 1) AS Symbol, 1 AS Position
    UNION ALL
    SELECT SUBSTRING(@a, Position + 1, 1), Position + 1
    FROM cte
    WHERE Position < LEN(@a)
)
SELECT STUFF((
    SELECT CONCAT(N',',  Symbol)
    FROM cte
    ORDER BY Position
    FOR XML PATH('')
), 1, 1, N'') AS Result
OPTION (MAXRECURSION 0)