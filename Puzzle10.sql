--Puzzle 10
--Create Table
 
CREATE TABLE Department
(
DeptID INT
,DeptName VARCHAR(10)
)
GO
 
--Insert Data
 
INSERT INTO Department(DeptID,DeptName)
VALUES
(1,'Finance'),
(2,'IT'),
(3,'HR')
 
--Verify Data
 
SELECT DeptID,DeptName FROM Department
 
--Create Table
 
CREATE TABLE Emps
(
EmpID INT
,EmpName VARCHAR(50)
,DeptID INT
,EmpSalary FLOAT
)
GO
 
--Insert Data
 
INSERT INTO Emps(EmpID,EmpName,DeptID,EmpSalary) VALUES
(101,'Isha',1,7000),
(111,'Esha',1,8970),
(102,'Mayank',1,8900),
(103,'Ramesh',2,4000),
(104,'Avtaar',2,9000),
(105,'Gopal',3,17000),
(106,'Krishna',3,1000),
(107,'Suchita',3,7000),
(108,'Ranjan',3,17900)
 
--Verify Data
 
SELECT EmpID,EmpName,DeptID,EmpSalary FROM Emps

--Solution 1
select e.DeptID, EmpID, EmpName, EmpSalary, D.DeptName
from (select DeptID, EmpID, EmpName, EmpSalary,
row_number() over (partition by DeptID order by EmpSalary desc) as SalaryRank from Emps) e
JOIN Department D ON E.DeptID = D.DeptID
where SalaryRank = 2;


--Solution from site
--
 
 
---------------------------------------
--Sol 1 | Pawan Kumar Khowal
---------------------------------------
 
 
;WITH CTE AS
(
    SELECT EmpID,EmpName,DeptID,EmpSalary 
           ,RANK() OVER (PARTITION BY DEPTID ORDER BY EmpSalary DESC) rnk   
    FROM Emps
)
SELECT EmpID,EmpName,c.DeptID,EmpSalary,d.DeptName FROM CTE c INNER JOIN Department d ON d.DeptID = c.DeptID
WHERE rnk = 2
 
--