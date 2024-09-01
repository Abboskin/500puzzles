CREATE TABLE [Movie]
(
 
[MName] [varchar] (10) NULL,
[AName] [varchar] (10) NULL,
[Roles] [varchar] (10) NULL
)
 
GO
 
--Insert data in the table
 
INSERT INTO Movie(MName,AName,Roles)
SELECT 'A','Amitabh','Actor'
UNION ALL
SELECT 'A','Vinod','Villan'
UNION ALL
SELECT 'B','Amitabh','Actor'
UNION ALL
SELECT 'B','Vinod','Actor'
UNION ALL
SELECT 'D','Amitabh','Actor'
UNION ALL
SELECT 'E','Vinod','Actor'
 

--Solution 1
select * from Movie where MName in
(select MName from Movie where Roles = 'Actor' and (AName = 'Amitabh' or AName = 'Vinod')
group by MName having count(MName)>1)


--Solution from site 
SELECT m1.* FROM Movie m1 INNER JOIN Movie m2 ON m1.MName = m2.MName
WHERE
( m1.AName ='amitabh' AND m2.AName ='vinod' OR m2.AName ='amitabh' AND m1.AName ='vinod')
AND(m1.Roles ='Actor')
AND(m2.Roles ='Actor')

