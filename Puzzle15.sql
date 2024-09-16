--Puzzle 15

CREATE TABLE WorkOrders
(
WorkOrderID CHAR(5) NOT NULL,
STEP_NBR INTEGER NOT NULL CHECK (step_nbr BETWEEN 0 AND 1000),
STEP_STATUS CHAR(1) NOT NULL CHECK (step_status IN ('C', 'W')), -- complete, waiting
)
GO
 
--Insert Data
INSERT INTO WorkOrders(WorkOrderID,STEP_NBR,STEP_STATUS) VALUES
('AA100', 0, 'C'),
('AA100', 1, 'W'),
('AA100', 2, 'W'),
('AA200', 0, 'W'),
('AA200', 1, 'W'),
('AA300', 0, 'C'),
('AA300', 1, 'C')
GO
 
 
SELECT WorkOrderID,STEP_NBR,STEP_STATUS FROM WorkOrders

--Solution 
SELECT WorkOrderID
FROM WorkOrders
WHERE STEP_NBR = 0
  AND STEP_STATUS = 'C'
  AND NOT EXISTS (
    SELECT 1
    FROM WorkOrders AS W
    WHERE W.WorkOrderID = WorkOrders.WorkOrderID
      AND W.STEP_NBR <> 0
      AND W.STEP_STATUS <> 'W'
  )

--Solutions from site 
--
 
 
---------------------------------------
--Sol 1
---------------------------------------
 
SELECT workorder_id
FROM WorkOrders
GROUP BY workorder_id
HAVING COUNT(*) =    COUNT(CASE WHEN step_nbr <> 0 AND step_status = 'W' THEN 1 ELSE NULL END) 
                   + COUNT(CASE WHEN step_nbr = 0 AND step_status = 'C' THEN 1 ELSE NULL END)
 
 
---------------------------------------
--Sol 2
---------------------------------------
                    
SELECT workorder_id
FROM Projects
GROUP BY workorder_id
HAVING COUNT(step_nbr) = SUM
                            (
                            CASE
                            WHEN step_nbr <> 0 AND step_status = 'W' THEN 1
                            WHEN step_nbr = 0 AND step_status = 'C' THEN 1
                            ELSE 0 END
                            )
 
 
 
 
--
