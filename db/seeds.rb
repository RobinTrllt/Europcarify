# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  # create_table "agencies", force: :cascade do |t|
  #   t.string "name"
  #   t.string "address"
  #   t.string "email"
  #   t.string "phone_number"
  #   t.datetime "created_at", precision: 6, null: false
  #   t.datetime "updated_at", precision: 6, null: false
  #   t.float "latitude"
  #   t.float "longitude"
  # end

require 'faker'

puts "Cleaning database..."
Agency.destroy_all

puts "Creating agencies..."
  Agency.create!(
    name: "Agence Europcarify Lyon",
    address: "Gare Part-Dieu, 129 Blvd Vivier Merle 69003 Lyon",
    email: "lyon@europcarify.com",
    phone_number: "04.78.54.34.78",
    latitude: 45.75625254787445,
    longitude: 4.833068147689877
  )
  Agency.create!(
    name: "Agence Europcarify Paris",
    address: "Gare St Lazare, 129 Avenue Montaigne 75012 Paris",
    email: "paris@europcarify.com",
    phone_number: "01.98.32.14.03",
    latitude: 48.87630158479502,
    longitude: 2.325351192580696
  )

  Agency.create!(
    name: "Agence Europcarify Guéret",
    address: "5 Blvd Carnot, 23000 Guéret",
    email: "gueretcity@europcarify.com",
    phone_number: "05.77.14.04.80",
    latitude: 46.16931718975901,
    longitude: 1.8703433942767427
  )

puts "#{Agency.count} agencies created!"

puts "Creating vehicles..."
Agency.all.each do |agency|
  15.times do
    Vehicle.create!(
      agency: agency,
      price: rand(30..200),
      brand: Faker::Vehicle.manufacture,
      model: Faker::Vehicle.model,
      photo: Faker::LoremFlickr.image(search_terms: ['car']),
      genre: ["voiture", "utilitaire", "prestige"].sample,
      capacity: rand(2..10),
      fuel: ["essence", "diesel", "hybride", "électrique"].sample,
      ac: rand(2) == 1 ? true : false,
      doors: [2, 3, 4, 5].sample
    )
  end
end
puts "#{Vehicle.count} vehicles created!"
