require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

Faker::Config.locale = 'fr-CH'
puts 'clean the database'
Restaurant.destroy_all
Review.destroy_all
puts 'start the creation of the restaurant with reviews'
25.times do
  restaurant = Restaurant.create!(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: %w[chinese italian japanese french belgian].sample
  )
  rand(1..6).times do
    Review.create!(
      content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
      rating: rand(5),
      restaurant_id: restaurant.id
    )
  end
end
puts 'finish the creation of the restaurant'
