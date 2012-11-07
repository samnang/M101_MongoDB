require 'mongo'

connection = Mongo::Connection.new('localhost', 27017, safe: true)
db         = connection['school']
@scores    = db['scores']

def find
  puts "find, reporting for duty"

  query = {}

  cursor = @scores.find(query).skip(4)
  cursor = cursor.limit(1)

  cursor = cursor.sort(student_id: Mongo::ASCENDING, score: Mongo::DESCENDING)
  cursor.each{ |doc| p doc }
rescue
  puts "Unexpected error:: %s" % $!
end

def find_one
  puts "find one, reporting for duty"
  query = {student_id: 10}

  doc = @scores.find_one(query)

  p doc
rescue
  puts "Unexpected error:: %s" % $!
end

find
find_one
