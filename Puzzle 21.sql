--Puzzle 21
drop table if exists dbo.AlternateMaleFemale
CREATE TABLE dbo.AlternateMaleFemale
(
ID INT
,NAME VARCHAR(10)
,GENDER VARCHAR(1)
)
GO
 
--Insert data
INSERT INTO dbo.AlternateMaleFemale(ID,NAME,GENDER)
VALUES
(1,'Neeraj','M'),
(2,'Mayank','M'),
(3,'Pawan','M'),
(4,'Gopal','M'),
(5,'Sandeep','M'),
(6,'Isha','F'),
(7,'Sugandha','F'),
(8,'kritika','F')
 
--Verify Data
SELECT ID,NAME,GENDER FROM AlternateMaleFemale

--SOLUTION

;WITH CTE AS
(
    SELECT *, ROW_NUMBER() OVER (PARTITION BY GENDER ORDER BY ID) rnk FROM AlternateMaleFemale
)
SELECT ID, NAME, GENDER FROM CTE ORDER BY rnk,ID