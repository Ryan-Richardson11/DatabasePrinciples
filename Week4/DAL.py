import mysql.connector
from BusinessLayer import Business

class DatabaseConnection:

    def selectRecipeFromCookbook(self):

        try:
            my_username = input("Please enter your username: ")
            my_password = input("Please enter your password: ")

            db = mysql.connector.connect(
                host="localhost", user= my_username, password= my_password, database="MealPlanning")

            cursor = db.cursor()

            # Displays a list of cookbooks in the database
            cursor.callproc("SelectCookbooks")
            for cookbook in cursor.stored_results():
                cookbooks = cookbook.fetchall()
            for i in cookbooks:
                print(i)
            # The user picks one of the cookbooks
            cookbook_choice = input("Please select a cookbook from this list: ")

            # Displays all recipies in the cookbook the user picked
            cursor.callproc("SelectRecipesFromCookbook", [cookbook_choice])
            for recipe in cursor.stored_results():
                cookbook_recipes = recipe.fetchall()
            for i in cookbook_recipes:
                print(i)
            # The user picks one of the cookbooks
            recipe_choice = input("Please select a recipe from this list: ")

            # Displays all ingredients in the selected recipe
            cursor.callproc("SelectIngredientsFromRecipe", [recipe_choice])
            for ingredient in cursor.stored_results():
                recipe_ingredients = ingredient.fetchall()
            for i in recipe_ingredients:
                print(i)

            saveRecipe = input(
                "Would you like to save this recipe to the holiday menu? (Y or N): ")
            if saveRecipe == "Y":
                courseServed = input("What course will this be served as?: ")
                Business.saveCurrentRecipeToHolidayMenu(recipe_choice, cookbook_choice, list(
                    recipe_ingredients), courseServed)

            cursor.close()
            db.close()
        except mysql.connector.Error as err:
            print(f"Error: {err}")
