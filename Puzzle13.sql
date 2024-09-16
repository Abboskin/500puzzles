--Puzzle 13
CREATE TABLE [dbo].[testGoldRateChange]
(
[dt] [datetime] NULL,
[Rate] [int] NULL
)
GO
 
--Insert Data
INSERT INTO [dbo].[testGoldRateChange](dt,Rate)
VALUES
('2014-09-18 06:25:19.897', 27000),
('2014-09-19 06:25:19.897', 27000),
('2014-09-20 06:25:19.897', 31000),
('2014-09-21 06:25:19.897', 31000),
('2014-09-22 06:25:19.897', 31000),
('2014-09-23 06:25:19.897', 32000),
('2014-09-24 06:25:19.897', 31000),
('2014-09-25 06:25:19.897', 32000),
('2014-09-26 06:25:19.897', 27000)
 
--Check data
SELECT dt,Rate FROM [dbo].[testGoldRateChange]

--Solution 
-- Step 1: Create CTEs to calculate row numbers
WITH CTE AS (
    SELECT
        dt,
        Rate,
        ROW_NUMBER() OVER (ORDER BY Rate) -
        ROW_NUMBER() OVER (ORDER BY dt) AS GR
    FROM
        [dbo].[testGoldRateChange]
)
SELECT
    MIN(dt) AS StartDate,
    MAX(dt) AS EndDate,
    Rate
FROM
    CTE
GROUP BY
    Rate,
    GR
ORDER BY
    StartDate;

--Solution from site 
---------------------------------------
--Sol 1 | Pawan Kumar Khowal
---------------------------------------
 
; WITH CTE1 AS ( SELECT dt , Rate , ROW_NUMBER() OVER (ORDER BY dt) Rnk  FROM testGoldRateChange )
,CTE2 AS
(
SELECT *,  CASE WHEN
              Rate = ( SELECT Rate from CTE1 c3 WHERE c3.rnk =  ( SELECT MAX(c1.rnk) FROM CTE1 c1 WHERE c1.rnk < c2.rnk ))  
              THEN 0 ELSE 1 END Identifier,
            SUM(CASE WHEN
              Rate = ( SELECT Rate from CTE1 c3 WHERE c3.rnk =  ( SELECT MAX(c1.rnk) FROM CTE1 c1 WHERE c1.rnk < c2.rnk ))  
              THEN 0 ELSE 1 END) OVER (ORDER BY rnk ) cols                   
                       FROM CTE1 c2
)
SELECT MIN(dt) StartDate , MAX(dt) EndDate , MAX(Rate) Rate FROM CTE2 GROUP BY cols