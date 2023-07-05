-- 1) how many olympics games have been held--

select count(distinct games) as total_games 
from olympics_history

-- 2)  Mention the total number of nations participated in each olympics gamaes--

select distinct games as games,
count(distinct noc) as nations_participated
from olympics_history
group by games
order by nations_participated;

-- 3)  which nation has participated in all of the olympic games--

select noc_regions.region as nations,
 count(distinct games) as total_games
 from olympics_history
 join noc_regions
 on olympics_history.noc= noc_regions.noc
 group by nations
 order by total_games desc;
 
 -- 4) Fetch the total number of sports played in each olympic games
 
 select distinct games,
 	count( distinct sport) as total_sports
from olympics_history
group by games
order by games;

-- 5) Fetch the oldest athlete to win a gold medal
 
select  name,
(case
when age = 'NA' then '0'
else age
end) as age
 from olympics_history
 where medal in ('Gold')
group by name, age
order by age desc;

-- 6) Fetch the top 5 athletes who have won the most medals

 select name,team, count( medal) as total_medals
 from  olympics_history
  where medal in  ('Gold', 'Silver', 'Bronze')
  group by name, team
  order by total_medals desc
  limit 5
  
 -- 7) Fetch the top 5 athletes who have won the most gold medals
 
 select name, team, count(medal) as total_medals
 from olympics_history
 where medal in ('Gold')
 group by name, team
 order by total_medals desc
 limit 5
 
 
 --8) Fetch the top 5 most successful countries. Success is defined by the no. of medal won
 
 select noc_regions.region as countries,
 		count(medal) as total_medals
	from olympics_history
	inner join noc_regions
	on olympics_history.noc= noc_regions.noc
	where medal in ('Gold', 'Silver', 'Bronze')
	group by region
	order by total_medals desc 
	limit 5;
 
 --9) In which sport india has won highest medal

select sport, count(medal) as total_medals
from olympics_history
where team = 'India'
group by sport
order by total_medals desc
limit 1;


-- 10) Fetch all olympic games where India won medal for Hockey and how many medals in each olympic games

select team, games, sport, count(medal) as total_medals
from olympics_history
where team= 'India' and sport = 'Hockey'
group by team, games, sport 
order by total_medals desc;


-- 11) List down total gold, silver and bronze medals won by each country.

 SELECT region,
COUNT(CASE WHEN medal = 'Gold' THEN medal END) AS Gold_medal,
COUNT(CASE WHEN medal = 'Silver' THEN medal END) AS Silver_medal,
COUNT(CASE WHEN medal = 'Bronze' THEN medal END) AS Bronze_medal
FROM olympics_history AS a
JOIN noc_regions AS n ON a.NOC = n.NOC
GROUP BY region
order by Gold_medal desc
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 