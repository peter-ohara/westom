# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

brokers = []

8.times { brokers.push FactoryBot.create :user }

me = User.create(first_name: 'Peter',
                 last_name: 'Adu',
                 email: 'ohara.invent@gmail.com',
                 password: 'password')
brokers.push me


start_of_year = Date.new(2019, 1, 1)
middle_of_year = Date.new(2019, 6, 30)
FactoryBot.create(:milestone,
                  title: 'Revenue milestone for 1st half of 2019',
                  start_date: start_of_year,
                  due_date: middle_of_year,
                  target_type: :revenue,
                  target: 6_000_000,
                  status: :active,
                  users: brokers[5..8])

FactoryBot.create(:milestone,
                  title: 'Deals milestone for 1st half of 2019',
                  start_date: start_of_year,
                  due_date: middle_of_year,
                  target_type: :deals,
                  target: 20,
                  status: :active,
                  users: brokers[5..8])


brokers[5..8].map do |broker|
  deal = FactoryBot.create :deal,
                           broker: broker,
                           stage: :closed,
                           date_of_closing: Faker::Date.between(start_of_year,
                                                                middle_of_year)

  3.times do
    FactoryBot.create :activity, deal: deal, broker: broker
  end

  rand(0..10).times do
    FactoryBot.create :deal, broker: broker
  end
end