# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Supplier.all.empty?
  Supplier.create({name: 'Supplier', email: 'supplier@example.com', password: 'password', password_confirmation: 'password', category: 'School'})
  puts "Created default supplier"
end

if Seller.all.empty?
  puts "Created default seller"
  Seller.create({name:'Seller', email: 'seller@example.com', password: 'password', password_confirmation: 'password'})
end

if Buyer.all.empty?
  puts "Created default buyer"
  Buyer.create({name:'Buyer', email: 'buyer@example.com', password: 'password', password_confirmation: 'password'})
end