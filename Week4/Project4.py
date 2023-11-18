import mysql.connector

my_username = input("Please enter your username: ")
my_password = input("Please enter your password: ")

db = mysql.connector.connect(host = "localhost", user = my_username, password = my_password, database = "MealPlanning")

cursor = db.cursor()

# Displays a list of cookbooks in the database
cursor.execute("SELECT CookbookName FROM Cookbook;")
cookbooks = cursor.fetchall()
for i in cookbooks:
    print(i)
# The user picks one of the cookbooks
cookbook_choice = input("Please select a cookbook from this list: ")

# Displays all recipies in the cookbook the user picked
cursor.execute("SELECT RecipeName FROM Recipe as r Where r.CookbookName = %s;", (cookbook_choice,))
cookbook_recipes = cursor.fetchall()
for i in cookbook_recipes:
    print(i)