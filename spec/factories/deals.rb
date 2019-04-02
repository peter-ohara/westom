FactoryBot.define do
  factory :deal do
    contact
    property
    type_of_service { [0, 1, 2, 3, 4, 5].sample }
    request_date { Faker::Date.between(5.years.ago, Date.today) }
    request_details { Faker::Lorem.paragraph }
    amount_cents { 1_000_000_000 }

    deadline do
      Faker::Date.between(request_date + 1.week, request_date + 3.months)
    end

    stage { [0, 1, 2, 3, 4, 5].sample }

    expiration_date do
      case type_of_service
      when 0 # acquisition_of_property
        request_date + 100.years
      when 1 # sale_of_property
        request_date + 100.years
      when 2 # rental_of_property
        request_date + 1.year
      when 3 # land_registration_or_search
        request_date + 100.years
      when 4 # due_diligence
        request_date + 100.years
      when 5 # property_management_services
        request_date + 1.year
      end
    end

  end
end
