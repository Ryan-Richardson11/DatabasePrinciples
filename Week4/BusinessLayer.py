class Business:
    def __init__(self):
        # Initializing the holiday menu and shopping list to be updated throughout the program.
        self.holidayMenu = []
        self.shoppingList = []

    # Used to save the current recipe being viewed to the holiday menu


    def saveCurrentRecipeToHolidayMenu(self, RecipeName, CookbookName, Ingredients, courseServed):
        self.holidayMenu.append([RecipeName, CookbookName, Ingredients, courseServed])

    # Saves a recipe in the holiday menu from scratch


    def saveRecipeToHolidayMenu(self):
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

        self.holidayMenu.append(
            [RecipeName, CookbookName, IngredientsList, courseServed])

    # Appends inputed item to the shopping list


    def addToShoppingList(self):
        item = input("What item would you like to add to the shopping list?: ")
        self.shoppingList.append(item)
        print("Item added.")

    # Formats and dispays all recipes on the hoilday menu


    def diplayHolidayMenu(self):
        for meal in self.holidayMenu:
            print(f"Recipe Name: {meal[0]}")
            print(f"Cookbook Name: {meal[1]}")
            print(f"Ingredients: {meal[2]}")
            print(f"Course Served: {meal[3]}")
            print("\n")

    # Displays all items on the shopping list


    def displayShoppingList(self):
        for item in self.shoppingList:
            print(item)