import sys
from temp import DBhelper

class Solve:
    def __init__(self,path):
        #connect to database
        self.db = DBhelper() 

        response = self.db.execute_query(path)
        print(*response, sep ='\n')
    

full_path = input('ENTER the full file path: ')
obj = Solve(full_path)