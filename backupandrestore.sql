---BACKUP--------

BACKUP DATABASE [LikThow] 
TO  DISK = N'E:\SQL\LikThow.bak' WITH NOFORMAT, 
NOINIT,  
NAME = N'LikThow-Full Database Backup', 
SKIP, 
NOREWIND, 
NOUNLOAD,  
STATS = 10
GO
--------------------
---RESTORE---

USE [master]
RESTORE DATABASE [LiteTravels2 ] 
FROM  DISK = N'E:\SQL\LitTravels.bak' 
WITH  FILE = 3,  
MOVE N'LiteTravels' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LiteTravels2 .mdf',  
MOVE N'LiteTravels_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LiteTravels2 _log.ldf',  
NOUNLOAD,  STATS = 5

GO