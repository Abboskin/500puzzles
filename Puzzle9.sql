--Puzzle 9 

--Create table
CREATE TABLE [dbo].[EmpSalaryGreaterManager]
(
[EmpID] [int] NULL,
[EmpName] [varchar](50) NULL,
[EmpSalary] [bigint] NULL,
[MgrID] [int] NULL
)
GO
 
--Insert Data
INSERT INTO [EmpSalaryGreaterManager](EmpID,EmpName,EmpSalary,MgrID)
VALUES
(1,    'Pawan',      80000, 4),
(2,    'Dheeraj',    70000, 4),
(3,    'Isha',       100000,       4),
(4,    'Joteep',     90000, NULL),
(5,    'Suchita',    110000,       4)
 
--Solution 

select * 
from [EmpSalaryGreaterManager] E
where E.EmpSalary > (
    select MAX(M.EmpSalary)
    from [EmpSalaryGreaterManager] M
    where M.MgrID IS NULL
);

--Solution from site 

--
 
 
---------------------------------------
--Sol 1 | Pawan Kumar Khowal
---------------------------------------
 
 
SELECT e1.EmpID,e1.EmpName,e1.EmpSalary,e1.MgrID, e.EmpName Mgr FROM EmpSalaryGreaterManager e
INNER JOIN EmpSalaryGreaterManager e1 ON e.EmpID = e1.MgrID
WHERE e1.EmpSalary > e.EmpSalary
 
--

