import mysql.connector

def main():

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
    cursor.execute("SELECT RecipeName FROM Recipe as r WHERE r.CookbookName = %s;", (cookbook_choice,))
    cookbook_recipes = cursor.fetchall()
    for i in cookbook_recipes:
        print(i)
    # The user picks one of the cookbooks
    recipe_choice = input("Please select a recipe from this list: ")

    # Displays all ingredients in the selected recipe
    cursor.execute("SELECT IngredientName FROM meal as m, Ingredients as i WHERE m.IngredientId = i.Id and m.RecipeName = %s;", (recipe_choice,))
    recipe_ingredients = cursor.fetchall()
    for i in recipe_ingredients:
        print(i)

main()
