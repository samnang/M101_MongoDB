require 'sinatra'

get '/hello/?:name?' do
  @name = params[:name] || "World"

  erb '<b>Hello <%= @name %></b>!'
end
