# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

puts 'seeding weird stuff'

Friend.delete_all
User.delete_all

5.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = 'password123'
  user.name = Faker::Name.name
  user.save
end

10.times do
  friend = Friend.new
  friend.name = Faker::Games::Pokemon.name
  friend.category = Faker::Creature::Animal.name
  friend.user = User.all.sample
  friend.price = rand(50..250)
  friend.description = Faker::TvShows::RickAndMorty.quote
  file_path = Faker::LoremFlickr.image(size: "200x200", search_terms: ['animal'])
  file = URI.open(file_path)
  friend.photo.attach(io: file, filename: "#{friend.name}-#{friend.user.name}", content_type: "image/jpg")
  friend.save
end

puts 'all done? see last created friend'
puts Friend.last.name
