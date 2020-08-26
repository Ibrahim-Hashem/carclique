# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: 'test@test.com', password: "123456", last_name: 'raheem', first_name: 'mohammed', address: 'address_test')
finance_provider = FinanceProvider.create(name: 'lloyds', address: 'provider_test')

Car.create([{make: 'bmw', model: 'M2', engine_size: 2, user: user, finance_provider: finance_provider, price: 20000.00}, {make: 'audi', model: 'A6', engine_size: 4, user: user, finance_provider: finance_provider, price: 15000.00}, {make: 'Mercades', model: 'C250', engine_size: 2.2, user: user, finance_provider: finance_provider, price: 30000.00}, {make: 'bmw', model: 'M4', engine_size: 4, user: user, finance_provider: finance_provider}, {make: 'bmw', model: 'M2', engine_size: 2, user: user, finance_provider: finance_provider, price: 13000.00}])

