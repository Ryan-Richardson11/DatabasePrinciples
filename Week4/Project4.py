import mysql.connector

# Initializing the holiday menu and shopping list to be updated throughout the program.
holidayMenu = []
shoppingList = []


def selectRecipeFromCookbook():

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
            print(i)
        while True:
            # The user picks one of the cookbooks
            cookbook_choice = input("Please select a cookbook from this list: ")

            # Displays all recipies in the cookbook the user picked
            cursor.callproc("SelectRecipesFromCookbook", [cookbook_choice])
            for recipe in cursor.stored_results():
                cookbook_recipes = recipe.fetchall()
            if len(cookbook_recipes) == 0:
                print("Invalid Cookbook Name.")
            else:
                break
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
            saveCurrentRecipeToHolidayMenu(recipe_choice, cookbook_choice, list(
                recipe_ingredients), courseServed)

        cursor.close()
        db.close()
    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Used to save the current recipe being viewed to the holiday menu


def saveCurrentRecipeToHolidayMenu(RecipeName, CookbookName, Ingredients, courseServed):
    holidayMenu.append([RecipeName, CookbookName, Ingredients, courseServed])

# Saves a recipe in the holiday menu from scratch


def saveRecipeToHolidayMenu():
    RecipeName = input("Enter the recipe name: ")
    CookbookName = input("Enter the cookbook name: ")
    IngredientsList = []
    while True:
        Ingredients = input(
            "Keep entering ingredients until complete (0 to stop): ")
        if Ingredients == "0":
            break
        else:
            IngredientsList.append(Ingredients)
    courseServed = input("Enter the course it is served: ")

    holidayMenu.append(
        [RecipeName, CookbookName, IngredientsList, courseServed])

# Appends inputed item to the shopping list


def addToShoppingList():
    item = input("What item would you like to add to the shopping list?: ")
    shoppingList.append(item)
    print("Item added.")

# Formats and dispays all recipes on the hoilday menu


def diplayHolidayMenu(holidayMenu):
    for meal in holidayMenu:
        print(f"Recipe Name: {meal[0]}")
        print(f"Cookbook Name: {meal[1]}")
        print(f"Ingredients: {meal[2]}")
        print(f"Course Served: {meal[3]}")
        print("\n")

# Displays all items on the shopping list


def displayShoppingList(shoppingList):
    for item in shoppingList:
        print(item)


def main():

    while True:
        print("Select which action you would like to take: ")
        print("===============================================")
        print("1. View a recipe in a cookbook")
        print("2. Add an item to the shopping list")
        print("3. Add a recipe to the holiday menu")
        print("4. Display shopping list")
        print("5. Display holiday menu")
        print("6. Terminate Program")
        print("===============================================")

        choice = input("Enter your choice (1-6): ")

        if choice == "1":
            selectRecipeFromCookbook()

        elif choice == "2":
            addToShoppingList()

        elif choice == "3":
            saveRecipeToHolidayMenu()

        elif choice == "4":
            displayShoppingList(shoppingList)

        elif choice == "5":
            diplayHolidayMenu(holidayMenu)

        elif choice == "6":
            break
        else:
            print("Invalid choice \n")
            continue


main()
