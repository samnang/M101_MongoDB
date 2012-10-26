require 'sinatra'

get '/' do
  mythings = ["apple", "orange", "banana", "peach"]

  @username = "Andrew"
  @things   = mythings

  erb :hello_world
end

post '/favorite_fruit' do
  @fruit = params[:fruit]
  @fruit = "No Fruit Selected" if @fruit.nil? or @fruit.empty?

  erb :fruit_selection
end
