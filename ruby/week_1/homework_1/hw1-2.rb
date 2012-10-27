require 'mongo'

connection = Mongo::Connection.new('localhost', 27017, :safe => true)

db = connection['m101']
collection = db['funnynumbers']

magic = 0

begin
  iter = collection.find()
  iter.each do |item|
    magic = magic + item['value'] if (item['value'] % 3).zero?
  end
rescue
  puts "Error trying to read collection: %s" % $!
end

puts "The answer to Homework One, Problem 2 is %d" % magic
