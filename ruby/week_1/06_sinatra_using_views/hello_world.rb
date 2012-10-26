require 'sinatra'

get '/' do
  mythings = ["apple", "orange", "banana", "peach"]

  @username = "Andrew"
  @things   = mythings

  erb :hello_world
end
