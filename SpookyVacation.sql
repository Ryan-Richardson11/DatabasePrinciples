DROP DATABASE IF EXISTS spookyvacation;

CREATE DATABASE spookyvacation;

USE spookyvacation;

CREATE TABLE IF NOT EXISTS FamilyMembers(
	ID int not null,
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