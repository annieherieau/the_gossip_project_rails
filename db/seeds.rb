# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
Faker::Config.locale='fr'
Faker::UniqueGenerator.clear

puts '----- start seed ------'
City.destroy_all
User.destroy_all

# reset tables
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
puts '-- clear and reset tables: ok --'


10.times do |i|
  City.create!(
    zip_code: Faker::Address.unique.zip_code,
    name: Faker::Address.city 
  )
end
puts '--- 10 cities ---'

10.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    age: rand(18..90),
    description: Faker::Lorem.paragraph(sentence_count: rand(2..4)),
    # foreign key
    city: City.all.sample
  )
end
puts '--- 10 users ---'

20.times do |i|
  g = Gossip.create!(
    title: Faker::Lorem.words(number: rand(3..8)).join(' '),
    content: Faker::Lorem.paragraph(sentence_count: rand(2..8)),
    # foreign key
    author: User.all.sample
  )
end
puts '--- 20 gossips avec 1 tag ---'