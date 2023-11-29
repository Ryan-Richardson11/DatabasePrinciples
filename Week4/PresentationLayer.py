from DAL import DatabaseConnection
from BusinessLayer import Business

class Presentation:

    def main():
        # Instantiates business Business() and DatabaseConnection() objects
        business = Business()
        data = DatabaseConnection()

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
                data.selectRecipeFromCookbook(business)

            elif choice == "2":
                business.addToShoppingList()

            elif choice == "3":
                business.saveRecipeToHolidayMenu()

            elif choice == "4":
                business.displayShoppingList()

            elif choice == "5":
                business.diplayHolidayMenu()

            elif choice == "6":
                break
            else:
                print("Invalid choice \n")
                continue


    main()
