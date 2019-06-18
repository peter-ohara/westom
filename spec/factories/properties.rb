FactoryBot.define do
  factory :property do
    description { "#{(1...9).to_a.sample} bedroom house at #{Faker::Address.community}" }
    location { Faker::Address.full_address }
    category { [0, 1].sample }
    price { rand(2000...1_000_000) }
    property_type { [0, 1, 2].sample }
    listing_type { [0, 1, 2].sample }
    negotiable { [true, false].sample }
    status { ['', 'Valued'].sample }
    owner
  end
end
