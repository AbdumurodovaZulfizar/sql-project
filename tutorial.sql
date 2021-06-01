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
--eights tutorial
--nineth tutorial
--tenth tutorial