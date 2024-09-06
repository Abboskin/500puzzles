--Puzzle 7
CREATE TABLE List
(
ID INT
)
GO
 
INSERT INTO List(ID) VALUES (1),(2),(3),(4),(5)

--Solution 1 
select ID, 
       sum(ID) over (order by ID) as CamulativeSum
from list 

--Solution from site
--
---------------------------------------
--Sol 1 | Pawan Kumar Khowal
---------------------------------------
 
 
SELECT *, SUM(ID) OVER (ORDER BY %%Physloc%%) Sums 
FROM List
 
---------------------------------------
--Sol 2 | Pawan Kumar Khowal
---------------------------------------
 
 
;WITH CTE AS
(
    SELECT *, ROW_NUMBER() OVER (ORDER BY %%Physloc%%) rnk 
    FROM List
)
SELECT ID ,  SUM(ID) OVER (ORDER BY rnk) Sums FROM CTE
 
---------------------------------------
--Sol 3 | Pawan Kumar Khowal
---------------------------------------
 
 
;WITH CTE AS
(
    SELECT *, ROW_NUMBER() OVER (ORDER BY %%Physloc%%) rnk
    FROM List
)
SELECT ID , (SELECT SUM(ID) FROM CTE c2 WHERE c2.rnk <= c1.rnk) Sums
FROM CTE c1
 
 
--

