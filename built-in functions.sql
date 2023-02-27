-------ASCII()
SELECT ASCII(Name) AS NAME
FROM Registrations
ORDER BY Name;

---------CHAR()
SELECT CHAR(81)AS CodeToCharacter;

---------CHARINDEX()
SELECT CHARINDEX('Tringno', 'TringnoForce') AS MatchPosition

---------------CONCAT()
SELECT CONCAT('SAMEER','ROSHNI', 'KARUNA','TRUPAL');

-------------------CONCAT WITH +
SELECT 'PARUL'+'KUMARI' + 'JAIVARDHAN';

SELECT CONCAT('SAMEEER',' , ','JIVA',' , ','LEENA') AS NAMEW
-----------CONCAT_WS
SELECT CONCAT_WS('KRUPASONI','@', 'MAIL','.','COM');

-----------DATALENGTH()
SELECT DATALENGTH('SUMITRABEN DARUVALA') AS NAME;

--------------DIFFERENCE
SELECT DIFFERENCE('TOMATO' ,'SOUP') AS TS;

/*
The DIFFERENCE() function compares two SOUNDEX values, and returns an integer. The integer value indicates the match for the two SOUNDEX values, from 0 to 4.

0 indicates weak or no similarity between the SOUNDEX values. 4 indicates strong similarity or identically SOUNDEX values.
*/

-----------------FORMAT

SELECT FORMAT(23101997, '##-##-####')	

DECLARE @d DATETIME = '12/01/2020';
SELECT 
FORMAT (@d, 'd', 'en-US') AS 'English',
FORMAT(@d, 'd','in') AS 'INDIA';

------------LEFT
SELECT LEFT('SUNDHARVAN ZOO ', 14) AS ExtraString;


-----------RIGHT
SELECT RIGHT('KAMAATI BAGH, VADODARA' , 24) AS ExtraString;


-----------LEN
SELECT LEN('TARUN SOJITARA') AS NAME;

-----------LOWER
SELECT LOWER('RIDDHI SIDDHI RAW HOUSE, 77/A, HAZUR NIVAS, AHMEDABAD')AS NAME;

-------UPER
SELECT UPPER('RIDDHIN SIDDHI RAW HOUSE 77/A, HAZUR NIVAS, AHEDABAD')AS NAME;

-----------LTRIM

SELECT LTRIM('                   SQL SERVER DATABASE USED FOR MICROSOFT');

----------NCHAR()
SELECT NCHAR(56) AS NumberCodeToCharacter

---------PATINDEX
/*

%pattern% 	Required. The pattern to find. It MUST be surrounded by %. Other wildcards can be used in pattern, such as:

			->	% - Match any string of any length (including 0 length)
			->	_ - Match one single character
			->	[] - Match any characters in the brackets, e.g. [xyz]
			->	[^] - Match any character not in the brackets, e.g. [^xyz]

The PATINDEX() function returns the position of a pattern in a string.

If the pattern is not found, this function returns 0.

Note: The search is case-insensitive and the first position in string is 1.

*/

SELECT PATINDEX('%dhinagar%','adhGandhinagar') AS CITY;
SELECT PATINDEX('%[a^dhi]%', 'Gadhinagar');



----------QUOTE

SELECT QUOTENAME('ABCDEF','><')

/*

string 	Required. A string of Unicode character data. Limited to 128 characters
quote_char 	Optional. A one-character string to use as the delimiter. 
Can be a single quotation mark ( ' ), a left or right bracket ( [] ), 
a double quotation mark ( " ), a left or right parenthesis ( () ), 
a greater than or less than sign ( >< ), 
a left or right brace ( {} ) or a backtick ( ` ). 
If quote_char is not specified, brackets are used. 

*/

---------REPLACE()

SELECT REPLACE('SHIVANI SHAH','A','M');

-----------REPLICATE()

SELECT REPLICATE(' TODAY IS YOUR DAY.', 8)

----------REVERSE

SELECT REVERSE('SUNDAY IS A SLEEPYING DAY')


-----------RTRIM

SELECT RTRIM('SUNDAY,MONDAY,TUESDAY')

----------SOUNDEX

SELECT SOUNDEX('LEMON'),SOUNDEX('JUICE')
/*
The SOUNDEX() function returns a four-character code to evaluate the similarity of two expressions.

Note: The SOUNDEX() converts the string to a four-character code based on how the string sounds when spoken.
*/
-----SPACE

SELECT SPACE(8)

-----STRING

SELECT STR(56)

-----STUFF

SELECT STUFF('SQL SERVER', 1,3,'HTML')	

----SUBSTRING

SELECT SUBSTRING('SQL SEVER TUTORIAL STAR @ GMAIL .COM FALTU', 1,50)

-----TRANSLATE

SELECT TRANSLATE('MONDAY','SUNDAY','MONDAY')
--------------
-- DATE FUNCTION
USE LiteTravels
SELECT CURRENT_TIMESTAMP AS current_date_time

DECLARE 
@local_time DATETIME,
@utc_time DATETIME;

SET @local_time = GETDATE();
SET @utc_time = GETUTCDATE();

SELECT
	CONVERT(VARCHAR(40),@local_time)
	AS 'Server local time';

SELECT 
	CONVERT(VARCHAR(40),@utc_time)
	AS 'Server UTC time'

SELECT 
	CONVERT(VARCHAR(40),DATEDIFF(hour, @utc_time, @local_time))
	AS 'Server time Zone'
GO

DECLARE
@opra DATETIME

SET @opra = GETDATE()

SELECT 
	CONVERT(VARCHAR(20),@opra)
	AS 'fff'


--------------------------

SELECT ASCII('A') AS [In ASCII Format]
--Result: '65'   (ASCII code of "A" is 65)
SELECT ASCII('a') AS [In ASCII Format]
--Result: '97'   (ASCII code of "A" is 65)

SELECT CHAR(65) AS [In char format]
--result: 'A' (ascii code of 'A')
SELECT CHAR(85) AS [IN CHAR FORMAT]
--RESULT: 'U' (ASCII CODE 'U' IS 85)
--------------------------------------------

SELECT CHARINDEX('CHAR', 'SQL Server CHARINDEX() function examples') AS MatchPosition;
--Result: 'A'   (We get 20 as the index point of "CHAR")
SELECT CHARINDEX('CHAR1', 'SQL Server CHARINDEX() function examples') AS MatchPosition;
--Result: 'A'   (We get 0 as the index point of "CHAR1", because it's not found in the above string)

---------------------------------------------

