require 'mongo'

def get_next_sequence_number(name)
  connection  = Mongo::Connection.new('localhost', 27017, safe: true)
  db          = connection['test']
  counters    = db['counters']

  # let's get ourselves a sequence number

  counter = counters.find_and_modify(query: {type: 'name'}, 
                                     update: {'$inc' => {value: 1}}, 
                                     upsert: true, new: true)

  counter['value']
end

puts get_next_sequence_number('uid')
puts get_next_sequence_number('uid')
puts get_next_sequence_number('uid')
