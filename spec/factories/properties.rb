FactoryBot.define do
  factory :property do
    name { "#{(1...9).to_a.sample} bedroom house at #{Faker::Address.community} with #{(1...9).to_a.sample} #{Faker::House.room}s and #{(1...9).to_a.sample} #{Faker::House.room}s" }
    description { Faker::Lorem.paragraph }
    location { Faker::Address.full_address }
    category { [0, 1].sample }
    property_type { [0, 1, 2].sample }
    contact
  end
end
