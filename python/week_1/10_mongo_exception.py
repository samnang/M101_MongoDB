import pymongo
import sys

connection = pymongo.Connection("mongodb://localhost", safe=True)

db = connection.test
users = db.users

j = {"first_name": "Andrew", "last_name": "Erlichson"}

try:
    users.insert(j)
except:
    print "insert failed:", sys.exc_info()[0]

print j

try:
    users.insert(j)
except:
    print "insert failed:", sys.exc_info()[0]
