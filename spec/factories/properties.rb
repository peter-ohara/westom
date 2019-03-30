FactoryBot.define do
  factory :property do
    name { "MyString" }
    description { "MyText" }
    location { Faker::Address.full_address }
    category { 1 }
    property_type { 1 }
    contact { nil }
  end
end
