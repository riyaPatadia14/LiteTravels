USE LiteTravels

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


DECLARE @parts VARCHAR(MAX) = 'SXT022 ,SHN054 ,   SBD106 ,SMT003 ,STP033 ,STP035 ,'
SELECT REPLACE(TRIM(',' from @Parts), ' ' ,'') 

SELECT REPLACE(TRIM(',' from @Parts), ' ' ,'') 

-----------------------------
Declare @query varchar(8000) ;

Select @query = COALESCE(@query + ',', '') + ISNULL(CAST(Position as varchar(30)),'null') from DataUse

Select  @query ;