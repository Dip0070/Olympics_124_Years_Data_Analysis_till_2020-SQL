create database Olympics;
create table athletes_summer
(id int, name text, sex char(2), age int, team text, 
NOC char(3), Games text, year int, season text, city text,
 sport text, event text, medal text);
 


create table athletes_winter
(id int,Name text,Sex text,Age int,Team text,
NOC char(3),Games text,Year int,Season text,
City text,Sport text,Event text,Medal text);



create table regions
(id int, NOC char(3), region text, notes text);

select * from athletes_summer;
select * from athletes_winter;
select * from regions;

/* Number of Cities are Participated In olympics*/

select count(distinct(region)) from regions;


/* Types of sport are available  olypics. */

with temp as
(select * from athletes_summer
union 
select * from athletes_winter)
select  sport from temp 
group by sport; 


/* Types of sport are available in winter olypics.*/

select  sport from athletes_winter 
group by sport; 


/* Details of participant which has enrolled in maximum game is summer olympic*/

select name, count(name), sex, age, team, year from athletes_summer
group by 1,3,4,5,6 
order by count(name) desc
limit 20; 


/* number of gold medal wins by country*/

with temp as
(select * from athletes_summer
union 
select * from athletes_winter)
select team, count(team) from temp where medal ="Gold"
group by 1
order by 2 desc;


/* No of participation of India year wise */

with temp as
(select * from athletes_summer
union 
select * from athletes_winter)
select year, count(id) from temp
where team ="India"
group by year
order by year;


/* no of participation , categories medal of team*/

with temp as
(select * from athletes_summer
union
select * from athletes_winter)
select distinct(team), count(team), sum(if(medal="gold",1,0)) as Gold, 
sum(if(medal="Silver",1,0)) as Silver, sum(if(medal="Bronze",1,0)) as Bronze
from temp
group by 1
order by 2 desc;


/* No of participant in sports in different team in year wise*/

with temp as
(select * from athletes_summer
union 
select * from athletes_winter)

select distinct(sport), team, count(id) from temp
group by 1,2
order by 3 desc, 1
limit 20;

/* Number of Participation by gender, year wise and team wise*/

select sex, count(sex) as Number, year, team from
(select * from athletes_summer
union 
select * from athletes_winter) as temp
group by sex,3,4
order by 2 desc;





