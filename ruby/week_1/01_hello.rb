require 'sinatra'

get '/hello/?:name?' do
  @name = params[:name] || "World"

  "<b>Hello #@name </b>!"
end
