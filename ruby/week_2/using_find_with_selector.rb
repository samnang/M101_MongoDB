require 'mongo'

connection = Mongo::Connection.new('localhost', 27017, safe: true)
db         = connection['school']
@scores    = db['scores']

def find
  puts "find, reporting for duty"

  query = {type: 'exam'}
  selector = {fields: {student_id: 1, _id: 0}}

  begin
    iter = @scores.find(query, selector)
  rescue
    puts "Unexpected error:: %s" % $!
  end

  10.times do
    p iter.next
  end
end

def find_one()
  puts "find one, reporting for duty"

  query = {student_id: 10}

  doc = @scores.find_one(query)

  p doc
end

find_one
find
