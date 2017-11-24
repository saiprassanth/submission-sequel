
/*1.Write a valid SQL statement that calculates the total weight of all corn cobs that were picked from the garden: */

select sum(pk.weight) as weight_of_corn_pkd from plant p join picked pk on p.plantid=pk.plantfk  where p.name='Corn';

/*2 For some reason Erin has change his location for picking the tomato to North. Write the corresponding query. */

update picked set locationfk=1 where plantfk=3 and gardenerFk=3;
select * from picked;

/*3 Insert a new column 'Exper' of type Number (30) to the 'gardener' table which stores  Experience of the of person. How will you modify this to varchar2(30). */

alter table gardener add exper number(30);
alter table gardener modify exper varchar2(30);

/*4 Write a query to find the plant name which required seeds less than 20 which plant on 14-APR */

select name from plant where plantid in(select plantfk from planted where extract(day from date1)=14 and extract(month from date1)=4 and seeds<20);

/*5 List the amount of sunlight and water to all plants with names that start with letter  'c' or letter 'r'. */

select name,sunlight,water from plant 
where name like'C%' or name like 'R%';

/*6 Write a valid SQL statement that displays the plant name and  the total amount of seed required for each plant that were plant in the garden. The output should be in descending order of plant name.*/ 

select p.name,sum(pl.seeds) from plant p inner join planted pl on p.plantid=pl.plantfk group by p.name order by p.name desc ;

/*7 Write a valid SQL statement that calculates the average number of items produced per seed planted for each plant type:( (Average number of items = total amount picked / total seeds planted.) */

select a.plantfk,a.totalamnt/b.totalseeds as avg_production_per_seed from (select plantfk,sum(amount) as totalamnt from picked group by plantfk) a
inner join (select plantfk,sum(seeds) as totalseeds from planted group by plantfk) b on a.plantfk=b.plantfk;

/*8 Write a valid SQL statement that would produce a result set like the following: */

        name |  name  |    date    | amount 
       ------+--------+------------+-------- 
        Tim  | Radish | 2012-07-16 |     23 
        Tim  | Carrot | 2012-08-18 |     28 


 select x.name,s.name ,x.date1 ,x.amount  from plant s inner join (select  g.name,a.plantfk,a.date1,a.amount from gardener g inner join 
(select * from  picked  where gardenerfk=2 and locationfk=0) a on g.gardenerid=a.gardenerfk) x on s.plantid=x.plantfk order by x.amount;

/*9 Find out persons who picked from the same location as he/she planted. */

select name from gardener where gardenerid in(select gardenerid  from 
(select pl.gardenerfk as gardenerid,pl.locationfk as locationid,pk.gardenerfk,pk.locationfk from planted pl inner join picked pk on pl.gardenerfk=pk.gardenerfk) 
where gardenerid=gardenerfk and locationid=locationfk group by gardenerid);

/*10 Create a view that lists all the plant names picked from all locations except ’West’ in the month of August.*/ 

select name from plant where plantid in
(select plantfk from picked 
where extract(month from date1)=8 and locationfk!=2 group by plantfk);
