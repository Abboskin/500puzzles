--Puzzle 23
--Create Table
 
CREATE TABLE Test2DistinctCount
(
a Int
,b Int
)
Go
 
--Insert Data
 
INSERT INTO Test2DistinctCount VALUES
(1,1) , (1,2) , (1,3) , (1,1)
 
--Verify Data
 
SELECT a,b FROM Test2DistinctCount

--SOLUTION 
SELECT DISTINCT A,  B FROM Test2DistinctCount

--SOLUTIONS FROM SITE
 
SELECT DISTINCT a,b FROM Test2DistinctCount 
 
 
SELECT a,b FROM Test2DistinctCount GROUP BY a,b
 
;WITH CTE AS
(
    SELECT * , ROW_NUMBER() OVER (PARTITION BY a,b ORDER BY %%Physloc%%) rnk FROM Test2DistinctCount
)
SELECT a,b FROM CTE WHERE rnk = 1