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

brokers.each do |_broker|
  rand(10...20).times do
    clients.push FactoryBot.create :contact
  end
end

clients.each do |client|
  rand(1...3).times do
    property = FactoryBot.create :property, contact: client
    rand(0..2).times do
      deal = FactoryBot.create :deal, property: property, contact: clients.sample

      3.times do
        FactoryBot.create :activity, deal: deal, broker: deal.broker
      end
    end
  end
end

User.create(first_name: 'Peter',
            last_name: 'Adu',
            email: 'ohara.invent@gmail.com',
            password: 'password')

start_of_year = Date.new(2019, 1, 1)
middle_of_year = Date.new(2019, 6, 30)
FactoryBot.create(:milestone,
                  title: 'Revenue milestone for 1st half of 2019',
                  start_date: start_of_year,
                  due_date: middle_of_year,
                  target_type: :revenue,
                  target: 6_000_000,
                  status: :active,
                  users: brokers[0..3])

FactoryBot.create(:milestone,
                  title: 'Deals milestone for 1st half of 2019',
                  start_date: start_of_year,
                  due_date: middle_of_year,
                  target_type: :deals,
                  target: 20,
                  status: :active,
                  users: brokers[0..3])

brokers[0..3].map do |broker|
  deal = FactoryBot.create :deal,
                           broker: broker,
                           stage: :closed,
                           date_of_closing: Faker::Date.between(start_of_year,
                                                                middle_of_year)

  3.times do
    FactoryBot.create :activity, deal: deal, broker: broker
  end
end
