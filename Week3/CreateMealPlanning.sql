/* CSC6302 Database Principles
	Unit One: Database System Design
    Professor Minton
*/
    
/* This SQL script creates a new database, the MealPlanning database, and inserts some data into the database.
	This will be another example database we will be using in this course. */

-- First, lets add a database to work with, and let's use the MealPlanning set of relations. We can do this with the UI, using the "Add Schema" button, or we can write the SQL

-- Its good practice to check if the database exists before adding it, especially in a database script like this one. That way, you can run it multiple times!
DROP DATABASE IF EXISTS MealPlanning;

-- Create the database MealPlanning. Note this is the SQL Create Statement that is written for you when you use the UI to create a new schema
-- Also note that create schema is synonomous to create database in MySql. 
-- This is not true in Sql Server. It is a decision that the database engine creators decided to make.
CREATE DATABASE MealPlanning;

-- Because we are using a script, and because a script let's us execute against different databases, even in the same script, we have to tell it what database we want to use. If we want to use a different 
-- database later on, we would use another "Use" statement to indicate that. But we are going to stick to the Meal Planning Database.
USE  MealPlanning;

-- Now, we need to create the tables, which are how SQL internally stores a relation, and all the information about that relation. Notice that these create table SQL statements are very
-- similiar to our relation's schemas. Again, its a good practice to check if a table exists before creating it. We can drop tables if they currently exist. I'll show both ways in this script. The rest of the table definition should be familiar.
-- We see out relation/table name, its attributes in a comma seperated list, the domains of each attribute, and we define a primary key
--  The domain has more information then we've seen before: it talks about if an attribute can be null.

-- When I went to create the Cookbook relation, I noticed that our attribute Cookbook.Name was a poor choice, as Name is a MySql keyword.
-- Its good practice to not use keywords as attribute or table names. Also not that we are paying attention not only to our attribute domains, but if we allow nulls.
CREATE TABLE IF NOT EXISTS Cookbook (
CookbookName varchar(200)  not null,
IsBook bool not null,
Website varchar(200),
PRIMARY KEY ( CookbookName)
);

-- When i created the Recipe relation as a table, again I decided to rename some of my attrbutes. Name and Source are MySql keywords we want to avoid.
-- I also know that Cookbook.Name is referenced by Recipe.CookbookName, so let's make sure the domains/IngredientTypes match!
-- Also not that any attributes identified as a primary key or a foreign key when we designed the relations is not null! 
-- We haven't added any SQL to define those constraints, but when we do, these attributes/column must be not null!
CREATE TABLE IF NOT EXISTS Recipe (
RecipeName varchar(100) not null,
CookbookName varchar (200) not null,
TotalServings int,
PRIMARY KEY (RecipeName),
FOREIGN KEY (CookbookName) REFERENCES Cookbook (CookbookName) on update cascade on delete cascade
);

-- We had to rename some columns again, Name and IngredientType are SQL Keywords and we want to avoid that!
-- Also note the keyword auto_increment. This means that when we insert into the table, we dont have to give a value for Id, the database engine
-- will just do that for us, and our Ids will be in numerical order. This is a good practice for ensuring the values of a primary key column are unique. 
CREATE TABLE IF NOT EXISTS Ingredients (
Id int not null auto_increment,
IngredientName varchar(100) not null,
IngredientType varchar (100),
PRIMARY KEY (Id)
);

-- Two things of note here. I made sure that RecipeName had the same domain/IngredientType as Recipe.RecipeName, and our primary key can have multiple attrbutes, just like in relation algrebra
CREATE TABLE IF NOT EXISTS Meal (
RecipeName varchar(100) not null,
IngredientId int not null,
PRIMARY KEY (RecipeName, IngredientId),
FOREIGN KEY (RecipeName) REFERENCES Recipe (RecipeName) on update cascade on delete cascade,
FOREIGN KEY (IngredientId) REFERENCES Ingredients (Id) on update cascade on delete cascade
);

-- In order to query these tables, they need some data in them!

-- For our nullable columns, meaning the attributes whose domains allow nulls, we don't even need them in the insert staement, unless they have a value. The null is added for us by the database engine
INSERT INTO Cookbook (CookbookName, IsBook) VALUES ("Dude Diet", true);
INSERT INTO Cookbook (CookbookName, IsBook) VALUES ("Dude Diet Dinner", true);
INSERT INTO Cookbook (CookbookName, IsBook, Website) VALUES ("Domesticate Me", false, "http://domesticate-me.com");

INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Fajitas", "Dude Diet", 6);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Stir Fry", "Dude Diet Dinner", 3);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Stuffing", "Domesticate Me", 8);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Chicken Stew", "Dude Diet", 4);

INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Red Pepper", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Green Pepper", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Yellow Onion", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Chicken", "meat");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Enchillada Sauce", "pantry");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Shredded Cheese", "dairy");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Garlic", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Soy Sauce", "condiment");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Butter", "dairy");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Sausage", "meat");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Golden Delicious Apple", "produce");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Tyme", "spice");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Chicken broth", "pantry");
INSERT INTO Ingredients (IngredientName, IngredientType) VALUES ("Stale bread crumbs", "pantry");

INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Fajitas", 1);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Fajitas", 2);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Fajitas", 3);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Fajitas", 4);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Fajitas", 5);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Fajitas", 6);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 1);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 2);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 3);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 4);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 7);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 8);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stir Fry", 9);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stuffing",3 );
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stuffing", 10);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stuffing", 11);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stuffing", 12);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stuffing", 13);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Stuffing", 14);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chicken Stew", 1);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chicken Stew", 4);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chicken Stew", 14);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chicken Stew", 13);
INSERT INTO Meal (RecipeName, IngredientId) VALUES ("Chicken Stew", 3);

-- A function to determine if an ingredient is in the Ingredients table // Another function to see if the ingredient is already tied to a RecipeName
DROP FUNCTION IF EXISTS IsExistingIngredient;
delimiter $$
CREATE FUNCTION IsExistingIngredient (IngredientToCheck varchar(200))
RETURNS boolean deterministic
BEGIN
declare IsExisting boolean;
SET IsExisting = EXISTS
	(SELECT IngredientName
	FROM Ingredients
	WHERE IngredientName = IngredientToCheck);
return IsExisting;
END$$
delimiter ;

Select IsExistingIngredient("Butter");

DROP FUNCTION IF EXISTS IsIngredientInRecipe;
delimiter $$
CREATE FUNCTION IsIngredientInRecipe (IngredientToCheck varchar(200), RecipeToCheck varchar(100))
RETURNS boolean deterministic
BEGIN
declare IsExisting boolean;
SET IsExisting = EXISTS
	(SELECT m.RecipeName
	FROM Meal as m, Ingredients as i
	WHERE i.IngredientName = IngredientToCheck and m.RecipeName = RecipeToCheck and m.IngredientId = i.Id);
return IsExisting;
END$$
delimiter ;

-- Using stored procedure to add my favorite recipe to the database
DROP PROCEDURE IF EXISTS InsertNewRecipe;

delimiter $$
CREATE PROCEDURE InsertNewRecipe (
myRecipeName varchar(100),
myCookBookName varchar(200),
myTotalServings int,
myIsBook bool,
myWebsite varchar(200))
BEGIN

DECLARE existingCookbookName varchar(200);
DECLARE existingRecipeName varchar(100);

SELECT CookbookName INTO existingCookbookName
FROM Cookbook
WHERE CookbookName = myCookBookName;

select RecipeName into existingRecipeName
from Recipe
where RecipeName = myRecipeName;

if (existingCookbookName is null) then
insert into Cookbook (cookbookName, isBook, Website) values (myCookBookName,
myIsBook, myWebsite);
end if;

if (existingRecipeName is null) then
insert into Recipe (RecipeName, CookbookName, TotalServings) values (myRecipeName,
myCookBookName, myTotalServings);
end if;

END $$
delimiter ;

CALL InsertNewRecipe("Shepherd's Pie", "Dude Diet", 5, true, null);

-- Stored procedure to insert all needed ingredients for my favorite recipe ---------------------------------------------------------------
DROP PROCEDURE IF EXISTS InsertRecipeIngredients;

delimiter $$
CREATE PROCEDURE InsertRecipeIngredients (
myIngredientName varchar(100),
myIngredientType varchar(100),
myRecipeName varchar(100))

BEGIN
DECLARE existingIngredientId INT;

if (select IsIngredientInRecipe(myIngredientName, myRecipeName) = false) then
insert into Ingredients (IngredientName, IngredientType) values (myIngredientName, myIngredientType);

SET existingIngredientId = (SELECT Id FROM Ingredients WHERE IngredientName = myIngredientName LIMIT 1);

IF NOT EXISTS (SELECT RecipeName FROM Meal WHERE RecipeName = myRecipeName AND IngredientId = existingIngredientId) THEN
INSERT INTO Meal (RecipeName, IngredientId) VALUES (myRecipeName, existingIngredientId);

end if;
end if;
END $$
delimiter ;

CALL InsertRecipeIngredients("Potato", "produce", "Shepherd's Pie");
CALL InsertRecipeIngredients("Butter", "dairy", "Shepherd's Pie");
CALL InsertRecipeIngredients("Mixed Vegetables", "produce", "Shepherd's Pie");
CALL InsertRecipeIngredients("Ground Beef", "meat", "Shepherd's Pie");
-- Checking that the correct number of ingredients were inserted
select count(m.IngredientId) as IngredientCount, r.RecipeName, r.CookbookName
from Meal as m, Recipe as r
where m.RecipeName = r.RecipeName
group by r.RecipeName, r.CookbookName
order by IngredientCount DESC;

-- Stored procedure to take a recipe name and return all ingredients in alphabetical order
delimiter $$
CREATE PROCEDURE ReturnRecipeIngredients (
myRecipeName varchar(100))
BEGIN

SELECT i.IngredientName as RecipeIngredients
FROM ingredients as i, meal as m
WHERE m.RecipeName = myRecipeName and m.IngredientId = i.Id
order by i.IngredientName ASC; 

END $$
delimiter ;

CALL ReturnRecipeIngredients("Stir Fry");

-- View that displays all RecipeNames, their cookbooks, and their ingredients
DROP VIEW IF EXISTS RecipeInformation;

Create view RecipeInformation as
select distinct r.RecipeName, r.CookbookName, i.IngredientName
from Recipe as r, meal as m, Ingredients as i
where r.RecipeName = m.RecipeName and m.IngredientId = i.Id
order by CookbookName, RecipeName, IngredientName;

select *
from RecipeInformation;

-- Query to show number of ingredients in each Recipe
select count(m.IngredientId) as IngredientCount, r.RecipeName
from Meal as m, Recipe as r
where m.RecipeName = r.RecipeName
group by r.RecipeName
order by IngredientCount DESC;

-- Query to display what ingredients are not contained in my favorite recipe
select IngredientName as NotInFavoriteRecipe
from Ingredients
where IngredientName not in (
	select i.IngredientName
    from meal as m, Ingredients as i
    where m.RecipeName = "Shepherd's Pie" and m.IngredientId = i.Id
)
order by IngredientName ASC;








