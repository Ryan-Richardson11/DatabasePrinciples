import mysql.connector
from BusinessLayer import Business


class DatabaseConnection:

    def selectRecipeFromCookbook(self, business):

        try:
            my_username = input("Please enter your username: ")
            my_password = input("Please enter your password: ")

            db = mysql.connector.connect(
                host="localhost", user=my_username, password=my_password, database="MealPlanning")

            cursor = db.cursor()

            # Displays a list of cookbooks in the database
            cursor.callproc("SelectCookbooks")
            for cookbook in cursor.stored_results():
                cookbooks = cookbook.fetchall()
            for i in cookbooks:
                i = str(i)
                i = i.replace("(", "").replace(")", "").replace(
                    ",", "").replace("'", "")
                print(i)

            while True:
                # The user picks one of the cookbooks
                cookbook_choice = input(
                    "Please select a cookbook from this list: ")

                # Displays all recipies in the cookbook the user picked
                cursor.callproc("SelectRecipesFromCookbook", [cookbook_choice])
                for recipe in cursor.stored_results():
                    cookbook_recipes = recipe.fetchall()
                if len(cookbook_recipes) == 0:
                    print("Invalid Cookbook Name.")
                else:
                    break
            for i in cookbook_recipes:
                i = str(i)
                i = i.replace("(", "").replace(")", "").replace(
                    ",", "").replace("'", "")
                print(i)

            while True:
                # The user picks one of the cookbooks
                recipe_choice = input(
                    "Please select a recipe from this list: ")

                # Displays all ingredients in the selected recipe
                cursor.callproc("SelectIngredientsFromRecipe", [recipe_choice])
                for ingredient in cursor.stored_results():
                    recipe_ingredients = ingredient.fetchall()
                if recipe_ingredients == 0:
                    print("Invalid Recipe Name")
                else:
                    break
            for i in recipe_ingredients:
                i = str(i)
                i = i.replace("(", "").replace(")", "").replace(
                    ",", "").replace("'", "")
                print(i)

            saveRecipe = input(
                "Would you like to save this recipe to the holiday menu? (Y or N): ")
            if saveRecipe == "Y":
                courseServed = input("What course will this be served as?: ")
                business.saveCurrentRecipeToHolidayMenu(
                    recipe_choice, cookbook_choice, list(recipe_ingredients), courseServed)
                for ingredient in recipe_ingredients:
                    ingredient = str(ingredient)
                    ingredient = ingredient.replace("(", "").replace(
                        ")", "").replace(",", "").replace("'", "")
                    business.addToShoppingListFromMenu(ingredient)

            cursor.close()
            db.close()
        except mysql.connector.Error as err:
            print(f"Error: {err}")
