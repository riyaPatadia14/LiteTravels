
INSERT INTO DataUse VALUES
('sumi', 'adeshra',12000,'it, manager,   accounting,admin   ')
INSERT INTO DataUse VALUES('altaf','sheikh',13000,'it,  manager,     accounting,, admin    ,')
INSERT INTO DataUse VALUES('Jeni','shah',12500 , ' it, manager ,     accounting,,,admin')
INSERT INTO DataUse VALUES('hiren','parmar',13500,'it,  manager, hr     ,,acoounting,admin')
INSERT INTO DataUse VALUES('kushbu','goda',14000,'  it,,, hr,,  manager   ,accounting,admin,,')
INSERT INTO DataUse VALUES('sugandha','gosh',10000,',,it,hr,manager,,   accounting,admin,,,,,')
INSERT INTO DataUse VALUES('kiran','roy',10500,'   ,it, hr,   manager,    accounting,,, admin')
INSERT INTO DataUse VALUES('pranav','mukherji',11000,' admin, manager,accounting, admin ')
INSERT INTO DataUse VALUES('isha','soni',11750,'adm   in,  hr,,,  ,accc    ounting, i    t,')
INSERT INTO DataUse VALUES('tirth','adeshra',12350,'admin,accounting,hr ,,,,admin,,,')
INSERT INTO DataUse VALUES('subham','chagg',16000,'admin,hr,accounting,admin')
INSERT INTO DataUse VALUES('srushti','patadia',15500,'admin,manager,   accounting,, admin')


CREATE FUNCTION [dbo].[fn_MyTestFunction]
     (@Position NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
	SET SELECT 
	REPLACE(LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(Position, ',', '><'), '<>', ''), '><', ''), ',', ' '))), ' ', ',') AS parts
    -- Find an existing Timestamp between @StartTime and @EndTime in the MyTestTable
    -- with less than 100 rows with that timestamp
    SET @Position = LEFT(@Position,LEN(@Position) - 1)
	= (SELECT TOP 1 [Timestamp] 
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