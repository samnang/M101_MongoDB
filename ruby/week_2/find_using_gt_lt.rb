require 'mongo'

connection = Mongo::Connection.new('localhost', 27017, safe: true)
db         = connection['school']
@scores    = db['scores']

def find
  puts "find, reporting for duty"

  query = {:type => 'exam', :score => {'$gt' => 50, '$lt' => 70}}

  begin
    iter = @scores.find(query)
  rescue
    puts "Unexpected error:: %s" % $!
  end

  10.times do
    p iter.next
  end
end

find
