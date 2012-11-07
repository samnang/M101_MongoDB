require 'mongo'

connection = Mongo::Connection.new('localhost', 27017, safe: true)
db         = connection['school']
@scores    = db['scores']

def remove_review_date
  puts "\n\nremoving all review dates"

  @scores.update({}, {'$unset' => {:review_date => 1}}, multi: true)
rescue
  puts "Unexpected error:: %s" % $!
  raise
end


# performs wholesale replacement of document
def using_save
  puts "updating record using save"

  score = @scores.find_one(student_id: 1, type: 'homework')
  puts "before: " + score.inspect

  # add a review_date
  score['review_date'] = Time.now.utc

  # update the record with convenience method
  @scores.save(score)
  score = @scores.find_one(student_id: 1, type: 'homework')
  puts "after: " + score.inspect
rescue
  puts "Unexpected error:: %s" % $!
  raise
end

# performs wholesale replacement of document
def using_update
  puts "updating record using update"

  score = @scores.find_one(student_id: 1, type: 'homework')
  puts "before: " + score.inspect

  # add a review_date
  score['review_date'] = Time.now.utc

  # update the record with update. Note that there an _id but DB is ok with that
  # because it matches what was there.
  @scores.update({student_id: 1, type: 'homework'}, score)

  score = @scores.find_one(student_id: 1, type: 'homework')
  puts "after: " + score.inspect
rescue
  puts "Unexpected error:: %s" % $!
  raise
end

def using_set
  puts "updating record using set"

  score = @scores.find_one(student_id: 1, type: 'homework')
  puts "before: " + score.inspect

  # update using set
  @scores.update({student_id: 1, type: 'homework'},
                 {'$set' => {review_date: Time.now.utc}})

  score = @scores.find_one(student_id: 1, type: 'homework')
  puts "after: " + score.inspect
rescue
  puts "Unexpected error:: %s" % $!
  raise
end

remove_review_date
using_save
remove_review_date
using_update
remove_review_date
using_set
