require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

Faker::Config.locale = 'fr-CH'
puts 'clean the database'
Restaurant.destroy_all
puts 'start the creation of the restaurant'
25.times do
  Restaurant.create!(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: %w[chinese italian japanese french belgian].sample
  )
end
puts 'finish the creation of the restaurant'
