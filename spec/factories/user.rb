FactoryBot.define do
  factory :user, aliases: [:broker] do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
