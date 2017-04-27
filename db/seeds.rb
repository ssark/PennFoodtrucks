# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# rate = Ratings.create(number: 0)
FoodTruck.create(name: 'Casablanca', cuisine: 'Middle Eastern', desc:'Casablanca continues the tradition started by Rosas of having Asian women cooking non-Asian food.', location: '36th and Spruce',  open: 11, close: 12)
FoodTruck.create(name: 'Tang', cuisine: 'Chinese', desc:'Great Chinese Foodtruck', location: '36th and Spruce', open: 12, close: 17)
FoodTruck.create(name: 'Lovash', cuisine: 'Indian', desc:'Great Indian Foodtruck', location: '37th and Spruce', open: 10, close: 23)