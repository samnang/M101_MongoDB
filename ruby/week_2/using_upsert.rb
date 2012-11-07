require 'mongo'

connection = Mongo::Connection.new('localhost', 27017, safe: true)
db         = connection['test']
@things    = db['things']

def using_upsert
  puts "updating with upsert"

  # lets remove all stuff from things
  @things.drop

  @things.update({thing: 'apple'}, {'$set' => {color: 'red'}}, upsert: true)
  @things.update({thing: 'pear'}, {color: 'green'}, upsert: true)

  apple = @things.find_one(thing: 'apple')
  puts "apple: " + apple.inspect
  pear = @things.find_one(thing: 'pear')
  puts "pear: " + pear.inspect
rescue
  puts "Unexpected error:: %s" % $!
end

using_upsert
