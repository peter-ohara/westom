FactoryBot.define do
  factory :contact do
    full_name { Faker::Name.name }
    date_of_birth { Faker::Date.birthday }
    present_address { Faker::Address.full_address }
    community { Faker::Address.community }
    length_of_stay_at_present_address { 1 }
    mobile { Faker::PhoneNumber.cell_phone }
    occupation { Faker::Job.title }
    email { Faker::Internet.email }
    personal_property { [true, false].sample }
    jointly_owned_property { [true, false].sample }
    agent { [true, false].sample }
    has_authority_from_owner { [true, false].sample }
    has_site_plan { [true, false].sample }
    site_plan_request { [true, false].sample }
    search_report { [true, false].sample }
    search_report_request { [true, false].sample }
    valuation_report { [true, false].sample }
    valuation_report_request { [true, false].sample }
    type_of_service { [0, 1, 2, 3, 4, 5].sample }
    request_details { Faker::Lorem.paragraph }
    request_date { Faker::Date.between(5.years.ago, Date.today) }
    client_signature { Faker::Lorem.word }
    signature_of_authorized_broker { Faker::Lorem.word }
    broker
  end
end
