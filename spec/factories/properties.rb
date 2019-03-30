FactoryBot.define do
  factory :property do
    name { "#{Faker::Number.digit} bedroom house at #{Faker::Address.community} with #{Faker::Number.digit} #{Faker::House.room}s and #{Faker::Number.digit} #{Faker::House.room}s" }
    description { Faker::Lorem.paragraph }
    location { Faker::Address.full_address }
    category { [0, 1].sample }
    property_type { [0, 1, 2].sample }
    contact
  end
end
