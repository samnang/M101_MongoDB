require 'mongo'

connection = Mongo::Connection.new('localhost', 27017, safe: true)
db         = connection['school']
@people    = db['people']

def insert
  puts "insert, reporting for duty"

  doc = {
    name: "Andrew Erlichson",
    company: "10gen",
    interests: ['running', 'cycling', 'photography']
  }

  @people.insert(doc)   # first insert
  doc.delete(:_id)
  @people.insert(doc)   # second insert
rescue
  puts "Unexpected error:: %s" % $!
end

insert
