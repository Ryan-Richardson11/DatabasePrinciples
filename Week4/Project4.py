import mysql.connector

my_username = input("Please enter your username: ")
my_password = input("Please enter your password: ")

db = mysql.connector.connect(host = "localhost", user = my_username, password = my_password, database = "MealPlanning")

cursor = db.cursor()
