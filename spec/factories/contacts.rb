FactoryBot.define do
  factory :contact, aliases: [:owner] do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    mobile { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }

    date_of_birth { Faker::Date.birthday }
    present_address { Faker::Address.full_address }

    notes { Faker::Lorem.paragraph }
  end
end
