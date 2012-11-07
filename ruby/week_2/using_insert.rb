require 'mongo'

connection = Mongo::Connection.new('localhost', 27017, safe: true)
db         = connection['school']
@people    = db['people']

def insert
  puts "insert, reporting for duty"

  richard = {name: "Richard Kreuter", company: "10gen",
             interests: ['horses', 'skydiving', 'fencing']}    
  andrew = {_id: "erlichson", name: "Andrew Erlichson", company: "10gen",
            interests:['running', 'cycling', 'photography']}

  @people.insert(richard)
  @people.insert(andrew)


  p richard
  p andrew
rescue
  puts "Unexpected error:: %s" % $!
end

insert
