--Puzzle 27
--Create Table
CREATE TABLE [dbo].[TwoDecimal]
(
[Val] Money
)
GO
 
 
--Insert Data
INSERT INTO
[TwoDecimal]
VALUES
(100.119),
(1.119),
(111.119),
(81.115),
(90.114),
(100.110),
(100.000),
(100.001),
(100.019)
 
--Verify Data
SELECT * FROM [TwoDecimal]

--Solution 

SELECT CAST(ROUND(val,2) AS FLOAT) [FormattedValue] FROM TwoDecimal