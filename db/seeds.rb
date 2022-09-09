# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"


i = 1

100.times do
  user = "user#{i}"
  user = User.new(email:Faker::Internet.email, name:Faker::Name.first_name, password: 123456789)
  user.save!
  i += 1

  trip = Trip.find(41)
  trip2 = Trip.find(31)

  user.favorite(trip)
  user.favorite(trip2)
end







# category = ["culture", "shopping", "food", "nature", "leisure", "sport"].sample
# travellers = rand(1..10)
# children = rand(1..5)
# pets = [true, false].sample


# 10.times do
#   trip = "trip#{i}"
#   trip = Trip.new(user_id: 1, name: Faker::Fantasy::Tolkien.location, description: Faker::Fantasy::Tolkien.poem, categories: "#{category}", amount_of_travellers: "#{travellers}", amount_of_children: "#{children}", pets: "#{pets}")
#   trip.main_image.attach(io: URI.open("https://source.unsplash.com/random/500x300/?city"), filename: "")
#   trip.save!
#   i += 1
# end
