--Puzzle 11
--Create table
CREATE TABLE [dbo].[TestMultipleZero]
(
[A] [int] NULL,
[B] [int] NULL,
[C] [int] NULL,
[D] [int] NULL
)
GO
 
--Insert Data
INSERT INTO [dbo].[TestMultipleZero](A,B,C,D)
VALUES (0,0,0,1),(0,0,1,0),(0,1,0,0),(1,0,0,0),(0,0,0,0),(1,1,1,0)
 
--Check data
SELECT A,B,C,D FROM [dbo].[TestMultipleZero]

--Solution 1
select * from [dbo].[TestMultipleZero]
where A <> 0 or B <> 0 or C <> 0 or D <> 0

--Solution from site
--
 
 
---------------------------------------
--Sol 1 | Pawan Kumar Khowal
---------------------------------------
 
SELECT * FROM TestMultipleZero
WHERE A != 0 OR B != 0 OR C != 0 OR D != 0
 
 
--
