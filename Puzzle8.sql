--Puzzle 8
--Create table
CREATE TABLE TestMax
(
Year1 INT
,Max1 INT
,Max2 INT
,Max3 INT
)
GO
 
--Insert data
INSERT INTO TestMax 
VALUES
 (2001,10,101,87)
,(2002,103,19,88)
,(2003,21,23,89)
,(2004,27,28,91)
 
--Select data
Select Year1,Max1,Max2,Max3 FROM TestMax

--Solution 1
select year1,
	case 
	when Max1> Max2 and Max1>Max3 then Max1
	when Max2>Max1 and Max2>Max3 then Max2
	when Max3>Max1 and Max3>Max2 then Max3
	end as MaxValue
from TestMax

--Solutions from site

--
 
 
---------------------------------------
--Sol 1 | Pawan Kumar Khowal
---------------------------------------
 
SELECT Year1,
(
       SELECT Max(v)
       FROM (
              VALUES (max1) , (max2), (max3) 
       ) as value(v)
) as mmax
FROM TestMax
 
 
---------------------------------------
--Sol 2 | Pawan Kumar Khowal
---------------------------------------
 
SELECT Year1, MAX(maxy) maxyy
FROM
(
       SELECT Year1 , Max1 maxy FROM TestMax
       UNION ALL
       SELECT Year1 , Max2 FROM TestMax
       UNION ALl
       SELECT Year1 , Max3 FROM TestMax
) a GROUP BY YEAR1
 
---------------------------------------
--Sol 3 | Pawan Kumar Khowal
---------------------------------------
 
 
SELECT Year1,
       CASE WHEN Max1 > Max2 AND MAX1 > Max3 THEN MAX1
       WHEN Max2 > Max1 AND MAX2 > Max3 THEN MAX2
       WHEN Max3 > Max2 AND MAX3 > Max1 THEN MAX3
       END AS Maxx
FROM TestMax
 
 
--