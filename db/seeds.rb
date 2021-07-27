# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.find_or_create_by(email: "test@test.com", first_name: "Joe", last_name: "Joe")

location_1 = Location.find_or_create_by(name: "Japan")

restaurant_1 = Restaurant.find_or_create_by(name: "Sushi House", location: location_1)

meal_1 = Meal.find_or_create_by(name: "Dragon Roll", user: user_1, restaurant: restaurant_1)

review_1 = Review.find_or_create_by(title: "First Title", comment: "My First comment", rating: 5, meal: meal_1)