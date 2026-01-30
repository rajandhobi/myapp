# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# city1 = City.create(name: "Ahmedabad", country: "India")
# city2 = City.create(name: "NewYork", country: "USA")

# Place.create(city: city1, name: "Sabarmati Riverfront", category: "Tourist Spot")
# Place.create(city: city1, name: "Alpha One Mall", category: "Shopping")

# Place.create(city: city2, name: "Times Square", category: "Landmark")
# Place.create(city: city2, name: "Central Park", category: "Park")
 
Product.create(name: "Laptop",     email: "lap@example.com",     price: 50000, stock: 10,  address: "Surat")
Product.create(name: "Mobile",     email: "mob@example.com",     price: 15000, stock: 0,   address: "Vadodara")
Product.create(name: "Keyboard",   email: "key@example.com",     price: 2000,  stock: 50,  address: "Surat")
Product.create(name: "Mouse",      email: "mouse@example.com",   price: 1000,  stock: 20,  address: "Rajkot")
Product.create(name: "Charger",    email: "chg@example.com",     price: 800,   stock: 5,   address: "Bhavnagar")
