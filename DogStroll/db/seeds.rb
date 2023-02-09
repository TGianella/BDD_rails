# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

100.times do |_i|
  City.create(name: Faker::Address.city)

  Dogsitter.create(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   city: City.all.sample)

  Dog.create(name: Faker::Creature::Dog.name,
             breed: Faker::Creature::Dog.breed,
             city: City.all.sample)
end

1000.times do |_i|
  Stroll.create(city: City.all.sample,
                date: Faker::Date.in_date_period,
                dogsitter: Dogsitter.all.sample)
  rand(1..5).times do |_j|
    Stroll.last.dogs << Dog.all.sample
  end
end
