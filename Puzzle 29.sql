--Puzzle 29
--Create Table
CREATE TABLE testMultipleValues
(
ID int
,Name varchar(100)
)
GO
 
--Insert Data
INSERT INTO testMultipleValues(ID,Name)
VALUES
(1,'a,b,c,d,e'),
(2,'a,b'),
(3,'c,d'),
(4,'e'),
(5,'f')
 
--Verify Data
SELECT ID, Name FROM testMultipleValues

--SOLUTION 
SELECT ID, TRIM(Value) as Name
FROM testMultipleValues
CROSS APPLY (
SELECT value FROM STRING_SPLIT(Name, ',')
) s

--SOLUTION FROM SITE 
SELECT ID,t.value('.', 'VARCHAR(10)') Value FROM
(   
    SELECT ID, CAST('<A>'+ REPLACE(Name,',','</A><A>')+ '</A>' AS XML) AS x FROM testMultipleValues
) O
CROSS APPLY x.nodes('/A')x(t)