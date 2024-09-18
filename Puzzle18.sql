--Puzzle 18
CREATE TABLE TestCommaUsingCrossApply
(
ID INT
,VALUE VARCHAR(100)
)
GO
 
--Insert Data
 
INSERT INTO TestCommaUsingCrossApply(ID,VALUE)
VALUES
(1,'a,b,c'),
(2,'s,t,u,v,w,x')
 
--Verify Data
select ID,VALUE from TestCommaUsingCrossApply

--Solution
select
    t.ID,
    sv.value AS SplitValue
from  
    TestCommaUsingCrossApply t
CROSS APPLY 
    string_split(t.VALUE, ',') sv

--Solutions from website 
--
 
 
---------------------------------------
--Sol 1 | Pawan Kumar Khowal
---------------------------------------
 
 
SELECT Id,SplitedValue FROM
(
    SELECT ID,cast(('<X>'+replace(e.VALUE,',' ,'</X><X>')+'</X>') as xml) as xmlcol  FROM  TestCommaUsingCrossApply e 
) s
OUTER APPLY
(
    SELECT ProjectData.D.value('.', 'varchar(100)') as SplitedValue
    FROM s.xmlcol.nodes('X') as ProjectData(D)
) a 
 
 
 
--