--Puzzle 25
drop table if exists [dbo].[TheCompanyCode]
CREATE TABLE [dbo].[TheCompanyCode]
(
[A] [int] NULL,
[B] [int] NULL,
[C] [int] NULL,
[CompanyCode] [varchar](100) NULL,
[GL] [varchar](100) NULL
)
GO
 
--Insert Data
 
INSERT INTO TheCompanyCode(A,B,C,CompanyCode,GL)
VALUES
(1,    1,     1,     'AA',  001),
(1,    1,     2,     'AA',  002),
(1,    1,     3,     'AA',  003),
(1,    1,     4,     'AA',  004),
(2,    2,     1,     'BB',  001),
(2,    2,     2,     'BB',  002)
 
--Verify Data
 
SELECT * FROM TheCompanyCode

--SOLUTION 

;WITH CTE AS
(
       SELECT A,B,C,CompanyCode,GL,
       ROW_NUMBER() OVER (PARTITION BY A,B,CompanyCode ORDER BY C) rrnk
       FROM TheCompanyCode
)
SELECT
        CASE WHEN rrnk = 1 THEN A ELSE NULL END A
       ,CASE WHEN rrnk = 1 THEN B ELSE NULL END B
       ,C
       ,CASE WHEN rrnk = 1 THEN CompanyCode ELSE NULL END CompanyCode
       ,GL
FROM CTE
