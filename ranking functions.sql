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