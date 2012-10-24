import pymongo

from pymongo import Connection
connection = Connection('localhost', 27017)

db = connection.test
names_collection = db.names

item = names_collection.find_one()

print item['name']
