# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
Car.destroy_all
User.destroy_all
# Examples:
require "open-uri"
file = URI.open('https://images.unsplash.com/photo-1553440569-bcc63803a83d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(email: 'test@test.com', password: "123456", last_name: 'raheem', first_name: 'mohammed', address: 'address_test')
finance_provider = FinanceProvider.create(name: 'lloyds', address: 'provider_test')


car1 = Car.new(make: 'bmw', model: 'M2', engine_size: 2, user: user, finance_provider: finance_provider, price: 20000, fuel_type: 'petrol', transmission: 'automatic', colour: 'blue', year: 2016)
car1.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
car1.save

file = URI.open('https://images.unsplash.com/photo-1553440569-bcc63803a83d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
car2 = Car.new(make: 'bmw', model: 'M4', engine_size: 4, user: user, finance_provider: finance_provider, price: 30000, fuel_type: 'petrol', transmission: 'automatic', colour: 'white', year: 2018)
car2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
car2.save

file = URI.open('https://images.unsplash.com/photo-1553440569-bcc63803a83d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
car3 = Car.new(make: 'audi', model: 'rs5', engine_size: 4, user: user, finance_provider: finance_provider, price: 40000, fuel_type: 'petrol', transmission: 'manual', colour: 'red', year: 2019)
car3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
car3.save

