require 'mongo'

mongo_connection = Mongo::Connection.new('localhost', 27017, :safe => true)

db = mongo_connection["m101"]
people = db["people"]

person = {name: 'Barack Obama', role: 'President',
          address: {address1: 'The White House',
                    street: '1600 Pennsylvania Avenue',
                    state: 'DC',
                    city: 'Washington'},
          interests: ['government', 'basketball', 'the middle east']}

people.insert(person)
