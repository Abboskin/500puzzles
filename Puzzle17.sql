--Puzzle 17
CREATE TABLE Holidays
(
ID INT
,HolidayDate DATETIME
)
GO
 
--Insert Data
INSERT INTO Holidays(ID,HolidayDate)
VALUES
(101,'01/10/2015'),
(102,'01/09/2015'),
(103,'02/19/2015'),
(104,'03/11/2015'),
(105,'04/11/2015')
 

--Create Table
CREATE TABLE CandidateJoining
(
CId VARCHAR(17)
,CJoiningDate DATETIME
)
GO
 
--Insert Data
INSERT INTO CandidateJoining(CId,CJoiningDate)
VALUES
('CJ10101','01/10/2015'),
('CJ10104','01/10/2015'),
('CJ10105','02/18/2015'),
('CJ10121','03/11/2015'),
('CJ10198','04/11/2015')

 --Verify Data
SELECT ID,HolidayDate FROM Holidays
SELECT CId,CJoiningDate FROM CandidateJoining

--Solution 
;with cte as (
	select cid,CJoiningDate,dateadd(day,-1,MIN(HolidayDate)) as valid
	from CandidateJoining a
	left join Holidays b
	on a.CJoiningDate=b.HolidayDate
	or dateadd(day,-1,a.CJoiningDate)=b.HolidayDate
	group by cid,CJoiningDate
)
select CId,CJoiningDate,
	case when valid IS null then cjoiningdate
	else valid end as validjoiningdate
from cte

--Solution from site 
--
 
;WITH CTE AS
(
    SELECT MIN(HolidayDate) MinDate , MAX(HolidayDate) MaxDate FROM
    (
        SELECT * , DAY(HolidayDate) - ROW_NUMBER() OVER (ORDER BY HolidayDate ASC) rnk FROM Holidays
    ) a GROUP BY rnk 
)
SELECT CId , CASE WHEN MinDate IS NULL THEN CJoiningDate ELSE MinDate -1 END CandidateJoining FROM CandidateJoining j
LEFT JOIN CTE c ON j.CJoiningDate BETWEEN c.MinDate AND c.MaxDate
--


