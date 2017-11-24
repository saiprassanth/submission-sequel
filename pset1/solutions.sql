/*1.list full details of all hotels:*/
    
select * from hotel;

/*2.list full setails of all hotels in new york;*/

select * from hotel where city='new york';

/*3.List the names and cities of all guests, ordered according to their cities:*/

select name,city from guests order by city;

/*4. List all details for non-smoking rooms in ascending order of price.*/

select * from room where type='n' order by price;

/*5.List the number of hotels there are.*/

select count(hotel_no) as total_no_of_hotels from hotel;

/*6. List the cities in which guests live. Each city should be listed only once*/

select city from guests group by city;

/*7. List the average price of a room.*/

select room_no,price as average_price from room;

/*8.List hotel names, their room numbers, and the type of that room.*/

select name,room_no,type from room inner join hotel on hotel.hotel_no=room.hotel_no;

/*9. List the hotel names, booking dates, and room numbers for all hotels in New York*/

select name,room_no,date_from,date_to from booking inner join hotel on booking.hotel_no=hotel.hotel_no where hotel.city='new york';  

/*10. What is the number of bookings that started in the month of September?*/

select count(date_from) as no_of_bookings_in_september from booking where extract(month from date_from)=09; 

/*11. List the names and cities of guests who began a stay in New York in August.*/

select s.name,s.city from (select b.hotel_no,g.name,g.city from guests g inner join booking b on g.guest_no=b.guest_no where extract(month from date_from)=08) s 
join hotel h on s.hotel_no=h.hotel_no where h.city='new york'; 

/*12. List the hotel names and room numbers of any hotel rooms that have not been booked*/

select h.name,s.room_no from hotel h inner join (select room_no,hotel_no from room where room_no not in(select room_no from booking)) s on
h.hotel_no=s.hotel_no;

/*13. List the hotel name and city of the hotel with the highest priced room.*/

select name,city from hotel where hotel_no in(select hotel_no from 
(select hotel_no, max(price)as max from room group by hotel_no order by max desc) where rownum=1);

/*14. List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.*/

select h.name,r.room_no,h.city,r.price from hotel h inner join room r on h.hotel_no=r.hotel_no 
where r.price<(select min(price) from room where hotel_no 
in(select hotel_no from hotel where city='boston'));

/*15. List the average price of a room grouped by city*/

select city,avg(price) as average_price from (select * from hotel h inner join room r on h.hotel_no=r.hotel_no) group by city; 


