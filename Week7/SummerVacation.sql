drop database if exists SummerVacation;
create database SummerVacation;
use SummerVacation;

create table if not exists Activity(
ActivityName varchar(100) not null,
NumPlayers int not null,
Primary Key (ActivityName)
);

insert into Activity (ActivityName, NumPlayers) values ("Hiking", 1);
insert into Activity (ActivityName, NumPlayers) values ("Mountain Biking", 2);
insert into Activity (ActivityName, NumPlayers) values ("Soccer", 22);
insert into Activity (ActivityName, NumPlayers) values ("Baseball", 18);
insert into Activity (ActivityName, NumPlayers) values ("Roller Skating", 1);
insert into Activity (ActivityName, NumPlayers) values ("Yoga", 1);
insert into Activity (ActivityName, NumPlayers) values ("Beach Volleyball", 6);
insert into Activity (ActivityName, NumPlayers) values ("Surfing", 1);
insert into Activity (ActivityName, NumPlayers) values ("Boogeyboarding", 1);
insert into Activity (ActivityName, NumPlayers) values ("Tennis", 2);
insert into Activity (ActivityName, NumPlayers) values ("Badminton", 4);
insert into Activity (ActivityName, NumPlayers) values ("Swimming", 1);
insert into Activity (ActivityName, NumPlayers) values ("Catch", 2);
insert into Activity (ActivityName, NumPlayers) values ("Bocce", 4);
insert into Activity (ActivityName, NumPlayers) values ("Croquet", 4);
insert into Activity (ActivityName, NumPlayers) values ("Cycling", 1);
insert into Activity (ActivityName, NumPlayers) values ("BBQ", 8);
insert into Activity (ActivityName, NumPlayers) values ("Tanning", 1);
insert into Activity (ActivityName, NumPlayers) values ("Camping", 2);
insert into Activity (ActivityName, NumPlayers) values ("Kayaking", 2);
insert into Activity (ActivityName, NumPlayers) values ("Paddle Boarding", 1);

create table if not exists Park(
ParkName varchar(200),
Address varchar(200),
State varchar(2),
StateId int,
ZipCode varchar(6),
Primary Key (ParkName),
Index StateIdx (State)
);

insert into Park (ParkName, Address, State, StateId, ZipCode) values ("Wells Beach", "Mile Road", "ME", 1,"43786");
insert into Park (ParkName, Address, State, StateId, ZipCode) values ("Winikini Castle", "Haverhill", "MA",2, "03867");
insert into Park (ParkName, Address, State, StateId, ZipCode) values ("Maudsley", "NewburyPort", "MA",2, "123456");
insert into Park (ParkName, Address, State, StateId, ZipCode) values ("Bradley Palmer", "Topsfield", "MA",2, "43726");
insert into Park (ParkName, Address, State, StateId, ZipCode) values ("Jigger Johnson", "Albany", "NH",3, "038541");
insert into Park (ParkName, Address, State, StateId, ZipCode) values ("Pawtuckaway", "Nottingham", "NH",3, "03290");
insert into Park (ParkName, Address, State, StateId, ZipCode) values ("Bear Brook", "Allenstiown", "NH",3, "03287");
insert into Park (ParkName, Address, State, StateId, ZipCode) values ("Gilette Stadium", "Foxboro", "MA",2, "04842");
insert into Park (ParkName, Address, State, StateId, ZipCode) values ("Fenway Park", "Boston", "MA",2, "53856");


create table if not exists SummerPlan(
Id int auto_increment not null,
ActivityName varchar(100),
ParkName varchar(200),
Primary Key (Id),
Foreign Key (ActivityName) references  Activity (ActivityName) on update cascade on delete cascade,
Foreign Key (ParkName) references  Park (Parkname) on update cascade on delete cascade
);

insert into SummerPlan (ActivityName, ParkName) values ("Hiking", "Bear Brook");
insert into SummerPlan (ActivityName, ParkName) values ("Mountain Biking", "Bear Brook");
insert into SummerPlan (ActivityName, ParkName) values ("Camping", "Bear Brook");
insert into SummerPlan (ActivityName, ParkName) values ("Kayaking", "Bear Brook");
insert into SummerPlan (ActivityName, ParkName) values ("Paddle Boarding", "Bear Brook");
insert into SummerPlan (ActivityName, ParkName) values ("Tanning", "Bear Brook");
insert into SummerPlan (ActivityName, ParkName) values ("BBQ", "Bear Brook");
insert into SummerPlan (ActivityName, ParkName) values ("Swimming", "Bear Brook");
insert into SummerPlan (ActivityName, ParkName) values ("Roller Skating", "Bear Brook");
insert into SummerPlan (ActivityName, ParkName) values ("Yoga", "Bear Brook");
insert into SummerPlan (ActivityName, ParkName) values ("Catch", "Bear Brook");

insert into SummerPlan (ActivityName, ParkName) values ("Hiking", "Pawtuckaway");
insert into SummerPlan (ActivityName, ParkName) values ("Mountain Biking", "Pawtuckaway");
insert into SummerPlan (ActivityName, ParkName) values ("Camping", "Pawtuckaway");
insert into SummerPlan (ActivityName, ParkName) values ("Kayaking", "Pawtuckaway");
insert into SummerPlan (ActivityName, ParkName) values ("Paddle Boarding", "Pawtuckaway");
insert into SummerPlan (ActivityName, ParkName) values ("Tanning", "Pawtuckaway");
insert into SummerPlan (ActivityName, ParkName) values ("BBQ", "Pawtuckaway");
insert into SummerPlan (ActivityName, ParkName) values ("Swimming", "Pawtuckaway");
insert into SummerPlan (ActivityName, ParkName) values ("Roller Skating", "Pawtuckaway");
insert into SummerPlan (ActivityName, ParkName) values ("Yoga", "Pawtuckaway");
insert into SummerPlan (ActivityName, ParkName) values ("Catch", "Pawtuckaway");

insert into SummerPlan (ActivityName, ParkName) values ("Hiking", "Winikini Castle");
insert into SummerPlan (ActivityName, ParkName) values ("Mountain Biking", "Winikini Castle");
insert into SummerPlan (ActivityName, ParkName) values ("Tanning", "Winikini Castle");
insert into SummerPlan (ActivityName, ParkName) values ("BBQ", "Winikini Castle");
insert into SummerPlan (ActivityName, ParkName) values ("Roller Skating", "Winikini Castle");
insert into SummerPlan (ActivityName, ParkName) values ("Yoga", "Winikini Castle");
insert into SummerPlan (ActivityName, ParkName) values ("Catch", "Winikini Castle");
insert into SummerPlan (ActivityName, ParkName) values ("Tennis", "Winikini Castle");

insert into SummerPlan (ActivityName, ParkName) values ("Hiking", "Maudsley");
insert into SummerPlan (ActivityName, ParkName) values ("Mountain Biking", "Maudsley");
insert into SummerPlan (ActivityName, ParkName) values ("Tanning", "Maudsley");
insert into SummerPlan (ActivityName, ParkName) values ("BBQ", "Maudsley");
insert into SummerPlan (ActivityName, ParkName) values ("Yoga", "Maudsley");
insert into SummerPlan (ActivityName, ParkName) values ("Catch", "Maudsley");

insert into SummerPlan (ActivityName, ParkName) values ("Hiking", "Bradley Palmer");
insert into SummerPlan (ActivityName, ParkName) values ("Mountain Biking", "Bradley Palmer");
insert into SummerPlan (ActivityName, ParkName) values ("Tanning", "Bradley Palmer");
insert into SummerPlan (ActivityName, ParkName) values ("BBQ", "Bradley Palmer");
insert into SummerPlan (ActivityName, ParkName) values ("Yoga", "Bradley Palmer");
insert into SummerPlan (ActivityName, ParkName) values ("Catch", "Bradley Palmer");
insert into SummerPlan (ActivityName, ParkName) values ("Bocce", "Bradley Palmer");
insert into SummerPlan (ActivityName, ParkName) values ("Croquet", "Bradley Palmer");
insert into SummerPlan (ActivityName, ParkName) values ("Tennis", "Bradley Palmer");
insert into SummerPlan (ActivityName, ParkName) values ("Cycling", "Bradley Palmer");

insert into SummerPlan (ActivityName, ParkName) values ("Swimming", "Wells Beach");
insert into SummerPlan (ActivityName, ParkName) values ("Kayaking", "Wells Beach");
insert into SummerPlan (ActivityName, ParkName) values ("Yoga", "Wells Beach");
insert into SummerPlan (ActivityName, ParkName) values ("Tanning", "Wells Beach");
insert into SummerPlan (ActivityName, ParkName) values ("Paddle Boarding", "Wells Beach");
insert into SummerPlan (ActivityName, ParkName) values ("Surfing", "Wells Beach");
insert into SummerPlan (ActivityName, ParkName) values ("Boogeyboarding", "Wells Beach");
insert into SummerPlan (ActivityName, ParkName) values ("Beach Volleyball", "Wells Beach");
insert into SummerPlan (ActivityName, ParkName) values ("Catch", "Wells Beach");
insert into SummerPlan (ActivityName, ParkName) values ("Bocce", "Wells Beach");
insert into SummerPlan (ActivityName, ParkName) values ("Badminton", "Wells Beach");
insert into SummerPlan (ActivityName, ParkName) values ("Croquet", "Wells Beach");


insert into SummerPlan (ActivityName, ParkName) values ("Camping", "Jigger Johnson");
insert into SummerPlan (ActivityName, ParkName) values ("Swimming", "Jigger Johnson");
insert into SummerPlan (ActivityName, ParkName) values ("Catch", "Jigger Johnson");
insert into SummerPlan (ActivityName, ParkName) values ("Bocce", "Jigger Johnson");
insert into SummerPlan (ActivityName, ParkName) values ("Badminton", "Jigger Johnson");
insert into SummerPlan (ActivityName, ParkName) values ("Roller Skating", "Jigger Johnson");
insert into SummerPlan (ActivityName, ParkName) values ("Cycling", "Jigger Johnson");
insert into SummerPlan (ActivityName, ParkName) values ("BBQ", "Jigger Johnson");
insert into SummerPlan (ActivityName, ParkName) values ("Tanning", "Jigger Johnson");

insert into SummerPlan (ActivityName, ParkName) values ("Soccer", "Gilette Stadium");

insert into SummerPlan (ActivityName, ParkName) values ("Baseball", "Fenway Park");
insert into SummerPlan (ActivityName, ParkName) values ("Catch", "Fenway Park");

-- Nested select statements to find all activities not in these parks (Query 1)
explain analyze
select distinct s.ActivityName
from SummerPlan as s
where s.ActivityName not in (
	select s.Activityname 
    from SummerPlan as s
    where s.ParkName = "Bear Brook" or s.ParkName = "Pawtuckaway" 
		or s.ParkName = "Bradley Palmer"
);

-- Nested statements unnesssarily joining through foreign keys on a different table. (Query 2)
explain analyze
select distinct a.ActivityName
from Activity as a
where a.ActivityName not in (
	select a.ActivityName
	from Activity as a
	join SummerPlan as s on s.ActivityName = a.ActivityName
    where s.ParkName = "Bear Brook" or s.ParkName = "Pawtuckaway" 
		or s.ParkName = "Bradley Palmer"
);

-- Uses a tuple and selects all ActivityNames that are not associated with the given parks. (Query 3)
explain analyze
select distinct a.ActivityName
from Activity as a
where not exists (
    select s.ActivityName
    from SummerPlan as s
    where s.ActivityName = a.ActivityName
      and s.ParkName in ("Bear Brook", "Pawtuckaway", "Bradley Palmer")
);

-- Activities in Massachussets parks with four players (With and without State index)
explain analyze
select distinct s.ActivityName
from SummerPlan as s
join Park as p on s.ParkName = p.ParkName 
join Activity as a on s.ActivityName = a.ActivityName
Where p.State = "MA" and a.NumPlayers = 4;

-- Activities that can be done while camping at a park
Select ParkName, ActivityName
from SummerPlan as s
Where ParkName in ("Bear Brook", "Pawtuckaway", "Jigger Johnson") and s.ActivityName != "Camping";

-- What water activities I can do this weekend and where
Select s.ParkName, s.ActivityName
From SummerPlan as s
Where s.ActivityName in ("Kayaking", "Paddle Boarding", "Swimming", "Surfing", "Boogeyboarding");

-- Where I can watch other people play a sport
Select s.ParkName, s.ActivityName
From SummerPlan as s
Where s.ParkName in ("Gilette Stadium", "Fenway Park");

-- A query where its execution plan contains a file scan
Select *
From SummerPlan;
-- A query where its execution plan contains a index scan
Select *
From Park as p
Where p.State = "NH";
-- A query where its execution plan contains a clustered index scan
Select *
From SummerPlan as s
Where s.ActivityName = "Yoga";
-- A query where its execution plan contains a non-clustered index scan
Select *
From SummerPlan as s
Where s.ParkName = "Bear Brook";



























