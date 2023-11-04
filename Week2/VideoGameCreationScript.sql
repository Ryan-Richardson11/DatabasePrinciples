/* CSC6302 Database Principles
	Unit Two: Basic SQL
    Professor Minton
*/

DROP DATABASE IF EXISTS VideoGameSystems;
CREATE DATABASE VideoGameSystems;

USE VideoGameSystems;

CREATE TABLE IF NOT EXISTS Console(
ConsoleName varchar(100) not null,
ReleaseDate Date not null,
Developer varchar(200) not null,
SystemRevision double not null,
Primary Key (ConsoleName),
CONSTRAINT ValidConsoleReleaseDate CHECK (ReleaseDate BETWEEN "1975-08-12" and "2022-02-02")
);

INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Atari", "1975-08-12", "Atari, Inc", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Atari 2600", "1977-12-01", "Atari, Inc", 2.07);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Nintendo Entertainment System", "1983-07-15", "Nintendo", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Sega Genesis", "1988-10-29", "Sega", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Game Gear", "1990-10-06", "Sega", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Sega Saturn", "1988-08-12", "Sega", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Sega Dreamcast", "1998-11-27", "Sega", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("SG-100", "1983-07-15", "Sega", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Master System", "1985-010-06", "Sega", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Sega CD", "1991-12-12", "Sega", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Game Boy", "1975-08-12", "Nintendo", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Game Boy Color", "1975-08-12", "Nintendo", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Super Nintendo", "1990-11-21", "Nintendo", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Nintendo 64", "1996-07-23", "Nintendo", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Game Cube", "2001-11-05", "Nintendo", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Wii", "2006-11-19", "Nintendo", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Wii U", "2012-11-18", "Nintendo", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Game Boy Advance", "1975-08-12", "Nintendo", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Switch", "2017-03-03", ",Nintendo", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Nintendo 3DS", "2010-06-12", "Nintendo", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Nintendo DS", "2004-08-12", "Nintendo", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Play Station", "1994-12-03", "Sony", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Play Station 2", "2000-12-28", "Sony", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Play Station 3", "2006-11-11", "Sony", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Play Station 4", "2013-02-20", "Sony", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Play Station 5", "2020-11-12", "Sony", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("Play Station Portable", "2004-12-12", "Sony", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("XBox", "2001-11-15", "Microsoft", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("XBox 360", "2005-11-15", "Microsoft", 4.01);
INSERT INTO Console (ConsoleName, ReleaseDate, Developer, SystemRevision) VALUES ("XBox One", "2016-06-13", "Microsoft", 4.01);

CREATE TABLE IF NOT EXISTS Series(
Id int auto_increment not null,
SeriesName varchar(200) not null,
PRIMARY KEY (Id)
);

INSERT INTO Series (SeriesName) VALUES ("Animal Crossing");
INSERT INTO Series (SeriesName) VALUES ("Yoshi");
INSERT INTO Series (SeriesName) VALUES ("Final Fantasy");
INSERT INTO Series (SeriesName) VALUES ("Call of Duty");
INSERT INTO Series (SeriesName) VALUES ("Kingdom Hearts");
INSERT INTO Series (SeriesName) VALUES ("Sonic");
INSERT INTO Series (SeriesName) VALUES ("Spyro");
INSERT INTO Series (SeriesName) VALUES ("Gears of War");

CREATE TABLE  IF NOT EXISTS Game(
Id int not null auto_increment,
GameName varchar(200) not null,
ReleaseDate Date not null,
ConsoleName varchar(100) not null,
Series int,
NumPlayers int,
IsOnline bool,
PRIMARY KEY (Id),
FOREIGN KEY (ConsoleName) REFERENCES Console (ConsoleName)
 ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (Series) REFERENCES Series (Id),
CONSTRAINT ValidGameReleaseDate CHECK (ReleaseDate BETWEEN "1975-08-12" and "2022-02-02")
);

INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Animal Crossing", "2001-04-14", "Nintendo 64", 1);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Wild World", "2005-11-15", "Nintendo DS", 1);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("City Folk", "2011-11-09", "Wii", 1);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("New Leaf", "2013-06-12", "Nintendo 3DS", 1);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Happy Home Designer", "2015-07-05", "Nintendo 3DS", 1);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Amiibo Festival", "2015-11-13", "Wii U", 1);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, IsOnline, Series) VALUES ("New Horizons", "2020-03-20", "Switch", true, 1);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, IsOnline, Series) VALUES ("New Horizons Happy Home Paradise", "2021-11-05", "Switch", true, 1);

INSERT INTO Game (GameName, ReleaseDate, ConsoleName) VALUES ("Yoshi", "1991-04-01", "Nintendo Entertainment System");
INSERT INTO Game (GameName, ReleaseDate, ConsoleName) VALUES ("Yoshi's Cookie", "1992-06-23", "Nintendo Entertainment System");
INSERT INTO Game (GameName, ReleaseDate, ConsoleName) VALUES ("Yoshi's Safari", "1995-01-21", "Super Nintendo");
INSERT INTO Game (GameName, ReleaseDate, ConsoleName) VALUES ("Yoshi's Island", "1995-11-19", "Super Nintendo");
INSERT INTO Game (GameName, ReleaseDate, ConsoleName) VALUES ("Yoshi's Story", "1997-04-07", "Nintendo 64");
INSERT INTO Game (GameName, ReleaseDate, ConsoleName) VALUES ("Yoshi's Universal Gravitation", "2004-11-09", "Game Boy Advance");
INSERT INTO Game (GameName, ReleaseDate, ConsoleName) VALUES ("Yoshi Touch and Go", "2005-12-27", "Nintendo DS");
INSERT INTO Game (GameName, ReleaseDate, ConsoleName) VALUES ("Yoshi's Wooly World", "2015-06-15", "Wii U");
INSERT INTO Game (GameName, ReleaseDate, ConsoleName) VALUES ("Yoshi's Island", "2016-11-13", "Nintendo DS");
INSERT INTO Game (GameName, ReleaseDate, ConsoleName) VALUES ("Poochy and Yoshi's Wooly World", "1991-11-09", "Nintendo 3DS");
INSERT INTO Game (GameName, ReleaseDate, ConsoleName) VALUES ("Yoshi's Crafted World", "2019-03-29", "Switch");

INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty", "2003-10-29", "XBox 360", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty", "2003-10-29", "Play Station 3", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty 2", "2005-10-25", "XBox 360", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty 3", "2006-11-07", "Play Station 2", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty 3", "2006-11-07", "Play Station 3", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty 3", "2006-11-07", "Wii", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty 3", "2006-11-07", "XBox", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty 3", "2006-11-07", "XBox 360", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty 4", "2006-11-07", "Nintendo DS", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty 4: Modern Warfare", "2007-11-06", "XBox", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty 4: Modern Warfare", "2007-11-06", "Play Station 3", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty 4: Modern Warfare", "2007-11-06", "Wii", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty: World at War", "2011-11-11", "XBox 360", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty: World at War", "2011-11-11", "Nintendo DS", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty: World at War", "2011-11-11", "Play Station 3", 4);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Call of Duty: World at War", "2011-11-11", "Wii", 4);

INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Sonic the Hedgehog", "1991-11-09", "Sega Genesis", 6);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Sonic the Hedgehog 2", "1992-11-09", "Sega Genesis", 6);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Sonic the Hedgehog 3", "1994-11-21", "Sega Genesis", 6);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Sonic Adventures", "1991-11-09", "Sega Dreamcast", 6);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Sonic Adventure 2 Battle", "1998-11-13", "Game Cube", 6);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Sonic Heroes", "2003-11-09", "Play Station 2", 6);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Sonic Heroes", "2003-11-09", "XBox", 6);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Sonic Heroes", "2003-11-09", "Game Cube", 6);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Sonic Unleashed", "2008-06-29", "Play Station 2", 6);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Sonic Unleashed", "2008-06-29", "Wii", 6);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Sonic Unleashed", "2008-06-29", "XBox 360", 6);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Sonic Unleashed", "2008-06-29", "Play Station 3", 6);

INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Spyro the Dragon", "1998-09-09", "Play Station", 7);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Spyro's Adventure", "2011-10-13", "Wii", 7);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Spyro's Adventure", "2011-10-13", "Nintendo DS", 7);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Spyro's Adventure", "2011-10-13", "Play Station 3", 7);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Spyro's Adventure", "2011-10-13", "Wii U", 7);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Spyro's Adventure", "2011-10-13", "XBox 360", 7);

-- Inserting my favorite video game series
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Gears of War 1", "2006-11-07", "Xbox 360", 8);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Gears of War 2", "2008-11-07", "Xbox 360", 8);
INSERT INTO Game (GameName, ReleaseDate, ConsoleName, Series) VALUES ("Gears of War 3", "2011-09-20", "Xbox One", 8);

-- Games released on the first console I ever owned (Game Boy Advance)
SELECT GameName
FROM Game
WHERE ConsoleName = "Game Boy Advance";

-- Updating NumPlayers for four games
UPDATE Game
SET NumPlayers = 100
WHERE GameName = "Gears of War 1";

UPDATE Game
SET NumPlayers = 2100
WHERE GameName = "Gears of War 2";

UPDATE Game
SET NumPlayers = 6500
WHERE GameName = "Gears of War 3";

UPDATE Game
SET NumPlayers = 450
WHERE GameName = "Call of Duty: World at War";

-- Games released on consoles released before 2000 *********************************
SELECT GameName, g.ConsoleName
FROM Game AS g
JOIN Console AS c ON g.ConsoleName = c.ConsoleName
WHERE c.ReleaseDate < '2000-01-01';

Select GameName, g.ConsoleName
from Game as g, Console as c
WHere g.ConsoleName = c.ConsoleName and c.ReleaseDate < '2000-01-01';
-- Games, consoles, and series released between January 1, 1995 and January 1, 2018

-- Count of games released on a Playstation console

-- Games not released on a PlayStation console

-- Update game release constraint to prior to November, 2023

-- Insert a game released in 2023 into the database






























