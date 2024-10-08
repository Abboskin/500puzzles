--Puzzle 22
--CREATE TABLE
 
CREATE TABLE TestTable 
(
  StudentName VARCHAR(100)
, Course VARCHAR(100)
, Instructor VARCHAR(100)
, RoomNo VARCHAR(100)
)
GO
 
-- Populate table
 
INSERT INTO TestTable (StudentName, Course, Instructor, RoomNo)
SELECT 'Mark', 'Algebra', 'Dr. James', '101'
UNION ALL
SELECT 'Mark', 'Maths', 'Dr. Jones', '201'
UNION ALL
SELECT 'Joe', 'Algebra', 'Dr. James', '101'
UNION ALL
SELECT 'Joe', 'Science', 'Dr. Ross', '301'
UNION ALL
SELECT 'Joe', 'Geography', 'Dr. Lisa', '401'
UNION ALL
SELECT 'Jenny', 'Algebra', 'Dr. James', '101'
GO
 
-- Check orginal data
 
SELECT StudentName, Course, Instructor, RoomNo
FROM TestTable
GO

--SOLUTION 
SELECT StudentName, string_agg(concat (Course, Instructor,' in Room No ' ,RoomNo),', ') AS 'TAUGHT BY'
FROM TestTable
group by StudentName

--SOLUTION 2
SELECT b.StudentName 
            , STUFF 
                ((
                SELECT ', ' + Course + ' by ' + CAST(Instructor AS VARCHAR(MAX)) + ' in Room No ' + CAST(RoomNo AS VARCHAR(MAX))
                FROM TestTable a
                WHERE ( a.StudentName = b.StudentName )
                FOR XML PATH('')
                ) ,1,2,'') 
                AS cusr
FROM TestTable b
GROUP BY b.StudentName