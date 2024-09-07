--Puzzle 12
--Create table
CREATE TABLE GroupbyMultipleColumns
(
ID INT
,Typ VARCHAR(1)
,Value1 VARCHAR(1)
,Value2 VARCHAR(1)
,Value3 VARCHAR(1)
)
GO
 
--Insert Data
INSERT INTO GroupbyMultipleColumns(ID,Typ,Value1,Value2,Value3)
VALUES
(1,'I','a','b',''),
(2,'O','a','d','f'),
(3,'I','d','b',''),
(4,'O','g','l',''),
(5,'I','z','g','a'),
(6,'I','z','g','a')
 
--Verify Data
SELECT ID,Typ,Value1,Value2,Value3 FROM GroupbyMultipleColumns

--Solution 1
select Typ, 
sum(case when Value1 = 'a' then 1 else 0 end +
case when Value2 = 'a' then 1 else 0 end +
case when Value3 = 'a' then 1 else 0 end) as Counts
from GroupbyMultipleColumns
group by Typ;

--Solution from site 

--
 
 
---------------------------------------
--Sol 1
---------------------------------------
 
SELECT
       Typ
       ,SUM(CASE Value1 WHEN 'a' THEN 1 ELSE 0 END) 
       +SUM(CASE Value2 WHEN 'a' THEN 1 ELSE 0 END)
       +SUM(CASE Value3 WHEN 'a' THEN 1 ELSE 0 END)
       Counts 
FROM GroupbyMultipleColumns
GROUP BY Typ
 
 
--

--Solution from GPT
SELECT Typ, 
       SUM(CASE WHEN Value1 LIKE 'a' THEN 1 ELSE 0 END +
           CASE WHEN Value2 LIKE 'a' THEN 1 ELSE 0 END +
           CASE WHEN Value3 LIKE 'a' THEN 1 ELSE 0 END) AS Counts
FROM GroupbyMultipleColumns
GROUP BY Typ;
