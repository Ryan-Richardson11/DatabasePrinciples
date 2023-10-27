DROP DATABASE IF EXISTS spookyvacation;

CREATE DATABASE spookyvacation;

USE spookyvacation;

CREATE TABLE IF NOT EXISTS FamilyMembers(
	ID int not null auto_increment,
    MemberAge int,
    MemberName varchar(20),
    primary key (ID)
);
DROP TABLE IF EXISTS FamilyMembers;

CREATE TABLE IF NOT EXISTS DestinationChoices(
	FamilyMemberID int not null,
    DestinationName varchar(20),
    DestinationZipCode int not null,
    primary key (DestinationZipCode),
    foreign key (FamilyMemberID) references FamilyMembers (ID) on update cascade on delete cascade
);
DROP TABLE IF EXISTS DestinationChoices;

CREATE TABLE IF NOT EXISTS Activities(
	FamilyMemberID int not null,
    Activity varchar(20),
    primary key (FamilyMemberID),
    foreign key (FamilyMemberID) references FamilyMembers (ID) on update cascade on delete cascade
);
DROP TABLE IF EXISTS Activities;

INSERT INTO FamilyMembers (MemberAge, MemberName) VALUES (13, "Tommy");
INSERT INTO FamilyMembers (MemberAge, MemberName) VALUES (22, "Sam");
INSERT INTO FamilyMembers (MemberAge, MemberName) VALUES (12, "Joanne");
INSERT INTO FamilyMembers (MemberAge, MemberName) VALUES (51, "Mark");
INSERT INTO FamilyMembers (MemberAge, MemberName) VALUES (47, "Beth");
INSERT INTO FamilyMembers (MemberAge, MemberName) VALUES (75, "Mike");
INSERT INTO FamilyMembers (MemberAge, MemberName) VALUES (82, "Mary");

INSERT INTO DestinationChoices (FamilyMemberID, DestinationName, DestinationZipCode) VALUES (1, "Salem, Massachusetts", 01915);
INSERT INTO DestinationChoices (FamilyMemberID, DestinationName, DestinationZipCode) VALUES (2, "Westford, Massachusetts", 01886);
INSERT INTO DestinationChoices (FamilyMemberID, DestinationName, DestinationZipCode) VALUES (3, "Salem, New Hampshire", 03079);
INSERT INTO DestinationChoices (FamilyMemberID, DestinationName, DestinationZipCode) VALUES (4, "Tyngsborough, Massachusetts", 01879);
INSERT INTO DestinationChoices (FamilyMemberID, DestinationName, DestinationZipCode) VALUES (5, "Tyngsborough, Massachusetts", 01879);
INSERT INTO DestinationChoices (FamilyMemberID, DestinationName, DestinationZipCode) VALUES (6, "Lowell, Massachusetts", 01850);
INSERT INTO DestinationChoices (FamilyMemberID, DestinationName, DestinationZipCode) VALUES (7, "Freeport, Maine", 04013);

INSERT INTO Activities (FamilyMemberID, Activity) VALUES (1, "Ghost Tour");
INSERT INTO Activities (FamilyMemberID, Activity) VALUES (2, "Witches Woods");
INSERT INTO Activities (FamilyMemberID, Activity) VALUES (3, "Screamfest");
INSERT INTO Activities (FamilyMemberID, Activity) VALUES (4, "Trick-Or-Treating");
INSERT INTO Activities (FamilyMemberID, Activity) VALUES (5, "Pumpkin Picking");
INSERT INTO Activities (FamilyMemberID, Activity) VALUES (6, "Scary Movies");
INSERT INTO Activities (FamilyMemberID, Activity) VALUES (7, "Camping with Ghost Stories");

select * from FamilyMembers;
select * from DestinationChoices;
select * from Activities;

