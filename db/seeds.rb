# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

postal_codes = [
  # bishan
  "570173",
  "570168",
  "570177",
  "570178",
  "570174",

  # tampines
  "520259",
  "520260",
  "520261",
  "520262",
  "520499",

  # jurong
  "598380",
  "598381",
  "598382",
  "598383",
  "598384",

  # yishun
  "760201",
  "760202",
  "760207",
  "760208",
  "760209"
]

(0..19).each do |i|
  @s = Seller.create(name: "Test #{i}", email: "test#{i}@test.com", password: "123456", hp: "1122#{i}", address: "Blk 10#{i}", postal: postal_codes[i])

  Request.create(title: "request #{i}", seller_id: @s.id, items_attributes: [ {name: "item #{i}", qty: "#{i}kg", description: "desc #{i}"} ])
end
