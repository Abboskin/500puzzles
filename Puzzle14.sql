--Puzzle 14
--Create table
 
Create table tr_football_league
(
club_id INT,
club_name Varchar(32),
championship_year INT,
year_100th_champion INT
)
 
--Insert Data
insert into tr_football_league values (1, 'FENERBAHCE', 2007, 1) ;
insert into tr_football_league values (2, 'GALATASARAY', 2006, 0) ;
insert into tr_football_league values (3, 'BESIKTAS', 2003, 1) ;
insert into tr_football_league values (1, 'FENERBAHCE', 2005, 0) ;
insert into tr_football_league values (1, 'FENERBAHCE', 2004, 0) ;
insert into tr_football_league values (2, 'GALATASARAY', 2002, 0) ;
insert into tr_football_league values (2, 'GALATASARAY', 2000, 0) ;
insert into tr_football_league values (2, 'GALATASARAY', 1999, 0) ;
insert into tr_football_league values (2, 'GALATASARAY', 1998, 0) ;
insert into tr_football_league values (2, 'GALATASARAY', 1997, 0) ;
insert into tr_football_league values (1, 'FENERBAHCE', 1996, 0);
insert into tr_football_league values (1, 'FENERBAHCE', 2001, 0) ;
insert into tr_football_league values (1, 'FENERBAHCE', 1989, 0) ;
insert into tr_football_league values (1, 'FENERBAHCE', 1985, 0) ;
 
--Verify Data
SELECT club_id, club_name , championship_year , year_100th_champion FROM tr_football_league

--Solution
WITH ChampionshipCounts AS (
    SELECT
        club_id,
        club_name,
        COUNT(*) AS TotalChampionships
    FROM
        tr_football_league
    GROUP BY
        club_id,
        club_name
)
SELECT
    cc.club_id,
    cc.club_name,
    cc.TotalChampionships
FROM
    ChampionshipCounts cc
WHERE
    cc.club_id IN (
        SELECT TOP 1
            club_id
        FROM
            tr_football_league
        WHERE
            year_100th_champion = 1
    )
ORDER BY
    cc.TotalChampionships DESC



--Solution from website 
---------------------------------------
--Sol 1
---------------------------------------
 
;WITH CTE AS
(
    SELECT club_name,
    year_100th_champion,
    COUNT(*) over(PARTITION BY club_name) cnt
    FROM
    tr_football_league
)
,CTE2 AS
(
    SELECT a.club_name,COUNT(a.cnt) Maxy FROM CTE a INNER JOIN tr_football_league b ON a.club_name = b.club_name
    WHERE b.year_100th_champion = 1
    GROUP BY a.club_name
)
SELECT club_name FROM CTE2
WHERE Maxy = (SELECT MAX(Maxy) FROM CTE2)
