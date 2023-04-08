select distinct user1 from [mini capstone]
select distinct item from [mini capstone] where item in ('BD0101EN', 'BD0111EN', 'DA0101EN', 'DS0101EN', 'PY0101EN')
select * from df2

select 
t3.user1,t3.item,m.rating,df11.mean 'item mean',df2.mean 'user mean'
from [mini capstone] m
right join
(select * from 
(select distinct user1 from [mini capstone]) as t1,
(select distinct item from [mini capstone] where item in ('BD0101EN', 'BD0111EN', 'DA0101EN', 'DS0101EN', 'PY0101EN')) as t2) as t3
on m.user1= t3.user1 and m.item=t3.item
inner join
df11 on t3.item=df11.item
inner join 
df2 on t3.user1=df2.user1