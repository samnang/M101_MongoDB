require 'sinatra'
require 'mongo'

get '/hw1/:number' do
  connection = Mongo::Connection.new('localhost', 27017, :safe => true)

  number = params[:number].to_i

  db = connection['m101']
  collection = db['funnynumbers']

  begin
    iter = collection.find({}, limit: 1, skip: number, sort: ['value', Mongo::ASCENDING])
    iter.each{|item| return item['value'].to_i.to_s }
  rescue
    puts "Error trying to read collection: %s" % $!
  end
end
