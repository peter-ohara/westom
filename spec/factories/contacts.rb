FactoryBot.define do
  factory :contact do
    full_name { Faker::Name.name }
    date_of_birth { Faker::Date.birthday }
    present_address { Faker::Address.full_address }
    community { "MyString" }
    length_of_stay_at_present_address { 1 }
    mobile { "MyString" }
    occupation { "MyString" }
    email { Faker::Internet.email }
    personal_property { false }
    jointly_owned_property { false }
    agent { false }
    has_authority_from_owner { false }
    has_site_plan { false }
    site_plan_request { false }
    search_report { false }
    search_report_request { false }
    valuation_report { false }
    valuation_report_request { false }
    type_of_service { 1 }
    request_details { "MyText" }
    request_date { "2019-03-28" }
    client_signature { "MyString" }
    broker
    signature_of_authorized_broker { "MyString" }
  end
end
