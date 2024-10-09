--Puzzle 28 
--CREATE TABLE
CREATE TABLE DeleteDup
(
ID INT
)
Go
 
--Insert Data
INSERT INTO DeleteDup VALUES(1),(2),(1)
 
--Verify Data
SELECT ID FROM DeleteDup

--Solution 
select distinct ID from DeleteDup

--SOLUTION FROM SITE 
 
WITH CTE AS
(
       SELECT *, ROW_NUMBER() OVER ( PARTITION BY ID ORDER BY ID ) RNK FROM DeleteDup    
)
DELETE FROM CTE WHERE RNK > 1