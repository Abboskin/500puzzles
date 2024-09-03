--PUZZLE 5

CREATE TABLE PQ
(
ID INT
,Name VARCHAR(10)
,Typed VARCHAR(10)
)
 
INSERT INTO PQ(ID,Name,Typed) VALUES  (1,'P',NULL) , (1,NULL,'Q')
 
--Solution 1
SELECT 
    ID, 
    MAX(CASE WHEN 
		Name IS NOT NULL 
		THEN Name 
		ELSE '' END) AS Name, 
    MAX(CASE WHEN 
		Typed IS NOT NULL 
		THEN Typed ELSE '' END) AS Typed
FROM PQ
GROUP BY ID;

--Solution 2
SELECT 
    ID, 
    COALESCE(MAX(Name), '') AS Name, 
    COALESCE(MAX(Typed), '') AS Typed
FROM PQ
GROUP BY ID;

--Solution from site 
--
 
/************   SOLUTION 1    | Pawan Kumar Khowal     ****************/
 
 
SELECT p.Id,p.Name, (SELECT r.Typed from PQ r WHERE p.ID = r.Id AND r.Typed IS NOT NULL) Typed FROM PQ p WHERE p.Name IS NOT NULL
 
 
 
/************   SOLUTION 2    | Pawan Kumar Khowal     ****************/
 
SELECT Id, MIN(CASE WHEN name IS NOT NULL THEN name ELSE NULL END) Name
, MIN(CASE WHEN typed IS NOT NULL THEN typed END) Typed 
FROM pq 
GROUP BY Id
 
 
/************   SOLUTION 3   | Pawan Kumar Khowal     ****************/
 
;WITH CTE1 AS
(
    SELECT ID, Name , ROW_NUMBER() OVER (ORDER BY (SELECT 1)) rnk FROM pq WHERE Name IS NOT NULL
)
,CTE2 AS
(
    SELECT ID, Typed , ROW_NUMBER() OVER (ORDER BY (SELECT 1)) rnk FROM pq WHERE Typed IS NOT NULL
)
SELECT c1.ID, Name, Typed FROM CTE1 c1 INNER JOIN CTE2 c2 ON c1.rnk = c2.rnk
 
 
--

