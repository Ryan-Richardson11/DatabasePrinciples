CREATE TABLE IF NOT EXISTS FamilyMembers(
	ID int,
    MemberAge int,
    MemberName varchar(20),
    primary key (ID)
);

CREATE TABLE IF NOT EXISTS DestinationChoices(
	FamilyMemberID int,
    DestinationName varchar(20),
    DestinationZipCode int,
    primary key (DestinationZipCode),
    foreign key (FamilyMemberID) references FamilyMembers
);

CREATE TABLE IF NOT EXISTS Activities(
	FamilyMemberID int,
    Activity varchar(20),
    primary key (FamilyMemberID),
    foreign key (FamilyMemberID) references FamilyMembers
);