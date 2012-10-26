require 'sinatra'

get '/' do
  "<b>Hello World!<b>"
end

get '/testpage' do
  "This is a test page"
end
