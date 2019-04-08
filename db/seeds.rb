# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

brokers = []
clients = []
8.times { brokers.push FactoryBot.create :user }

brokers.each do |broker|
  rand(10...20).times do
    clients.push FactoryBot.create :contact, broker: broker
  end
end

clients.each do |client|
  rand(1...3).times do
    property = FactoryBot.create :property, contact: client
    rand(0..2).times do
      FactoryBot.create :deal, property: property, contact: clients.sample
    end
  end
end

User.create(first_name: 'Peter',
            last_name: 'Adu',
            email: 'ohara.invent@gmail.com',
            password: 'password')
