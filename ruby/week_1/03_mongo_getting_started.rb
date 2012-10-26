require 'mongo'

mongo_connection = Mongo::Connection.new('localhost', 27017)
db               = mongo_connection['test']
names_collection = db['names']

item = names_collection.find_one()

puts item['name']
