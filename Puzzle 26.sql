--Puzzle 26
CREATE TABLE [dbo].[MissingValue]
(
[Value] [varchar](1) NULL,
[ayValue] [int] NULL
)
GO
 
--Insert Data
 
INSERT INTO [dbo].[MissingValue](Value,ayValue)
VALUES
('A',  1),
('',   23),
('',   21),
('',   22),
('B',  34),
('',   31),
('',   89),
('C',  222),
('', 10)
 
--Verify Data
 
SELECT Value,ayValue FROM [MissingValue]

--SOLUTOIN 

SELECT ayValue,max(Value) OVER (ORDER BY AYVALUE)
FROM [dbo].[MissingValue]

--SOLUTION FROM SITE 
;WITH CTE2 AS
(
       SELECT p.Value,p.ayValue
       ,ROW_NUMBER() OVER (ORDER BY (SELECT 1)) rrnk FROM [dbo].[MissingValue] p 
) 
SELECT
       c.Value,c.ayValue,c.rrnk,
       (
          SELECT d.Value from CTE2 d WHERE d.rrnk = (Select max(e.rrnk) from CTE2 e 
          Where e.rrnk <= c.rrnk and (e.value != '' ))
       ) NewValue
FROM CTE2 c
