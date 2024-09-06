--Puzzle 6
--Create table
 
CREATE TABLE NthHighest
(
 Name  varchar(5)  NOT NULL,
 Salary  int  NOT NULL
)
 
--Insert the values
INSERT INTO  NthHighest(Name, Salary)
VALUES
('e5', 45000),
('e3', 30000),
('e2', 49000),
('e4', 36600),
('e1', 58000)
 
--Check data
SELECT Name,Salary FROM NthHighest

--Solution 1
select * from NthHighest
order by Salary desc
offset 1 row
fetch next 1 row only

--Solution 2
select  max(Salary) 
from NthHighest
where Salary < (select max(Salary) from NthHighest)

--Solution 3
select Name, max(Salary)
from NthHighest
where Salary < (select max(Salary) from NthHighest)
group by Name
order by max(Salary) desc
offset 0 rows
fetch next 1 rows only;

--Solution from site
--
 
 
---------------------------------------
--Sol 1 | Pawan Kumar Khowal
---------------------------------------
 
SELECT * FROM NthHighest N WHERE 1 = (SELECT DISTINCT COUNT(*) FROM NthHighest N1 WHERE N1.Salary > N.Salary )
 
---------------------------------------
--Sol 2 | Pawan Kumar Khowal
---------------------------------------
 
SELECT TOP 1 WITH TIES Name , Salary FROM NthHighest N1 
WHERE Salary IN (SELECT TOP 2 WITH TIES Salary FROM NthHighest ORDER BY Salary DESC)
ORDER BY Salary
 
---------------------------------------
--Sol 3 | Pawan Kumar Khowal
---------------------------------------
 
SELECT A.Name, B.Salary
FROM (
    SELECT MAX(Salary) Salary
    FROM NthHighest N1 
    WHERE N1.Salary != (SELECT MAX(Salary) FROM NthHighest) ) B
CROSS APPLY (SELECT NAME FROM NthHighest WHERE SALARY = B.SALARY ) A
 
---------------------------------------
--Sol 4 | Pawan Kumar Khowal
---------------------------------------
 
;WITH CTE AS
(
    SELECT * , RANK() OVER (ORDER BY SALARY DESC) rnk FROM NthHighest
)
SELECT Name, Salary FROM CTE WHERE rnk = 2
 
 
--

