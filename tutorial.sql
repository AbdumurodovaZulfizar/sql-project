--first tutorial
SELECT population FROM world
  WHERE name = 'Germany'

SELECT name, population FROM world
  WHERE name IN ( 'Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
--second tutorial
SELECT name FROM world
  WHERE name LIKE 'Y%'

SELECT name FROM world
  WHERE name LIKE '%y'

SELECT name FROM world
  WHERE name LIKE '%x%'

SELECT name FROM world
  WHERE name LIKE '%land'

SELECT name FROM world
  WHERE name LIKE 'C%ia'

SELECT name FROM world
  WHERE name LIKE '%oo%'

SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

SELECT name FROM world
  WHERE name LIKE '_t%'
ORDER BY name

SELECT name FROM world
  WHERE name LIKE '%o__o%'

SELECT name FROM world
  WHERE name LIKE '____'

SELECT name
  FROM world
  WHERE name = capital

SELECT name
  FROM world
where concat(name, ' City') = capital

select capital, name
from world
where capital like concat('%', name, '%')

select capital, name
from world
where capital like concat('%', name, '%') and not name = capital

SELECT name, REPLACE(capital, name, '')
FROM world
WHERE capital LIKE CONCAT('%', name, '_%')
--third tutorial
SELECT name, continent, population FROM world

SELECT name
  FROM world
  WHERE population > 200000000

select name, gdp/population
from world
where population>=200000000

select name, population/1000000
from world
where continent = 'South America'

select name, population
from world
where name in ('France', 'Germany', 'Italy')

select name
from world
where name like '%United%'

select name, population, area
from world
where area>3000000 or population>250000000

select name, population, area
from world
where (area>3000000 and not population>250000000) or (population>250000000 and not area>3000000)

select name, round(population/1000000,2), round(gdp/1000000000,2)
from world
where continent =  'South America'

select name, round(gdp/population, -3)
from world
where gdp>=1000000000000

SELECT name,
        capital
  FROM world
  WHERE LEN(name) = LEN(capital)

SELECT name, capital
FROM world
where LEFT(name, 1) = LEFT(capital, 1) and (name <> capital)

SELECT name
    FROM world
WHERE name LIKE '%a%' and name like '%e%' and name like '%i%' and name like '%o%' and name like '%u%'
  AND name NOT LIKE '% %'
--fourth tutorial
SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1950

SELECT winner
  FROM nobel
  WHERE yr = 1962
  AND subject = 'Literature'

select yr, subject
from nobel
where winner = 'Albert Einstein'

select winner
from nobel
where yr>=2000 and subject = 'Peace'

select *
from nobel
where subject = 'Literature' and (yr>=1980 and yr<=1989)

SELECT * FROM nobel
  WHERE subject = 'Peace'
  AND winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

select winner
from nobel
where winner like 'John%'

select yr, subject, winner
from nobel
where (subject = 'Physics'and yr = 1980) or (subject = 'Chemistry'
and yr = 1984)

select yr, subject, winner
from nobel
where yr = 1980 and not subject in('Chemistry', 'Medicine')

select yr, subject, winner
from nobel
where (subject = 'Medicine' and yr < 1910) or (subject = 'Literature' and yr>=2004)

select *
from nobel
where winner = 'PETER GRÜNBERG'

select *
from nobel
where winner = 'EUGENE O''NEILL'

select winner, yr, subject
from nobel
where winner like 'Sir%'
order by yr desc, winner
--fifth tutorial
SELECT name FROM world
  WHERE population >
    (SELECT population FROM world
      WHERE name='Russia' )

select name from world
where gdp/population > (
  select gdp/population from world
where name = 'United Kingdom') and continent = 'Europe'

select name, continent from world
where continent in (
select continent
from world
where name in ('Argentina', 'Australia'  ))
order by name

select name, population from world
where population > (
select population from world
where name = 'canada') and population < (select population from world
where name = 'Poland')

SELECT 
  name, 
  CONCAT(ROUND((population*100)/(SELECT population 
                                  FROM world WHERE name='Germany'), 0), '%')
FROM world
WHERE population IN (SELECT population
                      FROM world
                      WHERE continent='Europe')

select name from world
where gdp > all (select gdp from world where
continent = 'Europe' and gdp is not null)

SELECT continent, name,area from world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

SELECT continent,name FROM world x
  WHERE x.name <= ALL (
    SELECT name FROM world y
      WHERE x.continent=y.continent)

select name, continent, population from world x

where  25000000 >= ALL(
select population from world y
where x.continent = y.continent
and y.population>0)

select name, continent from world x
where population > all (
select population*3 from world y
where x.continent = y.continent and y.name != x.name)
--sixth tutorial
SELECT SUM(population)
FROM world

select distinct continent
from world

select sum(gdp)
from world
where continent = 'Africa'

select count(name)
from world
where area >= 1000000

select sum(population)
from world
where name in ('Estonia', 'Latvia', 'Lithuania')

select continent, count(name)
from world
group by continent

select continent, count(name)
from world
where population >= 10000000
group by continent

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population)  >= 100000000
--seventh tutorial
SELECT matchid, player
FROM goal
WHERE teamid = 'GER'

SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012

SELECT player, teamid, mdate
FROM game
JOIN goal ON (game.id = goal.matchid)
WHERE teamid = 'GER'

SELECT team1, team2, player
FROM goal
JOIN game ON (game.id = goal.matchid)
WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam ON (goal.teamid = eteam.id)
WHERE gtime <= 10

SELECT mdate, teamname
FROM game
JOIN eteam ON (game.team1 = eteam.id)
WHERE coach = 'Fernando Santos'

SELECT player
FROM goal
JOIN game ON (goal.matchid = game.id)
WHERE stadium = 'National Stadium, Warsaw'

SELECT DISTINCT player
FROM game
JOIN goal ON goal.matchid = game.id
WHERE (team1 = 'GER' OR team2 = 'GER')
AND teamid <> 'GER'

SELECT teamname, COUNT(player) goals_scored
FROM eteam JOIN goal ON eteam.id = goal.teamid
GROUP BY teamname

SELECT stadium, COUNT(player) goals_scored
FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY stadium

SELECT matchid, mdate, COUNT(player) goals_scored
FROM game
JOIN goal ON goal.matchid = game.id
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY goal.matchid

SELECT matchid, mdate, COUNT(player)
FROM game
JOIN goal ON game.id = goal.matchid
WHERE teamid = 'GER'
GROUP BY game.id

SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game JOIN goal ON goal.matchid = game.id
GROUP BY game.id
ORDER BY mdate, matchid, team1, team2
--eights tutorial
SELECT id, title
  FROM movie
  WHERE yr=1962

select yr
from movie
where title = 'Citizen Kane'

select id, title, yr
from movie
where title like '%Star Trek%'
order by yr

select id
from actor
where name = 'Glenn Close'

select id
from movie
where title = 'Casablanca'

SELECT name
  FROM casting, actor
  WHERE movieid=(SELECT id 
          FROM movie 
          WHERE title='Casablanca')
    AND actorid=actor.id

SELECT name
  FROM casting, actor
  WHERE movieid=(SELECT id 
            FROM movie 
            WHERE title='Alien')
    AND actorid=actor.id

select title
from movie, actor, casting
where name='Harrison Ford' and movieid = movie.id and actorid = actor.id

select title
from movie, actor, casting
where name =  'Harrison Ford' and movieid = movie.id and actorid = actor.id and ord <> 1

select title, name
from movie, actor, casting
where yr = 1962 and actorid = actor.id and movieid = movie.id and ord = 1

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1

SELECT title, name 
FROM movie join casting on (movieid = movie.id and ord = 1)
          join actor on (actorid = actor.id)
WHERE movie.id IN (
  SELECT movieid FROM casting
  WHERE actorid in(
select id from actor
where name = 'Julie Andrews'))

select name
from actor join casting on (actorid = id)
where ord=1
group by name
having count(*)>=15

select title, count (*)
from movie
join casting on (movie.id = movieid) 
where yr = 1978
group by title
order by count(*) desc, title

SELECT a.name
  FROM (SELECT movie.*
          FROM movie
          JOIN casting
            ON casting.movieid = movie.id
          JOIN actor
            ON actor.id = casting.actorid
        WHERE actor.name = 'Art Garfunkel') AS m
  JOIN (SELECT actor.*, casting.movieid
          FROM actor
          JOIN casting
            ON casting.actorid = actor.id
        WHERE actor.name != 'Art Garfunkel') as a
    ON m.id = a.movieid;
--nineth tutorial
select name from teacher
where dept is null

SELECT teacher.name, dept.name
  FROM teacher INNER JOIN dept
          ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
          ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
  FROM teacher RIGHT JOIN dept
          ON (teacher.dept=dept.id)

SELECT name, COALESCE(mobile, '07986 444 2266')
from teacher

select coalesce(teacher.name, 'None'), coalesce(dept.name, 'None')
from teacher left join dept on (dept.id = teacher.dept)

select count(teacher.name), count(teacher.mobile)
from teacher

select dept.name, count(teacher.name)
from teacher right join dept on (teacher.dept = dept.id)
GROUP BY dept.name

select teacher.name,
case when teacher.dept = 1 then 'Sci'
    when teacher.dept = 2 then 'Sci'
else 'Art' end
from teacher left join dept on (teacher.dept = dept.id)

select teacher.name,
case when teacher.dept = 1 then 'Sci'
    when teacher.dept = 2 then 'Sci'
    when teacher.dept = 3 then 'Art'
else 'None' end
from teacher left join dept on (teacher.dept = dept.id)

SELECT A_STRONGLY_AGREE
  FROM nss
  WHERE question='Q01'
    AND institution='Edinburgh Napier University'
    AND subject='(8) Computer Science'

SELECT institution, subject
  FROM nss
  WHERE question='Q15'
    and score >= 100

SELECT institution,score
  FROM nss
  WHERE question='Q15'
    AND subject='(8) Computer Science'
and score <= 50

SELECT subject, sum(response)
  FROM nss
  WHERE question='Q22'
    AND (subject = '(8) Computer Science' or subject = '(H) Creative Arts and Design')
group by subject

SELECT subject, sum((response*A_STRONGLY_AGREE)/100)
  FROM nss
  WHERE question='Q22'
    AND (subject='(8) Computer Science' or subject =  '(H) Creative Arts and Design')
group by subject

SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE)/SUM(response),0) FROM nss
WHERE question='Q22' AND subject IN ('(8) Computer Science','(H) Creative Arts and Design')
GROUP BY subject

SELECT institution, ROUND(SUM(response*score)/SUM(response),0)
  FROM nss
  WHERE question='Q22'
    AND (institution LIKE '%Manchester%')
group BY institution

SELECT institution,sum(sample), sum (case when subject like '(8)%' then sample end)
  FROM nss
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
group by institution
--tenth tutorial