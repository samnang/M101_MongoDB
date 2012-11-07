require 'mongo'

connection  = Mongo::Connection.new('localhost', 27017, safe: true)
db          = connection['reddit']
@stories    = db['stories']

def find
  puts "find, reporting for duty"

  query = {'media.oembed.type' => 'video'}
  projection = {:fields => {'media.oembed.url' => 1, '_id' => 0}}

  begin
    iter = @stories.find(query, projection)
  rescue
    puts "Unexpected error:: %s" % $!
  end

  10.times do
    doc = iter.next
    break unless doc

    p doc
  end
end

find
