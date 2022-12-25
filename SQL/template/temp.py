import mysql.connector
import sys

class DBhelper:

    def __init__(self):
        self.name_of_database = "leetcode"
        try:
            self.conn = mysql.connector.connect(host = "localhost", user ="root", password="", database = self.name_of_database)
            self.mycursor = self.conn.cursor()
        except:
            print("Some error occured. Could not connect to database.")
            sys.exit(0) #Let's say 0 is error for data-base error
        else:
            print("Connected to Database")
    
    def execute_query(self,path):
        f = open(path, 'r')
        sql_contents = f.read()
        self.mycursor.execute(sql_contents)
        data = self.mycursor.fetchall()
        return data
    
    def select_database(self, databaseName):
        self.name_of_database = databaseName

















# Import the mysql.connector module in your Python file:
# import mysql.connector

# Establish a connection to the MySQL database using the mysql.connector.connect() function:
# cnx = mysql.connector.connect(user='root', password='', host='locolhost', database='sample')
# cnx = mysql.connector.connect(host = "locolhost", user ="root", password="", database = "hit-db-demo")
# Open the SQL file in read mode using the open() function:
# f = open(r'C:\Users\ek440\Desktop\New folder\code\SQL\leetcode\sample.sql', 'r')

# sql_contents = f.read()

# cursor = cnx.cursor()
# cursor.execute(sql_contents)




































# import mysql.connector
# import sys

# with open("C:\Users\ek440\Desktop\New folder\code\SQL\leetcode\sample.sql", "r") as file:
#   text = file.read()

# print(text)

# class DBhelper:

#     def __init__(self):
#         try:
#             self.conn = mysql.connector.connect(host = "localhost", user ="root", password="", database = "hit-db-demo")
#             self.mycursor = self.conn.cursor()
#         except:
#             print("Some error occured. Could not connect to database.")
#             sys.exit(0) #Let's say 0 is error for data-base error
#         else:
#             print("Connected to Database")
    
#     def register(self, name, email, password):
#         try:
#             self.mycursor.execute(f"""
#             INSERT INTO `user` (`id`, `name`, `email`, `password`) VALUES (NULL, '{name}', '{email}', '{password}'); 
#             """)
#             self.conn.commit() #for any write operation i.e update, delete, create
#         except:
#             return -1
#         else:
#             return 1 
    
#     #This is read query
#     def search(self, email, password):
#         self.mycursor.execute(f"""
#         query
#         """)

#         data = self.mycursor.fetchall()

#         return data