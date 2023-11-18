import mysql.connector

def selectRecipeFromCookbook():

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

def saveRecipeToHolidayMenu(RecipeName, CookbookName, Ingredients, courseServed):
    pass

def main():

    while True:
        print("Select which action you would like to take: ")
        print("===============================================")
        print("1. View a recipe in a cookbook")
        print("2. Get Account information and balance")
        print("3. Change PIN")
        print("4. Deposit money in account")
        print("5. Transfer money between accounts")
        print("6. Withdraw money from account")
        print("7. ATM withdrawal")
        print("8. Deposit Change")
        print("9. Close an account")
        print("10. Add monthly interest to all accounts")
        print("11. Display balance in cents")
        print("12. End Program")
        print("===============================================")

        choice = input("Enter your choice (1-11): ")

        if choice == "1":
           selectRecipeFromCookbook()

        # elif choice == "2":
            
        # elif choice == "3":
           
        # elif choice == "4":
            
        # elif choice == "5":
           
        # elif choice == "6":
            
        # elif choice == "7":
           
        # elif choice == "8":
            
        elif choice == "9":
            break
        else:
            print("Invalid choice \n")
            continue

main()
