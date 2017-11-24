/*saiprassanth.ramesh@accenture.com*/

/*24nov2017*/

/*problem_set4 solution*/

/*1.Find the names of all students who are friends with someone named Gabriel. (1 point possible)*/

select name from highschooler where id in
(select id1 from friend where id2 in
 (select id from highschooler where name="gabriel"));



/*2.For every student who likes someone 2 or more grades younger than themselves, return that student's name and grade, and the name and grade of the student they like. (1 point possible)*/

select * from
(select a.name1,a.grade1,h.name as likesname,h.grade as likesgrade2 from 
 (select likes.id1,likes.id2,highschooler.name as name1,highschooler.grade 
  as grade1 from likes join highschooler on likes.id1=highschooler.id) a join 
 highschooler h on h.id=a.id2) f where (f.grade1-f.likesgrade2)>=2;



/*3.For every pair of students who both like each other, return the name and grade of both students. Include each pair only once, with the two names in alphabetical order. (1 point possible)*/

select h1.name, h1.grade, h2.name, h2.grade  from Likes l1, Likes l2, Highschooler h1, Highschooler h2
where l1.ID1=l2.ID2 and l2.ID1=l1.ID2 and l1.ID1=h1.ID and l1.ID2=h2.ID and h1.name<h2.name;



/*4.Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades. Sort by grade, then by name within each grade. (1 point possible)*/

select name ,grade from highschooler where id not in(select distinct(id1) from likes) 
and id not in(select distinct(id2) from likes) order by grade,name;



/*5.For every situation where student A likes student B, but we have no information about whom B likes (that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades. (1 point possible)*/

select o.id,o.name,o.grade,p.id2 as likesid,p.likesname,p.likesgrade 
from highschooler o join
(select l.id1,l.id2,k.name as likesname,k.grade as likesgrade from likes l 
join (select * from highschooler where id in
(select distinct(id2) from likes where id2 not in(select id1 from likes) )) k 
on l.id2=k.id) p on p.id1=o.id;


/*6.Find names and grades of students who only have friends in the same grade. Return the result sorted by grade, then by name within each grade. (1 point possible)*/

select name, grade from Highschooler
where ID not in (
  select ID1 from Highschooler H1, Friend, Highschooler H2
  where H1.ID = Friend.ID1 and Friend.ID2 = H2.ID and H1.grade <> H2.grade)
order by grade, name;


/*7.For each student A who likes a student B where the two are not friends, find if they have a friend C in common (who can introduce them!). For all such trios, return the name and grade of A, B, and C. (1 point possible)*/

select distinct H1.name, H1.grade, H2.name, H2.grade, H3.name, H3.grade 
from Highschooler H1, Likes, Highschooler H2, Highschooler H3, Friend F1, Friend F2
where H1.ID = Likes.ID1 and Likes.ID2 = H2.ID and H2.ID not in (select ID2 from Friend where ID1 = H1.ID) and
H1.ID = F1.ID1 and F1.ID2 = H3.ID and H3.ID = F2.ID1 and F2.ID2 = H2.ID;



/*8.Find the difference between the number of students in the school and the number of different first names. (1 point possible)*/

select count(id)-count(distinct(name)) as difference from highschooler;



/*9.Find the name and grade of all students who are liked by more than one other student. (1 point possible)*/

select name,grade from highschooler where id in
(select id2 as like_count from likes group by id2 having count(id1)>1);



/*10.For every situation where student A likes student B, but student B likes a different student C, return the names and grades of A, B, and C. (1 point possible)*/

select f.name1,f.grade1,f.name as name2,f.grade as grade2,g.name,g.grade from
(select e.name as name1,e.grade as grade1,e.id2_likes_id3,d.name,d.grade from  
(select b.name,b.grade,c.id1_likes_id2,c.id2_likes_id3 from highschooler b join
(select * from (select l1.id1,l1.id2 as id1_likes_id2,l2.id2 as id2_likes_id3
from likes l1 join likes l2 on l1.id2=l2.id1) a where a.id1!=a.id2_likes_id3) c
on b.id=c.id1) e join highschooler d on e.id1_likes_id2=d.id) f join
highschooler g on f.id2_likes_id3=g.id;



/*11.Find those students for whom all of their friends are in different grades from themselves. Return the students' names and grades.(1 point possible)*/

SELECT name,grade FROM Highschooler WHERE ID NOT IN
(SELECT h1.ID FROM Highschooler h1, Friend f1, Highschooler h2
WHERE h1.ID=f1.ID1 AND h2.ID=f1.ID2 AND h2.grade=h1.grade);



/*12.What is the average number of friends per student? (Your result should be just one number.) (1 point possible)*/

select sum(a.no_of_friends)/count(a.id1) as avg_no_offrnds_perstud from 
(select id1,count(id2) as no_of_friends from friend group by id1) a;


/*13.Find the number of students who are either friends with Cassandra or are friends of friends of Cassandra. Do not count Cassandra, even though technically she is a friend of a friend.*/

select count(id2) from friend where id1 in (
select id2 from friend where id1 in (select id from highschooler where name='Cassandra'))
and id1 not in (select id from highschooler where name='Cassandra')


/*14.Find the name and grade of the student(s) with the greatest number of friends. (1 point possible)*/

select name,grade from highschooler where id in(select b.id1 from(select id1,count(id2) as no_of_friends from friend group by id1) b where b.no_of_friends in
(select  max(a.no_of_friends) from(select id1,count(id2) as no_of_friends from friend group by id1) a ));

