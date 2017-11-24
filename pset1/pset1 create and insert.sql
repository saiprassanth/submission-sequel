/*saiprassanth.ramesh@accenture.com*/

/*24nov2017*/

/*problem_set1 create and insert*/

create table hotel(hotel_no varchar2(5),name varchar2(20),city varchar2(10),constraint pk_hotel primary key(hotel_no));
create table room(room_no number,hotel_no varchar2(5),type varchar2(1),price number(7,2),constraint pk_room primary key(room_no),constraint fk_room foreign key(hotel_no) references hotel(hotel_no));
create table guests(guest_no varchar2(5),name varchar2(20),city varchar2(20),constraint pk_guest primary key(guest_no));
create table booking(hotel_no varchar2(5),guest_no varchar2(5),date_from date,date_to date,room_no number,constraint fk1_booking foreign key(hotel_no) references hotel(hotel_no),constraint fk2_booking foreign key(guest_no) references guests(guest_no),constraint fk3_booking foreign key(room_no) references room(room_no));



insert into hotel values('H111','empire hotel','new york');
insert into hotel values('H235','park place','new york');
insert into hotel values('H432','brownstone hotel','toronto');
insert into hotel values('H498','james plaza','toronto');
insert into hotel values('H193','devon hotel','boston');
insert into hotel values('H437','clairmont hotel','boston');



insert into room values(313,'H111','s',145.00);
insert into room values(412,'H111','n',145.00);
insert into room values(1267,'H235','n',175.00);
insert into room values(1289,'H235','n',195.00);
insert into room values(876,'H432','s',124.00);
insert into room values(898,'H432','s',124.00);
insert into room values(345,'H498','n',160.00);
insert into room values(467,'H498','n',180.00);
insert into room values(1001,'H193','s',150.00);
insert into room values(1201,'H193','n',175.00);
insert into room values(257,'H437','n',140.00);
insert into room values(223,'H437','n',155.00);





insert into guests values('G256','adam wayne','pittsburgh');
insert into guests values('G367','tara cummings','baltimore');
insert into guests values('G879','venessa parry','pittsburgh');
insert into guests values('G230','tom hancock','philadelphia');
insert into guests values('G467','robert swift','atlanta');
insert into guests values('G190','edward cane','baltimore');





insert into booking values('H111','G256','10-AUG-99','15-AUG-99',412);
insert into booking values('H111','G367','18-aug-99','21-aug-99',412);
insert into booking values('H235','G879','05-sep-99','12-sep-99',1267);
insert into booking values('H498','G230','15-sep-99','18-sep-99',467);
insert into booking values('H498','G256','30-nov-99','02-dec-99',345);
insert into booking values('H498','G467','03-nov-99','05-nov-99',345);
insert into booking values('H193','G190','15-nov-99','19-nov-99',1001);
insert into booking values('H193','G367','12-sep-99','14-sep-99',1001);
insert into booking values('H193','G367','01-oct-99','06-oct-99',1201);
insert into booking values('H437','G190','04-oct-99','06-oct-99',223);
insert into booking values('H437','G879','14-sep-99','17-sep-99',223);