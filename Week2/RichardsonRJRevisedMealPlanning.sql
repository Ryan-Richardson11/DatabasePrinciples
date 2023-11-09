-- Account for allergy concerns in the database:

-- One way to address this could be adding another field to the ingredient table called (IsAllergyConcern) and have it as a boolean datatype with not null as it is important to know if its true or false.
-- The RecipeName can then be checked in the meal table, to see if it has an ingredient that is set to true and is of concern

-- Another way could be to get more specific with the allergy in the ingredient table. A field called (AllergyType) can be created as a varchar datatype and can allow null values.
-- This way specific types of allergies could be noted such as nut, seafood, dairy, etc.alter

-- Using the first example the creation script can be updated as follows:
DROP DATABASE IF EXISTS MealPlanning;

CREATE DATABASE MealPlanning;

USE  MealPlanning;

CREATE TABLE IF NOT EXISTS Cookbook (
CookbookName varchar(200)  not null,
IsBook bool not null,
Website varchar(200),
PRIMARY KEY ( CookbookName)
);

CREATE TABLE IF NOT EXISTS Recipe (
RecipeName varchar(100) not null,
CookbookName varchar (200) not null,
TotalServings int,
PRIMARY KEY (RecipeName),
FOREIGN KEY (CookbookName) REFERENCES Cookbook (CookbookName) on update cascade on delete cascade
);

CREATE TABLE IF NOT EXISTS Ingredients (
Id int not null auto_increment,
IngredientName varchar(100) not null,
IngredientType varchar (100),
IsAllergyConcern boolean not null,
PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS Meal (
RecipeName varchar(100) not null,
IngredientId int not null,
PRIMARY KEY (RecipeName, IngredientId),
FOREIGN KEY (RecipeName) REFERENCES Recipe (RecipeName) on update cascade on delete cascade,
FOREIGN KEY (IngredientId) REFERENCES Ingredients (Id) on update cascade on delete cascade
);

INSERT INTO Cookbook (CookbookName, IsBook) VALUES ("Dude Diet", true);
INSERT INTO Cookbook (CookbookName, IsBook) VALUES ("Dude Diet Dinner", true);
INSERT INTO Cookbook (CookbookName, IsBook, Website) VALUES ("Domesticate Me", false, "http://domesticate-me.com");

INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Fajitas", "Dude Diet", 6);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Stir Fry", "Dude Diet Dinner", 3);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Stuffing", "Domesticate Me", 8);
INSERT INTO Recipe (RecipeName, CookbookName, TotalServings) VALUES ("Chicken Stew", "Dude Diet", 4);

INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Red Pepper", "produce", false);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Green Pepper", "produce", false);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Yellow Onion", "produce", false);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Chicken", "meat", false);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Enchillada Sauce", "pantry", false);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Shredded Cheese", "dairy", true);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Garlic", "produce", false);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Soy Sauce", "condiment", false);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Butter", "dairy", true);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Sausage", "meat", false);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Golden Delicious Apple", "produce", true);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Tyme", "spice", false);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Chicken broth", "pantry", false);
INSERT INTO Ingredients (IngredientName, IngredientType, IsAllergyConcern) VALUES ("Stale bread crumbs", "pantry", false);


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

-- Finding recipes containing ingredients that are of allergy concern
Select m.RecipeName, i.IngredientName
from meal as m, ingredients as i
where m.IngredientId = i.Id and i.isAllergyConcern = True;