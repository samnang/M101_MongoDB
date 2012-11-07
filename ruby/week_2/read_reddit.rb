require 'mongo'
require 'open-uri'
require 'json'

connection = Mongo::Connection.new('localhost', 27017, safe: true)
db         = connection['reddit']
stories    = db['stories']

reddit_page = open('http://www.reddit.com/r/technology/.json').read

parsed = JSON.parse(reddit_page) 

parsed['data']['children'].each { |item| stories.insert(item['data']) }
