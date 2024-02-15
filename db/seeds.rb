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
require 'bcrypt'

puts '----- start seed ------'
City.destroy_all
User.destroy_all
GossipTag.destroy_all
Gossip.destroy_all
Tag.destroy_all
Team.destroy_all
Comment.destroy_all
Like.destroy_all




# reset tables
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
puts '-- clear and reset tables: ok --'

10.times do |i|
  City.create!(
    zip_code: Faker::Address.unique.zip_code,
    name: Faker::Address.unique.city 
  )
end
puts '--- 10 cities ---'

10.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: Faker::Lorem.characters[1..rand(8..16)], #mot de passe du user qui sera crypté dans password_hash
    age: rand(18..90),
    description: Faker::Lorem.paragraph(sentence_count: rand(2..4)),
    is_admin: false,
    # foreign key
    city: City.all.sample
  )
end
puts '--- 10 users ---'

10.times do |i|
  Tag.create!(
    title: Faker::Lorem.unique.word
  )
end
puts '--- 10 tags ---'

20.times do |i|
  
  g = Gossip.create!(
    title: Faker::Lorem.words(number: rand(2..3)).join(' ')[1..14],
    content: Faker::Lorem.paragraph(sentence_count: rand(5..12)),
    # foreign key
    author: User.all.sample
  )
  GossipTag.create!(
    gossip: g,
    tag: Tag.all.sample
  )
end
puts '--- 20 gossips avec 1 tag ---'

30.times do |i|
  tag = Tag.all.sample
  gossip = nil
  while gossip.nil? || gossip.tag_ids.include?(tag.id)
    gossip =  Gossip.all.sample 
  end

  GossipTag.create!(
    gossip: gossip,
    tag: tag
  )
end
puts '--- 20 tags suplémentaires ---'

30.times do |i|
  Comment.create!(
    content: Faker::Lorem.paragraph(sentence_count: rand(1..3)),
    commented_gossip: Gossip.all.sample,
    commenting_user: User.all.sample
  )
end
puts '--- 30 comments ---'

10.times do |i|
  Like.create!(
    user: User.all.sample,
    gossip: Gossip.all.sample,
  )
end
10.times do |i|
  Like.create!(
    user: User.all.sample,
    comment: Comment.all.sample,
  )
end
puts '--- 20 likes ---'