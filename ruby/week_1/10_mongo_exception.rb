require 'mongo'

mongo_connection = Mongo::Connection.new('localhost', 27017, :safe => true)

db = mongo_connection["test"]
users = db["users"]

j = {first_name: "Andrew", last_name: "Erlichson"}

begin
  users.insert(j)
rescue
  puts "insert failed: %s" % $!
end

puts j

begin
  users.insert(j)
rescue
  puts "insert failed: %s" % $!
end
